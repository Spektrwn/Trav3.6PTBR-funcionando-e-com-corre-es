<div id="build" class="gid24"><a href="#" onClick="return Popup(24,4);" class="build_logo">
	<img class="building g24" src="img/x.gif" alt="Casa do Povo" title="Casa do Povo" />
</a>
<h1>Casa do Povo <span class="level">Nível <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc">Você pode realizar celebrações pomposas na Casa do Povo. Tal celebração aumenta seus pontos de cultura. Construir a sua Casa do Povo a um nível mais elevado irá diminuir o tempo da celebração.
</p>
<?php
	if ($building->getTypeLevel(24) > 0) {
		include("Templates/Build/24_1.tpl"); 
		include("Templates/Build/24_2.tpl");
	} else {
		 echo "<p><b>As celebrações podem começar quando a Casa do Povo for concluída.</b><br>\n";
	}

	include("upgrade.tpl");

?>
</p></div>
