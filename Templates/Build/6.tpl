<?php
include("next.tpl");
?>
<div id="build" class="gid6"><a href="#" onClick="return Popup(6,4);" class="build_logo">
	<img class="building g6" src="img/x.gif" alt="Alvenaria" title="Alvenaria" />
</a>
<h1>Alvenaria <span class="level">Nível <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc">A alvenaria converte a barro em tijolos. Baseado em seu nível sua alvenaria pode aumentar sua produção da barro por até 25 por cento.</p>


	<table cellpadding="1" cellspacing="1" id="build_value">
		<tr>
			<th>Bônus de barro atual:</th>
			<td><b><?php echo $bid6[$village->resarray['f'.$id]]['attri']; ?></b> Por cento</td>
		</tr>
		<tr>
		<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
		$next = $village->resarray['f'.$id]+1+$loopsame+$doublebuild+$master;
		if($next<=5){
        ?>
			<th>Bônus de barro ao nível <?php echo $next; ?>:</th>
			<td><b><?php echo $bid6[$next]['attri']; ?></b> Por cento</td>
            <?php
            }else{
        ?>
			<th>Bônus de barro ao nível 5:</th>
			<td><b><?php echo $bid6[5]['attri']; ?></b> Por cento</td>
            <?php
			}}
            ?>
		</tr>
	</table>
<?php 
include("upgrade.tpl");
?>
</p></div>