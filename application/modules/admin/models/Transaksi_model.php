<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Transaksi_model extends CI_Model
{
	public function report_day($date)
	{
		if(!empty($date))
		{
			$data = $this->db->query('SELECT u.username AS petugas, p.nama AS pelanggan, t.id,t.kode,t.total AS subtotal,d.produk_id,d.nama AS produk,d.qty,d.harga,d.total FROM produk_transaksi AS t INNER JOIN transaksi_detail AS d ON(d.transaksi_id=t.id) INNER JOIN pelanggan AS p ON(p.id=t.pelanggan_id) INNER JOIN user AS u ON(u.id=t.user_id) WHERE DATE(t.created) = ? ', $date)->result_array();
			return $data;
		}
	}
}
