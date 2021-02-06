<?php
$form = new Zea();
$form->setId($this->input->get('id'));
$form->init('edit');
$form->setTable('kategori');
$form->addInput('nama','text');
$form->addInput('keterangan','textarea');

$form->setRequired('All');
$form->form();