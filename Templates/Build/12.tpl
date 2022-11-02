<div id="build" class="gid12"><a href="#" onClick="return Popup(12,4);" class="build_logo">

	<img class="building g12" src="img/x.gif" alt="Ferreiro" title="Ferreiro" />
</a>
<h1>Ferreiro <span class="level">Nível <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc">As armas de seus guerreiros são reforçadas nos fornos de fundição do ferreiro. Ao aumentar seu nível, você pode encomendar a fabricação de armas ainda melhores.
<?php
	if ($building->getTypeLevel(12) > 0) {
		include("12_upgrades.tpl");
	} else {
		echo "<p><b>Melhoramento podem começar quando ferreiro é concluído.</b><br>\n";
	}
include("upgrade.tpl");
?>
        </p>
         </div>
