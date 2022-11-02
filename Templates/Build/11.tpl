<?php
include("next.tpl");
?>
<div id="build" class="gid11"><a href="#" onClick="return Popup(11,4);" class="build_logo">
	<img class="building g11" src="img/x.gif" alt="Celeiro" title="Celeiro" />
</a>
<h1>Celeiro <span class="level">Nível <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc">Os cereais produzida em seus campos são armazenadas no celeiro. Aumentando seu nível você aumenta a capacidade do celeiro.</p>


	<table cellpadding="1" cellspacing="1" id="build_value">
	<tr>
		<th>Capacidade atual:</th>
		<td><b><?php echo $bid11[$village->resarray['f'.$id]]['attri']*STORAGE_MULTIPLIER; ?></b> Unidades de cereais</td>
	</tr>
    
	<tr>
<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
		$next = $village->resarray['f'.$id]+1+$loopsame+$doublebuild+$master;
		if($next<=20){
        ?>
		<th>Capacidade ao nível <?php echo $next ?>:</th>
		<td><b><?php echo $bid11[$next]['attri']*STORAGE_MULTIPLIER; ?></b> Unidades de cereais</td>
        <?php
            }else{
		?>
		<th>Capacidade ao nível 20:</th>
		<td><b><?php echo $bid11[20]['attri']*STORAGE_MULTIPLIER; ?></b> Unidades de cereais</td>
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
