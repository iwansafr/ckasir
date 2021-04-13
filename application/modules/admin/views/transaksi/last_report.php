<?php if (!empty($data)): ?>
	<div class="panel panel-default">
		<div class="panel-heading">
			
		</div>
		<div class="panel-body">
			<h2>Report Penjualan Terakhir</h2>
				<table class="table">
					<thead>
						<th>No</th>	
						<th>Kode</th>	
						<th>Tgl</th>	
						<th>Petugas</th>	
						<th>Pelanggan</th>	
						<th>Produk</th>	
						<th>Harga</th>	
						<th>Qty</th>	
						<th>Total</th>	
					</thead>
					<tbody>
						<?php $no = 1; ?>
						<?php $subtotal = 0; ?>
						<?php foreach ($data as $key => $value): ?>
							<?php $subtotal += $value['total'] ?>
							<tr>
								<td><?= $no++; ?></td>
								<td><?= $value['kode'] ?></td>
								<td><?= $value['tgl'] ?></td>
								<td><?= $value['petugas'] ?></td>
								<td><?= $value['pelanggan'] ?></td>
								<td><?= $value['produk'] ?></td>
								<td><?= $value['harga'] ?></td>
								<td><?= $value['qty'] ?></td>
								<td><?= $value['total'] ?></td>
							</tr>
						<?php endforeach ?>
						<tr>
							<td colspan="8" align="right">Sub Total</td>
							<td><?= $subtotal ?></td>
						</tr>
					</tbody>
				</table>
		</div>
		<div class="panel-footer"></div>
	</div>
<?php endif ?>
<?php if (!empty($print)): ?>
	<style>
		.table{
			width: 100%;
			border: 1px black solid;
		}
		td{
			border: 1px black solid;
		}
		tbody{
			text-align: center;
			/*border: 1px black solid;*/
		}
	</style>
	<script>
		window.print();
		window.onfocus=function(){ window.close();}
	</script>
<?php endif ?>