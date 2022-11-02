<?php
include("next.tpl");
?>
<div id="build" class="gid14"><a href="#" onClick="return Popup(14,4);" class="build_logo">
	<img class="building g14" src="img/x.gif" alt="Praça dos torneios" title="Praça dos torneios" />
</a>
<h1>Praça dos Torneios <span class="level">Nível <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc">Suas tropas podem aumentar sua resistência na praça do torneio. Quanto mais o edifício for melhorado, mais rapidamente suas tropas estarão além de uma distância mínima de <?php echo TS_THRESHOLD ?> quadras.</p>


	<table cellpadding="1" cellspacing="1" id="build_value">
		<tr>
			<th>Bônus de velocidade atual:</th>
			<td><b><?php echo $bid14[$village->resarray['f'.$id]]['attri']; ?></b> Por cento</td>
		</tr>
		<tr>
		<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
		$next = $village->resarray['f'.$id]+1+$loopsame+$doublebuild+$master;
		if($next<=20){
        ?>
			<th>Bônus de velocidade ao nível <?php echo $next; ?>:</th>
			<td><b><?php echo $bid14[$next]['attri']; ?></b> Por cento</td>
            <?php
            }else{
        ?>
			<th>Bônus de velocidade ao nível 20:</th>
			<td><b><?php echo $bid14[20]['attri']; ?></b> Por cento</td>
            <?php
			}}
            ?>
		</tr>
	</table>
<?php 
include("upgrade.tpl");
?>
</p></div>
