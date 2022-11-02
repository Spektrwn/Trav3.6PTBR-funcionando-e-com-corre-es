<div id="build" class="gid13"><a href="#" onClick="return Popup(13,4);" class="build_logo">

	<img class="building g13" src="img/x.gif" alt="Fábrica de armaduras" title="Fábrica de armaduras" />
</a>
<h1>Fábrica de armaduras <span class="level">Nível <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc">A armadura de seus guerreiros é reforçada nos fornos de fusão do arsenal. Ao aumentar seu nível, você pode encomendar a fabricação de armaduras ainda melhores.
<?php
/*In the armoury&#39;s melting furnaces your warriors&#39; armour is enhanced. By increasing its level you can order the fabrication of even better armour.*/
	if ($building->getTypeLevel(13) > 0) {
		include("13_upgrades.tpl");
	} else {
		echo "<p><b>Reforço das armaduras podem começar quando o arsenal for concluído.</b><br>\n";
	}
include("upgrade.tpl");
?>
        </p>
         </div>
