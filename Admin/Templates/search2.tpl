<?php
#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       search2.tpl                                                 ##
##  Developed by:  Dzoki                                                       ##
##  Reworked:      aggenkeech                                                  ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2012. All rights reserved.                ##
##                                                                             ##
#################################################################################

if($user['tribe'] == 1)
{
	$tribename = "Roman";
}
else if($user['tribe'] == 2)
{
	$tribename = "Teutons";
}
else if($user['tribe'] == 3)
{
	$tribename = "Gauls";
}
else if($user['tribe'] == 4)
{
	$tribename = "Nature";
}
else if($user['tribe'] == 5)
{
	$tribename ="Natars";
}
$searchresults = $admin->search_player($user['username']);
$numsimplayers = count($searchresults);
$id = $user['id'];
$varray = $database->getProfileVillages($id);
$totalpop = 0;
foreach($varray as $vil)
{
	$totalpop += $vil['pop'];
}
?>
<form action="" method="post">
	<table id="member">
		<thead>
			<tr>
				<th colspan="3">Buscador <font color="red">("<?php echo $user['username']; ?>" = <?php echo $numsimplayers; ?> Similar)</font></th>
			</tr>
		</thead>
	</table>
	<center>
	<div id="s_nav2" >
		<div align="left" style="font-size: 10pt;"><b>Jogador:</b> <a href="?p=player&uid=<?php echo $user['id'];?>"><?php echo $user['username'];?></a> (uid: <?php echo $user['id'];?>)</div>
		<div align="left" style="font-size: 9pt;"><b>Tribo:</b> <?php echo $tribename; ?> | <b>Aldeias:</b> <?php echo count($varray);?> | <b>Habitantes:</b> <?php echo $totalpop; ?></div>
	</div>

	<?php
	if($_GET['did'])
	{  ?>
		<div id="s_nav4">
				<div align="left" style="font-size: 10pt;"><b>Aldeia:</b> <a href="?p=village&did=<?php echo $village['wref'];?>"><?php echo $village['name'];?></a> (did: <?php echo $village['wref'];?>)</div>
				<div align="left" style="font-size: 9pt;"><b>Coordenadas:</b> (<?php echo $coor['x'];?>|<?php echo $coor['y'];?>) | <b>Habitantes</b>: <?php echo $village['pop'];?>
		</div><?php
	} ?>
</center>
</form>