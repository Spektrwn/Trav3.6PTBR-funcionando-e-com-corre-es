<?php
include("next.tpl");
?>
<div id="build" class="gid35"><a href="#" onClick="return Popup(35,4);" class="build_logo">
	<img class="building g35" src="img/x.gif" alt="Cervejaria" title="Cervejaria" />
</a>
<h1>Cervejaria <span class="level">Nível <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc">Um hidromel saboroso é fabricado na cervejaria e mais tarde saboreado pelos soldados durante as celebrações.</p>


	<table cellpadding="1" cellspacing="1" id="build_value">
		<tr>
			<th>Bônus atual:</th>
			<td><b><?php echo $bid35[$village->resarray['f'.$id]]['attri']; ?></b> Por cento</td>
		</tr>
		<tr>
		<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
		$next = $village->resarray['f'.$id]+1+$loopsame+$doublebuild+$master;
		if($next<=10){
        ?>
			<th>Bônus atual ao nível <?php echo $next; ?>:</th>
			<td><b><?php echo $bid35[$next]['attri']; ?></b> Por cento</td>
            <?php
            }else{
        ?>
			<th>Bônus atual ao nível 10:</th>
			<td><b><?php echo $bid35[10]['attri']; ?></b> Por cento</td>
            <?php
			}}
            ?>
		</tr>
	</table>
<?php 
include("upgrade.tpl");
?>
</p></div>