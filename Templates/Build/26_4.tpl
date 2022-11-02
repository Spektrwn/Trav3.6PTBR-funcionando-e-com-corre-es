<div id="build" class="gid26"><h1>Palácio <span class="level">nível <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc">
	<a href="#" onClick="return Popup(26,4, 'gid');"
		class="build_logo"> <img
		class="building g26"
		src="img/x.gif" alt="Palácio"
		title="Palácio" /> </a>

O rei ou a rainha do império vive no palácio. Apenas um palácio pode existir em seu reino de cada vez. Você precisa de um palácio para proclamar uma vila para ser sua capital.

<?php include("26_menu.tpl"); ?>

<table cellpadding="1" cellspacing="1" id="expansion">
<thead><tr>
	<th colspan="6"><a name="h2"></a>Aldeias fundadas ou conquistadas por esta aldeia</th>
</tr>
<tr>
	<td colspan="2">Aldeia</td>
	<td>Jogador</td>
	<td>Habitantes</td>
	<td>Coordenadas</td>
	<td>Data</td>
</tr></thead>
<tbody>
<?php
$slot1 = $database->getVillageField($village->wid, 'exp1');
$slot2 = $database->getVillageField($village->wid, 'exp2');
$slot3 = $database->getVillageField($village->wid, 'exp3');

if($slot1 != 0 || $slot2 != 0 || $slot3 != 0){
	for($i=1; $i <= 3; $i++){
		if (${'slot'.$i}<>0) {
			$coor = $database->getCoor(${'slot'.$i});
			$vname = $database->getVillageField(${'slot'.$i},'name');
			$owner = $database->getVillageField(${'slot'.$i},'owner');
			$pop = $database->getVillageField(${'slot'.$i},'pop');
			$vcreated = $database->getVillageField(${'slot'.$i},'created');
			$ownername = $database->getUserField($owner,'username',0);
echo '
<tr>
<td class="ra">'.$i.'.</td>
<td class="vil"><a href="karte.php?d='.${'slot'.$i}.'&c='.$generator->getMapCheck(${'slot'.$i}).'">'.$vname.'</a></td>
<td class="pla"><a href="spieler.php?uid='.$owner.'">'.$ownername.'</a></td>
<td class="ha">'.$pop.'</td>
<td class="aligned_coords"><div class="cox">('.$coor['x'].'</div><div class="pi">|</div><div class="coy">'.$coor['y'].')</div></td>
<td class="dat">'.date('d-m-Y',$vcreated).'</td>
</tr>';
		}
	}
}
else{
echo '<tr><td colspan="6" class="none">Nenhuma outra aldeia foi fundada ou conquistada por esta aldeia ainda.</td></tr>';
}
?>
</tbody></table></div>
