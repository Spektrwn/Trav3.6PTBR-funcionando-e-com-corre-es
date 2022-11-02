<div id="build" class="gid25"><h1>Residência <span class="level">level <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc">
	<a href="#" onClick="return Popup(25,4, 'gid');"
		class="build_logo"> <img
		class="building g25"
		src="img/x.gif" alt="Residência"
		title="Residência" /> </a>
		A residência é uma pequena moradia onde o rei ou rainha vivem quando eles visitam a aldeia. A residência protege a vila contra inimigos que querem conquistá-la.</p>


<?php include("25_menu.tpl"); ?>

Ao atacar com senadores, chefes ou chefes a lealdade de uma aldeia pode ser derrubada. Se chegar a zero, a aldeia se junta ao reino do atacante. A lealdade desta aldeia está atualmente em <b><?php echo floor($database->getVillageField($village->wid,'loyalty')); ?></b> por cento.</div>
