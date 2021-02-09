<?php
$kategori_list = new Zea();
$kategori_list->init('roll');
$kategori_list->search();
$kategori_list->setNumbering(true);
$kategori_list->addInput('id','hidden');
$kategori_list->setTable('suplier');
$kategori_list->addInput('nama','plaintext');
$kategori_list->addInput('hp','plaintext');
$kategori_list->addInput('alamat','plaintext');

$kategori_list->setEdit(true);
$kategori_list->setDelete(true);
$kategori_list->setUrl('admin/suplier/clear_list');

$kategori_list->form();