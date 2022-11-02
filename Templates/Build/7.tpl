<?php
include("next.tpl");
?>
<div id="build" class="gid7"><a href="#" onClick="return Popup(7,4);" class="build_logo">
	<img class="building g7" src="img/x.gif" alt="Fundição" title="Fundição" />
</a>
<h1>Fundição <span class="level">Nível <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc">A fundição derrete ferro. Com base em seu nível de fundição pode aumentar sua produção de ferro em até 25 por cento.</p>


	<table cellpadding="1" cellspacing="1" id="build_value">
		<tr>
			<th>Bônus de ferro atual:</th>
			<td><b><?php echo $bid7[$village->resarray['f'.$id]]['attri']; ?></b> Por cento</td>
		</tr>
		<tr>
		<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
		$next = $village->resarray['f'.$id]+1+$loopsame+$doublebuild+$master;
		if($next<=5){
        ?>
			<th>Bônus de ferro ao nível <?php echo $next; ?>:</th>
			<td><b><?php echo $bid7[$next]['attri']; ?></b> Por cento</td>
            <?php
            }else{
        ?>
			<th>Bônus de ferro ao nível 5:</th>
			<td><b><?php echo $bid7[5]['attri']; ?></b> Por cento</td>
            <?php
			}}
            ?>
		</tr>
	</table>
<?php 
include("upgrade.tpl");
?>
</p></div>