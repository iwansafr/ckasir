<div class="row">
	<div class="col-md-4">
		<a href="<?= base_url('admin/suplier') ?>" class="btn btn-sm btn-warning pull-right"><i class='fa fa-refresh'></i> Refresh</a>
		<?php $this->load->view('suplier/edit') ?>
	</div>
	<div class="col-md-8">
		<?php $this->load->view('suplier/list') ?>
	</div>
</div>