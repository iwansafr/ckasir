<?php
$form = new Zea();
$form->setId($this->input->get('id'));
$form->init('edit');
$form->setTable('pelanggan');
$form->addInput('nama','text');
$form->addInput('jk','dropdown');
$form->setOptions('jk',['1'=>'Laki-laki','2'=>'Perempuan']);
$form->addInput('hp','text');
$form->addInput('alamat','textarea');

$form->setRequired('All');
$form->form();