<div id="build" class="gid17"><a href="#" onClick="return Popup(17,4);" class="build_logo"> 
	<img class="building g17" src="img/x.gif" alt="Mercado" title="Mercado" /> 
</a> 
<h1>Mercado <span class="level">Nível <?php echo $village->resarray['f'.$id]; ?></span></h1> 
<p class="build_desc">No Mercado você pode trocar recursos com outros jogadores. Quanto maior o seu nível, mais recursos podem ser transportados ao mesmo tempo.
</p> 
 
<?php include("17_menu.tpl"); ?>

<script language="JavaScript"> 
<!--
var haendler = <?php echo $market->merchantAvail(); ?>;
var carry = <?php echo $market->maxcarry; ?>;
//-->
</script>
<?php
$allres = $_POST['r1']+$_POST['r2']+$_POST['r3']+$_POST['r4'];
if($_POST['x']!="" && $_POST['y']!="" && is_numeric($_POST['x']) && is_numeric($_POST['y'])){
	$getwref = $database->getVilWref($_POST['x'],$_POST['y']);
	$checkexist = $database->checkVilExist($getwref);
}
else if($_POST['dname']!=""){
	$getwref = $database->getVillageByName($_POST['dname']);
	$checkexist = $database->checkVilExist($getwref);
}
if($checkexist){
$villageOwner = $database->getVillageField($getwref,'owner');
$userAccess = $database->getUserField($villageOwner,'access',0);
}
$maxcarry = $market->maxcarry;
$maxcarry *= $market->merchantAvail();
if(isset($_POST['ft'])=='check' && $allres!=0 && $allres <= $maxcarry && ($_POST['x']!="" && $_POST['y']!="" or $_POST['dname']!="") && $checkexist){
?>
<form method="POST" name="snd" action="build.php"> 
<input type="hidden" name="ft" value="mk1">
<input type="hidden" name="id" value="<?php echo $id; ?>">
<input type="hidden" name="send3" value="<?php echo $_POST['send3']; ?>">
<table id="send_select" class="send_res" cellpadding="1" cellspacing="1">
	<tr>
		<td class="ico"><img class="r1" src="img/x.gif" alt="Madeira" title="Madeira" /></td> 
		<td class="nam"> Madeira</td> 
		<td class="val"><input class="text disabled" type="text" name="r1" id="r1" value="<?php echo $_POST['r1']; ?>" readonly="readonly"></td> 
		<td class="max"> / <span class="none"><B><?php echo $market->maxcarry; ?></B></span> </td> 
	</tr>
    <tr> 
		<td class="ico"><img class="r2" src="img/x.gif" alt="Barro" title="Barro" /></td> 
		<td class="nam"> Barro</td> 
		<td class="val"><input class="text disabled" type="text" name="r2" id="r2" value="<?php echo $_POST['r2']; ?>" readonly="readonly"></td> 
		<td class="max"> / <span class="none"><b><?php echo$market->maxcarry; ?></b></span> </td> 
	</tr>
    <tr> 
		<td class="ico"><img class="r3" src="img/x.gif" alt="Ferro" title="Ferro" /></td> 
		<td class="nam"> Ferro</td> 
		<td class="val"><input class="text disabled" type="text" name="r3" id="r3" value="<?php echo $_POST['r3']; ?>" readonly="readonly"> 
		</td> 
		<td class="max"> / <span class="none"><b><?php echo $market->maxcarry; ?></b></span> </td> 
	</tr>
    <tr> 
		<td class="ico"><img class="r4" src="img/x.gif" alt="Cereal" title="Cereal" /></td> 
		<td class="nam"> Cereal</td> 
		<td class="val"> <input class="text disabled" type="text" name="r4" id="r4" value="<?php echo $_POST['r4']; ?>" readonly="readonly"> 
		</td> 
		<td class="max"> / <span class="none"><B><?php echo $market->maxcarry; ?></B></span></td> 
	</tr></table> 
<table id="target_validate" class="res_target" cellpadding="1" cellspacing="1">
	<tbody><tr>
		<th>Coordenadas:</th>
        <?php
		if($_POST['x']!="" && $_POST['y']!="" && is_numeric($_POST['x']) && is_numeric($_POST['y'])){
        $getwref = $database->getVilWref($_POST['x'],$_POST['y']);
		$getvilname = $database->getVillageField($getwref, "name");
		$getvilowner = $database->getVillageField($getwref, "owner");
		$getvilcoor['y'] = $_POST['y'];
		$getvilcoor['x'] = $_POST['x'];
		$time = $generator->procDistanceTime($getvilcoor,$village->coor,$session->tribe,0);
		}
		else if($_POST['dname']!=""){
		$getwref = $database->getVillageByName($_POST['dname']);
		$getvilcoor = $database->getCoor($getwref);
		$getvilname = $database->getVillageField($getwref, "name");
		$getvilowner = $database->getVillageField($getwref, "owner");
		$time = $generator->procDistanceTime($getvilcoor,$village->coor,$session->tribe,0);
		}
        ?>
		<td><a href="karte.php?d=<?php echo $getwref; ?>&c=<?php echo $generator->getMapCheck($getwref); ?>"><?php echo $getvilname; ?>(<?php echo $getvilcoor['x']; ?>|<?php echo $getvilcoor['y']; ?>)<span class="clear"></span></a></td>
	</tr>
	<tr>
		<th>Jogador:</th>
		<td><a href="spieler.php?uid=<?php echo $getvilowner; ?>"><?php echo $database->getUserField($getvilowner,username,0); ?></a></td>
	</tr>
	<tr>
		<th>duração:</th>
		<td><?php echo $generator->getTimeFormat($time); ?></td>
	</tr>
	<tr>
		<th>Comerciantes:</th>
		<td><?php
        $resource = array($_POST['r1'],$_POST['r2'],$_POST['r3'],$_POST['r4']); 
        echo ceil((array_sum($resource)-0.1)/$market->maxcarry); ?></td>
	</tr>

	<tr>
		<td colspan="2">
					</td>
	</tr>

</tbody></table>
<input type="hidden" name="getwref" value="<?php echo $getwref; ?>">
<div class="clear"></div>
<p>
<div class="clear"></div><p><input type="image" value="ok" name="s1" id="btn_ok" class="dynamic_img" src="img/x.gif" tabindex="8" alt="OK" <?php if(!$market->merchantAvail()) { echo "DISABLED"; }?>/></p></form>
<?php }else{ ?>
<form method="POST" name="snd" action="build.php"> 
<input type="hidden" name="ft" value="check">
<input type="hidden" name="id" value="<?php echo $id; ?>"> 
<table id="send_select" class="send_res" cellpadding="1" cellspacing="1"><tr> 
		<td class="ico"> 
			<a href="#" onClick="upd_res(1,1); return false;"><img class="r1" src="img/x.gif" alt="Madeira" title="Madeira" /></a> 
		</td> 
		<td class="nam"> 
			Madeira:
		</td> 
		<td class="val"> 
			<input class="text" type="text" name="r1" id="r1" value="" maxlength="5" onKeyUp="upd_res(1)" tabindex="1"> 
		</td> 
		<td class="max"> 
			<a href="#" onMouseUp="add_res(1);" onClick="return false;">(<?php echo $market->maxcarry; ?>)</a> 
		</td> 
	</tr><tr> 
		<td class="ico"> 
			<a href="#" onClick="upd_res(2,1); return false;"><img class="r2" src="img/x.gif" alt="Barro" title="Barro" /></a> 
		</td> 
		<td class="nam"> 
			Barro:
		</td> 
		<td class="val"> 
			<input class="text" type="text" name="r2" id="r2" value="" maxlength="5" onKeyUp="upd_res(2)" tabindex="2"> 
		</td> 
		<td class="max"> 
			<a href="#" onMouseUp="add_res(2);" onClick="return false;">(<?php echo$market->maxcarry; ?>)</a> 
		</td> 
	</tr><tr> 
		<td class="ico"> 
			<a href="#" onClick="upd_res(3,1); return false;"><img class="r3" src="img/x.gif" alt="Ferro" title="Ferro" /></a> 
		</td> 
		<td class="nam"> 
			Ferro:
		</td> 
		<td class="val"> 
			<input class="text" type="text" name="r3" id="r3" value="" maxlength="5" onKeyUp="upd_res(3)" tabindex="3"> 
		</td> 
		<td class="max"> 
			<a href="#" onMouseUp="add_res(3);" onClick="return false;">(<?php echo $market->maxcarry; ?>)</a> 
		</td> 
	</tr><tr> 
		<td class="ico"> 
			<a href="#" onClick="upd_res(4,1); return false;"><img class="r4" src="img/x.gif" alt="Cereal" title="Cereal" /></a> 
		</td> 
		<td class="nam"> 
			Cereal:
		</td> 
		<td class="val"> 
			<input class="text" type="text" name="r4" id="r4" value="" maxlength="5" onKeyUp="upd_res(4)" tabindex="4"> 
		</td> 
		<td class="max"> 
			<a href="#" onMouseUp="add_res(4);" onClick="return false;">(<?php echo $market->maxcarry; ?>)</a> 
		</td> 
	</tr></table> 
 
<table id="target_select" class="res_target" cellpadding="1" cellspacing="1"> 
	<tr> 
		<td class="mer">Comerciantes <?php echo $market->merchantAvail(); ?>/<?php echo $market->merchant; ?></td> 
	</tr> 
		<td class="vil"> 
			<span>Aldeia:</span> 
			<input class="text" type="text" name="dname" value="" maxlength="20" tabindex="5"> 
		</td> 
	<tr> 
		<td class="or">ou</td> 
	</tr> 
   <tr> 
<?php
if(isset($_GET['z'])){
$coor = $database->getCoor($_GET['z']);
}
else{
$coor['x'] = "";
$coor['y'] = "";
}
?>
      <td class="coo"> 
         <span>X:</span><input class="text" type="text" name="x" value="<?php echo $coor['x']; ?>" maxlength="4" tabindex="6"> 
         <span>Y:</span><input class="text" type="text" name="y" value="<?php echo $coor['y']; ?>" maxlength="4" tabindex="7"> 
      </td> 
   </tr> 
</table>
<div class="clear"></div>
<?php if($session->goldclub == 1){?>
<p><select name="send3"><option value="1" selected="selected">1x</option><option value="2">2x</option><option value="3">3x</option></select>Enviar</p>
<?php
}else{
?>
<input type="hidden" name="send3" value="1">
<?php
}
?>
<p><input type="image" value="ok" name="s1" id="btn_ok" class="dynamic_img" src="img/x.gif" tabindex="8" alt="OK" <?php if(!$market->merchantAvail()) { echo "DISABLED"; }?>/></p></form>
<?php
$error = '';
if(isset($_POST['ft'])=='check'){

	if(!$checkexist){
		$error = '<span class="error"><b>Não foram selecionadas coordenadas</b></span>';
	}elseif($getwref == $village->wid){
		$error = '<span class="error"><b>Você não pode enviar recursos para a mesma aldeia</b></span>';
	}elseif($userAccess == '0' or $userAccess == '8' or $userAccess == '9'){
		$error = '<span class="error"><b>O Jogador está Banido. Você não pode enviar recursos para ele.</b></span>';
    }elseif($_POST['r1']==0 && $_POST['r2']==0 && $_POST['r3']==0 && $_POST['r4']==0){
		$error = '<span class="error"><b>Recursos não selecionados.</b></span>';
    }elseif(!$_POST['x'] && !$_POST['y'] && !$_POST['dname']){
		$error = '<span class="error"><b>Introduza as coordenadas ou o nome da aldeia.</b></span>';
    }elseif($allres > $maxcarry){
		$error = '<span class="error"><b>Poucos comerciantes.</b></span>';
    }
    echo $error;
}
?>
<p>
<?php } ?>
<p>Cada comerciante pode <b><?php echo $market->maxcarry; ?></b> unidades de recursos</p>
<?php
$timer = 1;
if(count($market->recieving) > 0) { 
echo "<h4>Comerciantes chegando:</h4>";
    foreach($market->recieving as $recieve) {
       echo "<table class=\"traders\" cellpadding=\"1\" cellspacing=\"1\">";
	$villageowner = $database->getVillageField($recieve['from'],"owner");
	echo "<thead><tr><td><a href=\"spieler.php?uid=$villageowner\">".$database->getUserField($villageowner,"username",0)."</a></td>";
    echo "<td><a href=\"karte.php?d=".$recieve['from']."&c=".$generator->getMapCheck($recieve['from'])."\">Transporte de ".$database->getVillageField($recieve['from'],"name")."</a></td>";
    echo "</tr></thead><tbody><tr><th>Chegada em</th><td>";
    echo "<div class=\"in\"><span id=timer$timer>".$generator->getTimeFormat($recieve['endtime']-time())."</span> h</div>";
    $datetime = $generator->procMtime($recieve['endtime']);
    echo "<div class=\"às\">";
    if($datetime[0] != "today") {
    echo "em ".$datetime[0]." ";
    }
    echo "às ".$datetime[1]."</div>";
    echo "</td></tr></tbody> <tr class=\"res\"> <th>Recurso</th> <td colspan=\"2\"><span class=\"f10\">";
    echo "<img class=\"r1\" src=\"img/x.gif\" alt=\"Madeira\" title=\"Madeira\" />".$recieve['wood']." | <img class=\"r2\" src=\"img/x.gif\" alt=\"Barro\" title=\"Barro\" />".$recieve['clay']." | <img class=\"r3\" src=\"img/x.gif\" alt=\"Ferro\" title=\"Ferro\" />".$recieve['iron']." | <img class=\"r4\" src=\"img/x.gif\" alt=\"Cereal\" title=\"Cereal\" />".$recieve['crop']."</td></tr></tbody>";
    echo "</table>";
    $timer +=1;
    }
}
if(count($market->sending) > 0) {
	echo "<h4>Próprios comerciantes a caminho:</h4>";
    foreach($market->sending as $send) {
        $villageowner = $database->getVillageField($send['to'],"owner");
        $ownername = $database->getUserField($villageowner,"username",0);
        echo "<table class=\"traders\" cellpadding=\"1\" cellspacing=\"1\">";
        echo "<thead><tr> <td><a href=\"spieler.php?uid=$villageowner\">$ownername</a></td>";
        echo "<td><a href=\"karte.php?d=".$send['to']."&c=".$generator->getMapCheck($send['to'])."\">Transportando para ".$database->getVillageField($send['to'],"name")."</a></td>";
        echo "</tr></thead> <tbody><tr> <th>Chegada em</th> <td>";
        echo "<div class=\"in\"><span id=timer".$timer.">".$generator->getTimeFormat($send['endtime']-time())."</span> h</div>";
        $datetime = $generator->procMtime($send['endtime']);
        echo "<div class=\"às\">";
        if($datetime[0] != "today") {
        echo "em ".$datetime[0]." ";
        }
        echo "às ".$datetime[1]."</div>";
        echo "</td> </tr> <tr class=\"res\"> <th>Recurso</th><td>";
        echo "<img class=\"r1\" src=\"img/x.gif\" alt=\"Madeira\" title=\"Madeira\" />".$send['wood']." | <img class=\"r2\" src=\"img/x.gif\" alt=\"Barro\" title=\"Barro\" />".$send['clay']." | <img class=\"r3\" src=\"img/x.gif\" alt=\"Ferro\" title=\"Ferro\" />".$send['iron']." | <img class=\"r4\" src=\"img/x.gif\" alt=\"Cereal\" title=\"Cereal\" />".$send['crop']."</td></tr></tbody>";
        echo "</table>";
        $timer += 1;
    }
}
if(count($market->return) > 0) {
	echo "<h4>Comerciantes voltando:</h4>";
    foreach($market->return as $return) {
        $villageowner = $database->getVillageField($return['from'],"owner");
        $ownername = $database->getUserField($villageowner,"username",0);
        echo "<table class=\"traders\" cellpadding=\"1\" cellspacing=\"1\">";
        echo "<thead><tr> <td><a href=\"spieler.php?uid=$villageowner\">$ownername</a></td>";
        echo "<td><a href=\"karte.php?d=".$return['from']."&c=".$generator->getMapCheck($return['from'])."\">Retornando de ".$database->getVillageField($return['from'],"name")."</a></td>";
        echo "</tr></thead> <tbody><tr> <th>Chegada em</th> <td>";
        echo "<div class=\"in\"><span id=timer".$timer.">".$generator->getTimeFormat($return['endtime']-time())."</span> h</div>";
        $datetime = $generator->procMtime($return['endtime']);
        echo "<div class=\"às\">";
        if($datetime[0] != "today") {
        echo "em ".$datetime[0]." ";
        }
        echo "às ".$datetime[1]."</div>";
        echo "</td> </tr>";
        echo "</tbody></table>";
        $timer += 1;
    }
}
include("upgrade.tpl");
?>
</p></div> 
