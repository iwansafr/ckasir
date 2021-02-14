<?php
$form = new Zea();
$form->setId($this->input->get('id'));
$form->init('edit');
$form->setTable('produk');
$form->addInput('nama','text');
$form->addInput('kategori_id','dropdown');
$form->setLabel('kategori_id','kategori');
$form->tableOptions('kategori_id','kategori','id','nama');
$form->addInput('gambar','file');
$form->setAccept('gambar','.jpg,.jpeg,.png');
if(role_is('admin') || role_is('root') || role_is('owner'))
{
	$form->addInput('harga_beli','text');
	$form->setType('harga_beli','number');
	$form->setLabel('harga_beli','harga dasar');
	$form->addInput('harga_jual','text');
	$form->setType('harga_jual','number');
}
$form->addInput('stock','text');
$form->setType('stock','number');
$form->setAttribute('stock',['min'=>0]);

$form->addInput('suplier_id','dropdown');
$form->setLabel('suplier_id','suplier');
$form->tableOptions('suplier_id','suplier','id','nama');

$form->setRequired(['nama','kategori_id','harga_beli','harga_jual','stock','suplier_id']);
$form->setFormName('produk_edit');
$form->form();