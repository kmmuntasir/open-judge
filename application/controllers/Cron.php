<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Cron extends OJ_Controller {

	
	public $data = array();

	function __construct()
    {
        parent::__construct();
        $this->load->model("admin/m_admin");
    }
    //====================================//

    public function index()
    {
    	if($this->check_cron()) {
            echo 'Cron is currently running';
        }
        else {
            echo 'Cron is currently idle';
        }
    }

    public function check_cron() {
        return $this->m_admin->check_cron();
    }

    public function update_cron($status=0) {
        $cron = array('cron_status' => $status);
        $this->m_admin->update_cron($cron);
    }

    public function compiler_cron() {
        $limit = 100; // This is the total number of submissions will be processing at a time.
        if($this->check_cron()) {
            echo 'Another cron running';
            exit();
        }
        $this->update_cron(1); // Making the status 'running'
        $submissions = $this->m_admin->get_submissions_with_limit($limit);
        //$this->printer($submissions, true);
        if(!count($submissions)) echo 'No New Submission';
        foreach($submissions as $sub) {
            echo '<p>Submission '.$sub->submission_id.': ';
            $this->compile($sub->submission_id);
            echo '</p>';
        }
        $this->update_cron(); // Making the status 'stopped'
    }

    public function compile($submission_id) {
        $submission = $this->m_admin->get_single_submission($submission_id);
        $contest = $this->m_admin->get_single_contest($submission->contest_id);

        $user_id = $submission->user_id;
        $contest_id = $submission->contest_id;
        $problem_id = $submission->problem_id;
        $prob_count = $this->m_admin->get_prob_cont_count($contest_id);
        $order = $this->m_admin->get_prob_cont_order($contest_id, $problem_id);
        --$order;

        $prev_submissions = $this->m_admin->get_prev_submissions_by_user($user_id, $contest_id, $problem_id, $submission_id);
        //echo 'Prev: '.$prev_submissions.'<br /><br />';

        // Updating Total Solved for this problem
        $prob_cont_rel = $this->m_admin->get_prob_cont_rel($problem_id, $contest_id);
        $prob_cont_update = array();

        if($prev_submissions) {
            //checking if this problem is already solved by this user;
            if($this->m_admin->check_existing_solution($user_id, $contest_id, $problem_id)){
                echo 'Ignored';
                $sub = array();
                $sub['submission_status'] = 0;
                $sub['submission_result'] = 7;

                $aff = $this->m_admin->update_submission($submission_id, $sub);
                return 0;
            }
        }
        else {
            $prob_cont_update['prob_cont_tried'] = $prob_cont_rel->prob_cont_tried + 1;
        }

        $res = $this->__process($submission_id);
        $result = $res['result'];
        $time = $res['time'];
        $sub = array();
        $sub['submission_status'] = 0;
        $sub['submission_result'] = $result;
        $sub['submission_tle'] = $time;

        $aff = $this->m_admin->update_submission($submission_id, $sub);

        $current_rank = $this->m_admin->get_rank($user_id, $contest_id);
        $c_rank = explode(',', $current_rank->rank_details);
        $rank = array();

        $minute_diff = 0;
        if($result == 1) {
            // Updating Total Solved for this problem
            $prob_cont_update['prob_cont_solved'] = $prob_cont_rel->prob_cont_solved + 1;

            $rank['rank_solved'] = $current_rank->rank_solved + 1;
            // Calculating Penalty
            $second_diff = strtotime($submission->submission_time) - strtotime($contest->contest_start);
            $minute_diff = (int)($second_diff / 60);
            $penalty = ($prev_submissions * 20) + $minute_diff;
            $rank['rank_penalty'] = $current_rank->rank_penalty + $penalty;
        }

        $rank['rank_details'] = '';
        for($i = 0, $k=0; $k < $prob_count; $i += 3, ++$k) {
            if($i > 0) $rank['rank_details'] .= ',';
            if($k != $order)
                $rank['rank_details'] .= $c_rank[$i].','.$c_rank[$i+1].','.$c_rank[$i+2];
            else {
                $rank['rank_details'] .=  ($c_rank[$i]+1).',';
                if($result == 1) $rank['rank_details'] .= $minute_diff.','.$penalty;
                else $rank['rank_details'] .= $minute_diff.',0';
            }
        }

        $aff = $this->m_admin->update_rank($user_id, $contest_id, $rank);
        if($aff) {
            // Do nothing
            //echo 'OK';
        }
        else echo 'Failed to Process';

        //$this->printer($rank);

        $aff = $this->m_admin->update_prob_cont_rel($prob_cont_rel->prob_cont_rel_id, $prob_cont_update);

        // $new = $this->m_admin->new_submission_for_contest($contest_id);
        // if(count($new) > 0) {
        //     $temp_data['contest_status'] = 0;
        //     $aff = $this->m_admin->update_contest_status($contest_id, $temp_data);
        // }
    }


    public function check_contest_status() {
        echo 'Checking contest status';
        // Checking waiting contests
        $result = $this->m_admin->get_contest_status(-1);
        foreach($result as $key => $contest) {
            $start = new DateTime(date($contest->contest_start));
            $end = new DateTime(date($contest->contest_end));
            $now = new DateTime(date('Y-m-d H:i:s'));

            $data = array();

            if($now >= $start) {
                if($now >= $end) {
                    // Contest Ended
                    $data['contest_status'] = 2;
                }
                else {
                    // Contest Running
                    $data['contest_status'] = 1;

                    // Creating blank ranks for the contestants of that contest
                    $users = $this->m_admin->get_users_for_contest($contest->contest_id);
                    $count = $this->m_admin->get_prob_cont_count($contest->contest_id);
                    $rank = array();
                    foreach($users as $u_key => $user) {
                        $temp_rank = array();
                        $temp_rank['contest_id'] = $contest->contest_id;
                        $temp_rank['user_id'] = $user->user_id;
                        $temp_rank['rank_solved'] = 0;
                        $temp_rank['rank_penalty'] = 0;

                        $temp_rank['rank_details'] = '';
                        $first_flag = true;
                        for($i=0; $i<$count; ++$i) {
                            if($first_flag) {
                                $first_flag = false;
                            }
                            else {
                                $temp_rank['rank_details'] .= ',';
                            }
                            $temp_rank['rank_details'] .= '0,NA,0';
                        }
                        $rank[$u_key] = $temp_rank;
                    }
                    $aff = $this->m_admin->insert_batch_rank($rank);
                }
                $aff = $this->m_admin->update_contest_status($contest->contest_id, $data);
                $this->reorder_prob_for_cont($contest->contest_id);
            }
        }


        //Checking running updated contests
        $result = $this->m_admin->get_contest_status(0);
        foreach($result as $key => $contest) {
            $end = new DateTime(date($contest->contest_end));
            $now = new DateTime(date('Y-m-d H:i:s'));

            $data = array();

            if($now >= $end) {
                // Contest Ended
                $data['contest_status'] = 2;
                $aff = $this->m_admin->update_contest_status($contest->contest_id, $data);
            }

        }


        //Checking running due to update contests
        $result = $this->m_admin->get_contest_status(1);
        foreach($result as $key => $contest) {
            $end = new DateTime(date($contest->contest_end));
            $now = new DateTime(date('Y-m-d H:i:s'));

            $data = array();


            if($now >= $end) {
                // Contest Ended
                $data['contest_status'] = 2;
                $aff = $this->m_admin->update_contest_status($contest->contest_id, $data);
            }
            else {
                // Contest Running
            }

        }
    }
}
