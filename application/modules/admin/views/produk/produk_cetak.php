<?php if (!empty($data)): ?>
	<h2>Report Produk</h2>
	<table class="table">
		<thead>
			<th>NO</th>
			<th>Nama</th>
			<th>kategori</th>
			<th>suplier</th>
			<th>harga dasar</th>
			<th>harga jual</th>
			<th>stock</th>
		</thead>
		<tbody>
			<?php $no = 1; ?>
			<?php foreach ($data as $key => $value): ?>
				<tr>
					<td><?= $no++; ?></td>
					<td><?= $value['nama'] ?></td>
					<td><?= $value['kategori'] ?></td>
					<td><?= $value['suplier'] ?></td>
					<td><?= $value['harga_beli'] ?></td>
					<td><?= $value['harga_jual'] ?></td>
					<td><?= $value['stock'] ?></td>
				</tr>
			<?php endforeach ?>
		</tbody>
	</table>
	<style>
		.table{
			width: 100%;
		}
		tbody{
			text-align: center;
		}
		th{
			border: 1px solid black;
		}
		td{
			border: 1px solid black;
		}
	</style>
	<script>
		window.print();
		window.onfocus=function(){ window.close();}
	</script>
<?php endif ?>
