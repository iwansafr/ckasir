<div class="panel panel-default">
	<form action="" method="post" class="load_link">
		<div class="panel-heading">
			Transaksi
		</div>
		<div class="panel-body">
			<?php if (!empty($msg)): ?>
				<div class="alert alert-<?php echo $msg['alert'];?>">
					<?= $msg['msg'] ?>
				</div>
			<?php endif ?>
			<div class="form-group">
				<label for="produk">Produk</label>
				<?= form_dropdown([
					'name'=>'produk_id',
					'options'=>$produk,
					'class'=>'form-control select2',
					'required'=>'required',
					'selected'=>$this->input->post('produk_id')
				]) ?>
			</div>
			<div class="form-group">
				<label for="qty">Qty</label>
				<input type="number" class="form-control" value="<?= !empty($this->input->post('qty')) ? $this->input->post('qty') : 1; ?>" min="1" name="qty" required="required">
			</div>
		</div>
		<div class="panel-footer">
			<button type="submit" class="btn btn-sm btn-success"><i class="fa fa-save"></i> Tambah</button>
		</div>
	</form>
</div>