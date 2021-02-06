<?php
$kategori_list = new Zea();
$kategori_list->init('roll');
$kategori_list->search();
$kategori_list->setNumbering(true);
$kategori_list->addInput('id','hidden');
$kategori_list->setTable('kategori');
$kategori_list->addInput('nama','plaintext');
$kategori_list->addInput('keterangan','plaintext');

$kategori_list->setEdit(true);
$kategori_list->setDelete(true);
$kategori_list->setUrl('admin/kategori/clear_list');

$kategori_list->form();