<?php

class Produk_model extends CI_Model
{
	public function update_stock($id = 0)
	{
		if(!empty($_POST) && !empty($id))
		{
			$post = $_POST;
			$produk_stock = $this->db->query('SELECT * FROM produk_stock WHERE produk_id = ? AND DATE(time) = CURRENT_DATE', $id)->row_array();
			if(!empty($produk_stock))
			{
				$this->db->query('UPDATE produk_stock SET stock_end = stock_end + ? WEHRE id = ?',[intval($post['stock']), $id]);
			}else{
				$this->db->insert('produk_stock',[
					'produk_id' => $id,
					'stock_start' => $post['stock'],
					'stock_end' => $post['stock'],
				]);
			}
		}
	}

	public function batch_update_stock($data = array())
	{
		if(!empty($data))
		{
			foreach ($data as $key => $value) {
				$this->db->query('UPDATE produk_stock SET stock_end = ? WHERE produk_id = ? AND DATE(time) = CURRENT_DATE',[intval($value['stock']), $value['id']]);
			}
		}
	}
}