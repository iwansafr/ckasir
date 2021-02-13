<?php if (!empty($data)): ?>
<h2>Report Penjualan <?= content_date($_GET['tgl']) ?></h2>
	<table class="table">
		<thead>
			<th>No</th>	
			<th>Kode</th>	
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
					<td><?= $value['petugas'] ?></td>
					<td><?= $value['pelanggan'] ?></td>
					<td><?= $value['produk'] ?></td>
					<td><?= $value['harga'] ?></td>
					<td><?= $value['qty'] ?></td>
					<td><?= $value['total'] ?></td>
				</tr>
			<?php endforeach ?>
			<tr>
				<td colspan="7" align="right">Sub Total</td>
				<td><?= $subtotal ?></td>
			</tr>
		</tbody>
	</table>
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