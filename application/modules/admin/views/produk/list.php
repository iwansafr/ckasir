<?php
$produk_list = new Zea();
$produk_list->init('roll');
$produk_list->search();
$produk_list->setNumbering(true);
$produk_list->setTable('produk');
$produk_list->addInput('id','hidden');
$produk_list->addInput('nama','plaintext');
$produk_list->addInput('kategori_id','dropdown');
$produk_list->setAttribute('kategori_id','disabled');
$produk_list->setLabel('kategori_id','kategori');
$produk_list->tableOptions('kategori_id','kategori','id','nama');
$produk_list->addInput('gambar','thumbnail');
$produk_list->addInput('harga_beli','plaintext');
$produk_list->setMoney('harga_beli');
$produk_list->setLabel('harga_beli','harga dasar');
$produk_list->addInput('harga_jual','plaintext');
$produk_list->setMoney('harga_jual');
$produk_list->addInput('stock','plaintext');

$produk_list->addInput('suplier_id','dropdown');
$produk_list->setAttribute('suplier_id','disabled');
$produk_list->setLabel('suplier_id','suplier');
$produk_list->tableOptions('suplier_id','suplier','id','nama');

$produk_list->setEdit(true);
$produk_list->setDelete(true);
$produk_list->setUrl('admin/produk/clear_list');
$produk_list->setFormName('produk_list');

$produk_list->form();