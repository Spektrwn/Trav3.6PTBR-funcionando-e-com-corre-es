<?php
include("next.tpl");
?>
<div id="build" class="gid39"><a href="#" onClick="return Popup(39,4);" class="build_logo">
	<img class="building g39" src="img/x.gif" alt="Grande Celeiro" title="Grande Celeiro" />
</a>
<h1>Grande Celeiro <span class="level">Nível <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc">Os cereais produzido pelos seus campos de cereais são armazenados no celeiro. O grande celeiro oferece-lhe mais espaço e mantém as suas culturas mais secas e mais seguras do que o normal.</p>


	<table cellpadding="1" cellspacing="1" id="build_value">
	<tr>
		<th>Capacidade atual:</th>
		<td><b><?php echo $bid39[$village->resarray['f'.$id]]['attri']*STORAGE_MULTIPLIER; ?></b> Unidades de cereal</td>
	</tr>
    
	<tr>
<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
		$next = $village->resarray['f'.$id]+1+$loopsame+$doublebuild+$master;
		if($next<=20){
        ?>
		<th>Capacidade ao nível <?php echo $next ?>:</th>
		<td><b><?php echo $bid39[$next]['attri']*STORAGE_MULTIPLIER; ?></b> Unidades de cereal</td>
        <?php
            }else{
		?>
		<th>Capacidade ao nível 20:</th>
		<td><b><?php echo $bid39[20]['attri']*STORAGE_MULTIPLIER; ?></b> Unidades de cereal</td>
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
