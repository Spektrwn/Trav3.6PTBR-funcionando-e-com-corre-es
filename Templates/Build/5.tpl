<?php
include("next.tpl");
?>
<div id="build" class="gid5"><a href="#" onClick="return Popup(5,4);" class="build_logo">
	<img class="building g5" src="img/x.gif" alt="Serraria" title="Serraria" />
</a>
<h1>Serraria <span class="level">Nível <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc">A madeira cortada no bosque é processada aqui. Com base em seu nível de sua serraria pode aumentar sua produção de madeira em até 25 por cento.</p>


	<table cellpadding="1" cellspacing="1" id="build_value">
		<tr>
			<th>Bônus de madeira atual:</th>
			<td><b><?php echo $bid5[$village->resarray['f'.$id]]['attri']; ?></b> Por cento</td>
		</tr>
		<tr>
		<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
		$next = $village->resarray['f'.$id]+1+$loopsame+$doublebuild+$master;
		if($next<=5){
        ?>
			<th>Bônus de madeira ao nível <?php echo $next; ?>:</th>
			<td><b><?php echo $bid5[$next]['attri']; ?></b> Por cento</td>
            <?php
            }else{
        ?>
			<th>Bônus de madeira ao nível 5:</th>
			<td><b><?php echo $bid5[5]['attri']; ?></b> Por cento</td>
            <?php
			}}
            ?>
		</tr>
	</table>
<?php 
include("upgrade.tpl");
?>
</p></div>