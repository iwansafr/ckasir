<div class="panel panel-default">
	<div class="panel-header">
		<a href="<?= base_url('admin/transaksi/reset') ?>" class="btn btn-warning btn-sm"><i class="fa fa-refresh"></i> Reset</a>
	</div>
	<div class="panel-body">
		<table class="table">
			<thead>
				<th>No</th>
				<th>Barang</th>
				<th>qty</th>
				<th>Harga</th>
				<th>Total</th>
			</thead>
			<tbody>
				<?php if (!empty($order)): ?>
					<?php $no = 1; ?>
					<?php $total = 0; ?>
					<?php foreach ($order as $key => $value): ?>
						<tr>
							<td><?= $no++ ?></td>
							<td><?= $value['nama'] ?></td>
							<td><?= $value['qty'] ?></td>
							<td>Rp, <?= number_format($value['harga'],0,2,'.') ?></td>
							<td>Rp, <?= number_format($value['total'],0,2,'.') ?></td>
						</tr>
						<?php $total += $value['total'] ?>
					<?php endforeach ?>
					<tr>
						<td colspan="4" align="right">Sub Total</td>
						<td>Rp, <?= number_format($total,0,2,'.') ?></td>
					</tr>
				<?php endif ?>
			</tbody>
		</table>
		<?php if (!empty($pelanggan)): ?>
			<form action="" method="post">
				<div class="form-group">
					<label for="pelanggan">Pelanggan</label>
					<?= form_dropdown([
						'name'=>'pelanggan_id',
						'class'=>'form-control select2',
						'options'=>$pelanggan,
						'required'=>'required',
					]) ?>
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-sm btn-success"><i class="fa fa-save"></i> Simpan</button>
				</div>
			</form>
		<?php endif ?>
	</div>
</div>
