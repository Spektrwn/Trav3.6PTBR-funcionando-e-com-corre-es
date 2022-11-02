<?php
include("next.tpl");
?>
<div id="build" class="gid38"><a href="#" onClick="return Popup(38,4);" class="build_logo">
	<img class="building g38" src="img/x.gif" alt="Grande Armazém" title="Grande Armazém" />
</a>
<h1>Grande Armazém <span class="level">Nível <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc">Madeira, barro e ferro são guardados no armazém. O grande armazém oferece-lhe mais espaço e mantém seus bens mais secos e mais seguros do que o normal.</p>


	<table cellpadding="1" cellspacing="1" id="build_value">
	<tr>
		<th>Capacidade atual:</th>
		<td><b><?php echo $bid38[$village->resarray['f'.$id]]['attri']*STORAGE_MULTIPLIER; ?></b> Unidades de recurso</td>
	</tr>
	<tr>
<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
		$next = $village->resarray['f'.$id]+1+$loopsame+$doublebuild+$master;
		if($next<=20){
        ?>
		<th>Capacidade ao nível <?php echo $next ?>:</th>
		<td><b><?php echo $bid38[$next]['attri']*STORAGE_MULTIPLIER; ?></b> Unidades de recurso</td>
        <?php
            }else{
		?>
		<th>Capacidade ao nível 20:</th>
		<td><b><?php echo $bid38[20]['attri']*STORAGE_MULTIPLIER; ?></b> Unidades de recurso</td>
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
