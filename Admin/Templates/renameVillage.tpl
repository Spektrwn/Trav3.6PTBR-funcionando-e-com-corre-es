<?php
#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       renameVillage.tpl                                           ##
##  Developed by:  Dzoki & Advocatie                                           ##
##  License:       TravianX Project                                            ##
##  Thanks to:     Dzoki & itay2277(Edit troops)                               ##
##  Copyright:     TravianX (c) 2010-2011. All rights reserved.                ##
#################################################################################

if($_SESSION['access'] < ADMIN) die("Acesso negado: você não é administrador!");


$id = $_GET['did'];

if(isset($id))
{
$village = $database->getVillage($id);
$user = $database->getUserArray($village['owner'],1);
$coor = $database->getCoor($village['wref']);
$varray = $database->getProfileVillages($village['owner']);
$type = $database->getVillageType($village['wref']);
$fdata = $database->getResourceLevel($village['wref']);
$units = $database->getUnit($village['wref']);
?>
<table id="member">
	<thead>
		<tr>
			<th colspan="2">Editar  nome da aldeia</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><?php echo $village['name']; ?></td>
		</td>
	</tbody>
</table>