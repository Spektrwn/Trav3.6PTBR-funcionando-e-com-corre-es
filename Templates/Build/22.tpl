<div id="build" class="gid22"><a href="#" onClick="return Popup(22,4);" class="build_logo">

	<img class="building g22" src="img/x.gif" alt="Academia" title="Academia" />
</a>
<h1>Academia <span class="level">nível <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc">Novos tipos de unidades podem ser desenvolvidos na academia. Ao aumentar seu nível você pode ordenar a pesquisa de melhores unidades.</p>
<?php
	if ($building->getTypeLevel(22) > 0) {
		include("22_".$session->tribe.".tpl");
	} else {
		echo "<p><b>A pesquisa pode começar quando a academia estiver concluída.</b><br>\n";
	}

	include("upgrade.tpl");
?>
        </p>
         </div>
