<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see http://codeigniter.com/user_guide/general/urls.html
	 */
	public function index()
	{
		// echo base_url();
		// echo '<br />'.site_url().'<br>';
		// echo $this->config->item('root');
		// echo '<pre>';
		// print_r($_SERVER);
		// echo '</pre>';
		// exit();
		//redirect(base_url('user/Dashboard'));
		redirect(site_url('user/Contest'));
	}
}
