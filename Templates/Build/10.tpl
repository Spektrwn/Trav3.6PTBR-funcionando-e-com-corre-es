<?php
include("next.tpl");
?>
<div id="build" class="gid10"><a href="#" onClick="return Popup(10,4);" class="build_logo">
	<img class="building g10" src="img/x.gif" alt="Armazém" title="Armazém" />
</a>
<h1>Armazém <span class="level">Nível <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc">Os recursos de madeira, barro e ferro são armazenados no armazém. Aumentando seu nível você aumenta a capacidade do seu armazém.</p>


	<table cellpadding="1" cellspacing="1" id="build_value">
	<tr>
		<th>Capacidade atual:</th>
		<td><b><?php echo $bid10[$village->resarray['f'.$id]]['attri']*STORAGE_MULTIPLIER; ?></b> Unidades de cada recurso</td>
	</tr>
	<tr>
<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
		$next = $village->resarray['f'.$id]+1+$loopsame+$doublebuild+$master;
		if($next<=20){
        ?>
		<th>Capacidade ao nível <?php echo $next ?>:</th>
		<td><b><?php echo $bid10[$next]['attri']*STORAGE_MULTIPLIER; ?></b> Unidades de cada recurso</td>
        <?php
            }else{
		?>
		<th>Capacidade ao nível 20:</th>
		<td><b><?php echo $bid10[20]['attri']*STORAGE_MULTIPLIER; ?></b> Unidades de cada recurso</td>
		<?php
			}
			}
        ?>
	</tr>
	</table>
 <?php 
include("upgrade.tpl");
?>
</p></div>
