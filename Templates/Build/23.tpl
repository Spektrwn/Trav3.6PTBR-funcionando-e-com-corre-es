<?php
include("next.tpl");
      		$artefact_2 = count($database->getOwnUniqueArtefactInfo2($session->uid,7,3,0));
			$artefact1_2 = count($database->getOwnUniqueArtefactInfo2($village->wid,7,1,1));
			$artefact2_2 = count($database->getOwnUniqueArtefactInfo2($session->uid,7,2,0));
			if($artefact_2 > 0){
			$artefact_bouns = 6;
			}else if($artefact1_2 > 0){
			$artefact_bouns = 3;
			}else if($artefact2_2 > 0){
			$artefact_bouns = 2;
			}else{
			$artefact_bouns = 1;
			}
			$good_effect = $bad_effect = 1;
			$foolartefact = $database->getFoolArtefactInfo(7,$village->wid,$seesion->uid);
			if(count($foolartefact) > 0){
			foreach($foolartefact as $arte){
			if($arte['bad_effect'] == 1){
			$bad_effect = $arte['effect2'];
			}else{
			$good_effect = $arte['effect2'];
			}
			}
			}
?>
<div id="build" class="gid23"><a href="#" onClick="return Popup(23,4);" class="build_logo">
	<img class="building g23" src="img/x.gif" alt="Esconderijo" title="Esconderijo" />
</a>
<h1>Esconderijo <span class="level">Nível <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc">O esconderijo é usado para ocultar pelo menos alguns de seus recursos quando a aldeia é atacada. Estes recursos não podem ser roubados.</p>


	<table cellpadding="1" cellspacing="1" id="build_value">
	<tr>
		<th>Unidades ocultas por recurso atualmente:</th>
<?php
		if($session->tribe == 3) {
		?>
		<td><b><?php echo $bid23[$village->resarray['f'.$id]]['attri']*2; ?></b> unidades</td>
		<?php
			}else{
		?>
		<td><b><?php echo $bid23[$village->resarray['f'.$id]]['attri']; ?></b> unidades</td>
		<?php
			}
		?>
	</tr>
	<tr>
<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
		if($next<=10){
        ?>
		<th>Unidades ocultas por recurso no nível <?php echo $village->resarray['f'.$id]+1+$loopsame+$doublebuild+$master; ?>:</th>
<?php
		if($session->tribe == 3) {
		?>
		<td><b><?php echo $bid23[$village->resarray['f'.$id]+1+$loopsame+$doublebuild+$master]['attri']*2*$artefact_bouns*$good_effect/$bad_effect; ?></b> unidades</td>
		<?php
			}else{
		?>
		<td><b><?php echo $bid23[$village->resarray['f'.$id]+1+$loopsame+$doublebuild+$master]['attri']*$artefact_bouns*$good_effect/$bad_effect; ?></b> unidades</td>
		<?php
			}}else{
        ?>
		<th>Unidades ocultas por recurso no nível 20:</th>
<?php
		if($session->tribe == 3) {
		?>
		<td><b><?php echo $bid23[10]['attri']*2*$artefact_bouns*$good_effect/$bad_effect; ?></b> unidades</td>
		<?php
			}else{
		?>
		<td><b><?php echo $bid23[10]['attri']*$artefact_bouns*$good_effect/$bad_effect; ?></b> unidades</td>
		<?php
			}}}
        ?>
	</tr>
	</table>
<?php 
include("upgrade.tpl");
?>
</p></div>