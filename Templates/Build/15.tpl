<?php
include("next.tpl");
?>
<div id="build" class="gid15"><a href="#" onClick="return Popup(15,4);" class="build_logo">
	<img class="building g15" src="img/x.gif" alt="Edifício Principal" title="Edifício Principal" />
</a>
<h1>Edifício Principal <span class="level">Nível <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc">Os mestres da vila vivem no edifício principal. Quanto maior o seu nível, mais rápido os seus construtores concluem a construção de novos edifícios.</p>


	<table cellpadding="1" cellspacing="1" id="build_value">
		<tr>
			<th>Tempo de construção atual:</th>
			<td><b><?php echo round($bid15[$village->resarray['f'.$id]]['attri']); ?></b> Por cento</td>
		</tr>
		<tr>
		<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
		$next = $village->resarray['f'.$id]+1+$loopsame+$doublebuild+$master;
		if($next<=20){
        ?>
			<th>Tempo de construção ao nível <?php echo $next; ?>:</th>
			<td><b><?php echo round($bid15[$next]['attri']); ?></b> Por cento</td>
            <?php
            }else{
        ?>
			<th>Tempo de construção ao nível 20:</th>
			<td><b><?php echo round($bid15[20]['attri']); ?></b> Por cento</td>
            <?php
			}}
            ?>
		</tr>
	</table>
	
<?php 
if($village->resarray['f'.$id] >= 10){
	include("Templates/Build/15_1.tpl");
}
include("upgrade.tpl");
?>
</p></div>
