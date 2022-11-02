<div id="build" class="gid25"><h1>Residência <span class="level">Nível <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc">
	<a href="#" onClick="return Popup(25,4, 'gid');"
		class="build_logo"> <img
		class="building g25"
		src="img/x.gif" alt="Residência"
		title="Residência" /> </a>
	A residência é uma pequena moradia onde o rei ou rainha vivem quando eles visitam a aldeia. A residência protege a aldeia contra inimigos que querem conquistá-la.</p>

<?php
if ($village->capital == 1) {
	echo "<p class=\"act\">Esta é sua capital</p>";
}

include("25_menu.tpl");

if($village->resarray['f'.$id] >= 10){
	include ("25_train.tpl");	
}
else{
	echo '<div class="c">Para fundar uma nova aldeia você precisa de um nível 10 ou 20 residência e 3 colonos. A fim de conquistar uma nova aldeia você precisa de um nível 10 ou 20 residência e um senador, chefe ou chefe do clã.</div>';
}

include("upgrade.tpl");
?>
</div>
