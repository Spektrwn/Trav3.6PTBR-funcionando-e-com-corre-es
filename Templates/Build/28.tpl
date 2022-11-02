<?php
include("next.tpl");
?>
<div id="build" class="gid28"><a href="#" onClick="return Popup(28,4);" class="build_logo">
	<img class="building g28" src="img/x.gif" alt="Companhia do Comércio" title="Companhia do Comércio" />
</a>
<h1>Companhia do Comércio <span class="level">Nível <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc">Na companhia do comercio, as carroças dos comerciantes são melhorados e equipados em cavalos poderosos. Quanto maior o seu nível mais os seus comerciantes são capazes de transportar.</p>


	<table cellpadding="1" cellspacing="1" id="build_value">
		<tr>
			<th>Carga do comerciante atual:</th>
			<td><b><?php echo $bid28[$village->resarray['f'.$id]]['attri']; ?></b> Por cento</td>
		</tr>
		<tr>
		<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
		$next = $village->resarray['f'.$id]+1+$loopsame+$doublebuild+$master;
		if($next<=20){
        ?>
			<th>Carga do comerciante ao nível <?php echo $next; ?>:</th>
			<td><b><?php echo $bid28[$next]['attri']; ?></b> Por cento</td>
            <?php
            }else{
        ?>
			<th>Carga do comerciante ao nível 20:</th>
			<td><b><?php echo $bid28[20]['attri']; ?></b> Por cento</td>
            <?php
			}}
            ?>
		</tr>
	</table>
<?php 
include("upgrade.tpl");
?>
</p></div>
