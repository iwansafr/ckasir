<div class="row">
	<div class="col-md-4">
		<a href="<?= base_url('admin/produk') ?>" class="btn btn-sm btn-warning pull-right"><i class='fa fa-refresh'></i> Refresh</a>
		<?php $this->load->view('produk/edit') ?>
	</div>
	<div class="col-md-8">
		<?php $this->load->view('produk/list') ?>
	</div>
</div>