<div class="panel panel-default">
	<!-- <form action="<?= base_url('admin/transaksi/clear_form') ?>" method="post" class="load_link"> -->
	<form action="" method="post" class="load_link">
		<div class="panel-heading">
			Transaksi
		</div>
		<div class="panel-body">
			<div class="form-group">
				<label for="produk">Produk</label>
				<?= form_dropdown([
					'name'=>'produk_id',
					'options'=>$produk,
					'class'=>'form-control select2',
					'required'=>'required'
				]) ?>
			</div>
			<div class="form-group">
				<label for="qty">Qty</label>
				<input type="number" class="form-control" min="1" value="1" name="qty" required="required">
			</div>
		</div>
		<div class="panel-footer">
			<button type="submit" class="btn btn-sm btn-success"><i class="fa fa-save"></i> Tambah</button>
		</div>
	</form>
</div>
<?php
pr($session);

?>