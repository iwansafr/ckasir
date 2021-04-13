<?php

if(!empty($produk))
{
	$form = new Zea();

	$form->init('edit');

	$form->setId($produk_stock_id);
	$form->setTable('produk_stock');
	$form->addInput('produk_id','dropdown');
	$form->removeNone('produk_id');
	$form->setLabel('produk_id','Barang');
	$form->tableOptions('produk_id','produk','id','nama','id = '.$produk['id']);

	if(!$produk_stock_id)
	{
		$form->addInput('stock_start','static');
		$form->setValue('stock_start', $produk['stock']);
	}

	$form->addInput('stock_end','text');
	$form->setType('stock_end','number');
	$form->setLabel('stock_end','Masukkan Stok sekarang');

	$form->form();

	if(!empty($_POST))
	{
		$this->db->update('produk',['stock'=>$_POST['stock_end']],['id'=>$produk['id']]);
	}
}else{
	msg('Data tidak ditemukan','danger');
}