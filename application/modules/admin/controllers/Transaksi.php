<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Transaksi extends CI_Controller
{
	var $my_session;
	var $last_id;
	var $produk;
	var $produk_tmp;
	var $order;
	var $pelaggan;
	public function __construct()
	{
		parent::__construct();
		$this->db->cache_off();
		$this->load->model('esg_model');
		$this->load->model('admin_model');
		// $this->load->model('admin_menu_model');
		$this->load->library('esg');
		$this->load->library('ZEA/zea');
		$this->esg_model->init();
	}
	public function index()
	{
		$this->form();
		$this->load->view('index',['last_id'=>$this->last_id,'session'=>$this->my_session,'produk'=>$this->produk,'order'=>$this->order,'pelanggan'=>$this->pelanggan]);
	}
	public function reset()
	{
		$data = ['produk','produk_tmp','transaksi','order'];
		foreach ($data as $value) {
			unset($_SESSION[base_url('_logged_in')][$value]);
		}
		redirect('admin/transaksi');
	}
	public function form()
	{
		$this->my_session = $this->session->userdata(base_url('_logged_in'));

		if(!empty($this->my_session['order']))
		{
			$this->order = $this->my_session['order'];
		}

		if(!empty($this->my_session['transaksi']['last_id'])){
			$this->last_id = $this->my_session['transaksi']['last_id'];
		}else{
			$this->last_id = $this->db->query('SELECT * FROM produk_transaksi WHERE DATE(created) = CURDATE() ORDER BY id DESC limit 1')->row_array();
			if(!empty($this->last_id)){
				$this->last_id = $this->last_id['kode'];
				// $this->last_id = substr($this->last_id,13,14);
				$last_id_tmp = explode('-',$this->last_id);
				$this->last_id = $last_id_tmp[3];
				$this->last_id = $this->last_id+1;
			}else{
				$this->last_id = 1;
			}
		}
		if(!empty($this->my_session['produk']))
		{
			$this->produk = $this->my_session['produk'];
		}else{
			$this->produk = [];
			$this->produk[''] = 'Pilih Produk';
			$produk_tmp = $this->db->get('produk')->result_array();
			if(!empty($produk_tmp))
			{
				foreach ($produk_tmp as $key => $value) {
					$this->produk_tmp[$value['id']] = $value;
				}
				foreach ($this->produk_tmp as $key => $value) {
					$this->produk[$value['id']] = $value['nama'].' | '.$value['harga_jual'];
				}
			}
			$this->my_session['produk'] = $this->produk;
			$this->my_session['produk_tmp'] = $this->produk_tmp;
		}
		if(!empty($this->my_session['produk_tmp']))
		{
			$this->produk_tmp = $this->my_session['produk_tmp'];
		}
		if(!empty($this->input->post()))
		{
			$produk_id                            = $this->input->post('produk_id');
			$qty                                  = $this->input->post('qty');
			if($qty <= $this->produk_tmp[$produk_id]['stock'])
			{
				$this->my_session['produk_tmp'][$produk_id]['stock'] = $this->my_session['produk_tmp'][$produk_id]['stock']-$qty;
				$this->order[$produk_id]['produk_id'] = $produk_id;
				$this->order[$produk_id]['qty']       = @intval($qty) + @intval($this->order[$produk_id]['qty']);
				$this->order[$produk_id]['nama']      = $this->produk_tmp[$produk_id]['nama'];
				$this->order[$produk_id]['harga']     = $this->produk_tmp[$produk_id]['harga_jual'];
				$this->order[$produk_id]['total']     = $this->order[$produk_id]['qty']*$this->order[$produk_id]['harga'];
				$this->my_session['order']            = $this->order;
			}else{
				?>
				<script>
					alert('jumlah barang tidak mencukupi');
				</script>
				<?php
			}
		}
		$this->pelanggan = [];
		if(!empty($this->order))
		{
			$this->pelanggan[''] = 'Pilih pelanggan';
			$pelanggan_tmp = $this->db->get('pelanggan')->result_array();
			if(!empty($pelanggan_tmp))
			{
				foreach ($pelanggan_tmp as $key => $value) {
					$this->pelanggan[$value['id']] = $value['nama'];
				}
			}
			$this->my_session['produk_tmp'] = $this->produk_tmp;
		}
		$this->my_session['transaksi'] = [];
		$this->my_session['transaksi']['last_id'] = $this->last_id;
		$kode = 'T-'.date('Ymd').'-'.$this->my_session['id'].'-'.$this->last_id;
		$this->my_session['transaksi']['kode'] = $kode;
		$this->session->set_userdata(base_url('_logged_in'), $this->my_session);
	}
	public function clear_form()
	{
		$this->form();
		$this->load->view('transaksi/index',['last_id'=>$this->last_id,'session'=>$this->my_session,'produk'=>$this->produk,'order'=>$this->order,'pelanggan'=>$this->pelanggan]);
	}
	public function save()
	{
		$transaksi = $this->input->post();
		$user = $this->session->userdata(base_url('_logged_in'));
		$post_transaksi = $user['transaksi'];
		$post_order = $user['order'];
		$transaksi['kode'] = $post_transaksi['kode'];
		$transaksi['user_id'] = $user['id'];
		$transaksi['total'] = 0;
		$update_stock = [];
		// pr($user['produk_tmp']);
		foreach ($post_order as $key => $value) {
			$transaksi['total'] += @intval($value['total']);
			$update_stock[$key]['id'] = $value['produk_id'];
			$update_stock[$key]['stock'] = intval($user['produk_tmp'][$key]['stock'])-intval($value['qty']);
		}
		// pr($update_stock);
		if($this->db->insert('produk_transaksi',$transaksi))
		{
			$last_id = $this->db->insert_id();
			$transaksi_detail = [];
			foreach ($post_order as $key => $value) {
				$transaksi_detail[$key] = $value;
				$transaksi_detail[$key]['transaksi_id'] = $last_id;
			}
			if($this->db->insert_batch('transaksi_detail',$transaksi_detail) && $this->db->update_batch('produk',$update_stock,'id'))
			{
				$this->reset();
			}
		}
	}
}