<?php
$tgl = $this->input->get('tgl');
?>
<form>
	<div class="col-md-3">
		<div class="panel panel-default">
			<div class="panel-heading">
				Pilih Tanggal
			</div>
			<div class="panel-body">
				<div class="form-group">	
					<label>Tgl</label>
					<input type="date" name="tgl" class="form-control" value="<?php echo @$tgl ?>">
				</div>
			</div>
			<div class="panel-footer">
				<button>Submit</button>
			</div>
		</div>
	</div>
</form>

<?php

$form = new Zea();

$form->init('roll');

$form->setTable('produk_stock');
$form->addInput('id','hidden');
$form->setNumbering(true);

if(!empty($tgl))
{
	$form->setWhere(" DATE(time) = '{$tgl}'");
}
$form->addInput('produk_id','dropdown');
$form->tableOptions('produk_id','produk','id','nama');
$form->setAttribute('produk_id','disabled');
$form->setLabel('produk_id','Barang');
$form->addInput('stock_start','plaintext');
$form->addInput('stock_end','plaintext');
$form->addInput('time','plaintext');

$form->form();