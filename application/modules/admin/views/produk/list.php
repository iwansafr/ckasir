<?php
$produk_list = new Zea();
$produk_list->setHeading('<a href="'.base_url('admin/produk/produk_cetak').'" target="_blank" no_load="no_load" class="btn btn-sm btn-success"><i class="fa fa-print"></i> Cetak</a>');
$produk_list->init('roll');
$produk_list->search();
$produk_list->setNumbering(true);
$produk_list->setTable('produk');
$produk_list->addInput('id','plaintext');
$produk_list->setLabel('id','action');
$produk_list->setPlainText('id',[
	base_url('admin/produk/update_stock/{id}/update_stock') => 'Update Stok'
]);
$produk_list->addInput('nama','plaintext');
$produk_list->addInput('kategori_id','dropdown');
$produk_list->setAttribute('kategori_id','disabled');
$produk_list->setLabel('kategori_id','kategori');
$produk_list->tableOptions('kategori_id','kategori','id','nama');
$produk_list->addInput('gambar','thumbnail');
if(role_is('admin') || role_is('root') || role_is('owner'))
{
	$produk_list->addInput('harga_beli','plaintext');
	$produk_list->setMoney('harga_beli');
	$produk_list->setLabel('harga_beli','harga dasar');
	$produk_list->addInput('harga_jual','plaintext');
	$produk_list->setMoney('harga_jual');
}
$produk_list->addInput('stock','plaintext');

$produk_list->addInput('suplier_id','dropdown');
$produk_list->setAttribute('suplier_id','disabled');
$produk_list->setLabel('suplier_id','suplier');
$produk_list->tableOptions('suplier_id','suplier','id','nama');

$produk_list->setEdit(true);
$produk_list->setDelete(true);
$produk_list->setEditLink(base_url('admin/produk/edit/?id='),'id');
$produk_list->setUrl('admin/produk/clear_list');
$produk_list->setFormName('produk_list');

$produk_list->form();