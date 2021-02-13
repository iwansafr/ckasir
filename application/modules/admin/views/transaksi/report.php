<div class="panel panel-default">
	<form action="" method="get">
		<div class="panel-heading">
			Report Penjualan
		</div>
		<div class="panel-body">
			<div class="form-group">
				<label for="tgl">Tgl</label>
				<input type="date" class="form-control" value="<?= !empty($_GET['tgl']) ? $_GET['tgl'] : '' ?>" name="tgl" required>
			</div>
		</div>
		<div class="panel-footer">
			<button class="btn btn-primary"><i class="fa fa-search"></i> Tampilkan</button>
		</div>
	</form>
</div>
<?php if (!empty($data)): ?>
	<div class="panel panel-default">
		<div class="panel-heading">
			<form action="<?= base_url('admin/transaksi/transaksi_report') ?>" method="get" target="_blank" no_load="no_load">
				<input type="hidden" name="tgl" value="<?= $_GET['tgl'] ?>">
				<button type="submit" class="btn btn-success">Export Excel</button>
			</form>
		</div>
		<div class="panel-body">
			<?php $this->load->view('report_view') ?>
		</div>
		<div class="panel-footer"></div>
<?php endif ?>
</div>