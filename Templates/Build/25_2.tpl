<div id="build" class="gid25"><h1>Residência <span class="level">level <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc">
	<a href="#" onClick="return Popup(25,4, 'gid');"
		class="build_logo"> <img
		class="building g25"
		src="img/x.gif" alt="Residência"
		title="Residência" /> </a>
	A residência é uma pequena moradia onde o rei ou rainha vivem quando eles visitam a aldeia. A residência protege a vila contra inimigos que querem conquistá-la.</p>

<?php include("25_menu.tpl"); ?>

<p>Para estender seu império você precisa de pontos de cultura. Estes pontos de cultura aumentam ao longo do tempo e o fazem mais rapidamente à medida que os níveis de construção aumentam.</p>

<table cellpadding="1" cellspacing="1" id="build_value">
<tr>
	<th>Produção desta aldeia:</th>
	<td><b><?php echo $database->getVillageField($village->wid, 'cp'); ?></b> Pontos de cultura por dia</td>
</tr>
<tr>
	<th>Produção de todas as aldeias:</th>
	<td><b><?php echo $database->getVSumField($session->uid, 'cp'); ?></b> Pontos de cultura por dia</td>
</tr>
</table><p>Suas aldeias produziram <b><?php echo $session->cp; ?></b> pontos no total. Para fundar ou conquistar uma nova aldeia você precisa <b><?php $mode = CP; $total = count($database->getProfileVillages($session->uid)); echo ${'cp'.$mode}[$total+1]; ?></b> pontos.</p>
</div>
