<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Produk extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->db->cache_off();
		$this->load->model('esg_model');
		$this->load->model('admin_model');
		$this->load->model('produk_model');
		$this->load->model('admin_menu_model');
		$this->load->library('esg');
		$this->load->library('ZEA/zea');
		$this->esg_model->init();
	}

	public function index()
	{
		$this->esg->add_js(['https://unpkg.com/sweetalert/dist/sweetalert.min.js',base_url('assets/js/script.js')]);
		$this->load->view('index');
	}
	public function edit()
	{
		$this->load->view('index');
	}
	public function clear_list()
	{
		$this->load->view('produk/index');
	}
	public function produk_cetak()
	{
		$data = $this->db->query('SELECT p.*,s.nama AS suplier, k.nama AS kategori FROM produk AS p LEFT JOIN suplier AS s ON(p.suplier_id = s.id) LEFT JOIN kategori AS k ON(k.id=p.kategori_id) ORDER BY id DESC')->result_array();
		$this->load->view('produk/produk_cetak',['data'=>$data]);
	}
}