<?php
include("next.tpl");
?>
<div id="build" class="gid9"><a href="#" onClick="return Popup(9,4);" class="build_logo">
	<img class="building g9" src="img/x.gif" alt="Padaria" title="Padaria" />
</a>
<h1>Padaria <span class="level">Nível <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc">A padaria transforma a farinha em pão. Em conjunto com o moínho, o aumento da produção de cereal pode chegar a 50% no total.</p>


	<table cellpadding="1" cellspacing="1" id="build_value">
		<tr>
			<th>Bônus de cereal atual:</th>
			<td><b><?php echo $bid9[$village->resarray['f'.$id]]['attri']; ?></b> Por cento</td>
		</tr>
		<tr>
		<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
		$next = $village->resarray['f'.$id]+1+$loopsame+$doublebuild+$master;
		if($next<=5){
        ?>
			<th>Bônus de cereal ao nível<?php echo $next; ?>:</th>
			<td><b><?php echo $bid9[$next]['attri']; ?></b> Por cento</td>
            <?php
            }else{
        ?>
			<th>Bônus de cereal ao nível 5:</th>
			<td><b><?php echo $bid9[5]['attri']; ?></b> Por cento</td>
            <?php
			}}
            ?>
		</tr>
	</table>
<?php 
include("upgrade.tpl");
?>
</p></div>