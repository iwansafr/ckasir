<div class="row">
	<div class="col-md-4">
		<a href="<?= base_url('admin/pelanggan') ?>" class="btn btn-sm btn-warning pull-right"><i class='fa fa-refresh'></i> Refresh</a>
		<?php $this->load->view('pelanggan/edit') ?>
	</div>
	<div class="col-md-8">
		<?php $this->load->view('pelanggan/list') ?>
	</div>
</div>