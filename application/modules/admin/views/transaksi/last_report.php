<?php if (!empty($data)): ?>
	<div class="panel panel-default">
		<div class="panel-heading">
			<form action="<?= base_url('admin/transaksi/last_report_print') ?>" method="get" target="_blank" no_load="no_load">
				<button type="submit" class="btn btn-success"><i class="fa fa-print"></i> cetak</button>
			</form>
		</div>
		<div class="panel-body">
			<?php $this->load->view('transaksi/last_report_view') ?>
		</div>
		<div class="panel-footer"></div>
	</div>
<?php endif ?>