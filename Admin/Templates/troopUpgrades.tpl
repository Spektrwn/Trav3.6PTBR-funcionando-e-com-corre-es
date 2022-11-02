<table id="member">
	<thead>
		<tr>
			<th colspan="16">Melhorias da Tropas</th>
		</tr>
		<tr>
			<td colspan="8">Armadura</td>
			<td colspan="8">Armas</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<?php
				$tribe = $user['tribe'];
				if($tribe ==1){ $img = ""; }
				if($tribe ==2){ $img = "1";}
				if($tribe ==3){ $img = "2";}
				for($i=1; $i<9; $i++)
				{
					echo '<td><center><img src="../img/un/u/'.$img.''.$i.'.gif"></center></td>';
				}
				for($i=1; $i<9; $i++)
				{
					echo '<td><center><img src="../img/un/u/'.$img.''.$i.'.gif"></center></td>';
				}
			?>
		</tr>
	</tbody>
	<tfoot>
		<tr>
			<?php
				##A
				for($i=1; $i<9; $i++)
				{
					echo '<td><center>'.$aupgrades['$i.'].'</center></td>';
				} ##B
				for($i=1; $i<9; $i++)
				{
					echo '<td><center>'.$bupgrades['$i'].'</center></td>';
				}
			?>
		</tr>
	</tfoot>
</table>
<a href="#">Editar Melhorias da Tropas</a>