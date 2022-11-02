<div id="build" class="gid26"><h1>Palácio <span class="level">nível <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc">
	<a href="#" onClick="return Popup(26,4, 'gid');"
		class="build_logo"> <img
		class="building g26"
		src="img/x.gif" alt="Palácio"
		title="Palácio" /> </a>
	O rei ou a rainha do império vive no palácio. Apenas um palácio pode existir em seu reino de cada vez. Você precisa de um palácio para proclamar uma vila para ser sua capital.</p>


<?php include("26_menu.tpl"); ?>

Ao atacar com senadores, chefes ou chefes do clã a lealdade de uma aldeia pode ser derrubada. Se chegar a zero, a aldeia se junta ao reino do atacante. A lealdade desta aldeia está atualmente em <b><?php echo floor($database->getVillageField($village->wid,'loyalty')); ?></b> por cento.</div>
