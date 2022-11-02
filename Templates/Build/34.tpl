<?php
include("next.tpl");
?>
<div id="build" class="gid34"><a href="#" onClick="return Popup(34,4);" class="build_logo">
	<img class="building g34" src="img/x.gif" alt="Alojamento do pedreiro" title="Alojamento do pedreiro" />
</a>
<h1>Alojamento do pedreiro <span class="level">Nível <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc">A pousada do pedreiro é um especialista em corte de pedra. Quanto mais o edifício é estendido, maior a estabilidade dos edifícios da aldeia.</p>


	<table cellpadding="1" cellspacing="1" id="build_value">
		<tr>
			<th>Bônus de estabilidade atual:</th>
			<td><b><?php echo $bid34[$village->resarray['f'.$id]]['attri']; ?></b> Por cento</td>
		</tr>
		<tr>
		<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
		$next = $village->resarray['f'.$id]+1+$loopsame+$doublebuild+$master;
		if($next<=20){
        ?>
			<th>Bônus de estabilidade no nível <?php echo $next; ?>:</th>
			<td><b><?php echo $bid34[$next]['attri']; ?></b> Por cento</td>
            <?php
            }else{
        ?>
			<th>Bônus de estabilidade no nível 20:</th>
			<td><b><?php echo $bid34[20]['attri']; ?></b> Por cento</td>
            <?php
			}}
            ?>
		</tr>
	</table>
<?php 
include("upgrade.tpl");
?>
</p></div>