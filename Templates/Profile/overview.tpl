<?php
#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       overview.tpl                                                ##
##  Developed by:  Dzoki                                                       ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2011. All rights reserved.                ##
##                                                                             ##
#################################################################################

$ranking->procRankReq($_GET);
$_GET['uid'] = preg_replace("/[^0-9]/","",$_GET['uid']);
$displayarray = $database->getUserArray($_GET['uid'],1);
 

$varmedal = $database->getProfileMedal($_GET['uid']);

$profiel="".$displayarray['desc1']."".md5(skJkev3)."".$displayarray['desc2']."";
require("medal.php");
$profiel=explode("".md5(skJkev3)."", $profiel);

$varray = $database->getProfileVillages($_GET['uid']);
$totalpop = 0;
foreach($varray as $vil) {
	$totalpop += $vil['pop'];
}
?>
<h1>Perfil do jogador</h1>

<?php
if($_GET['uid'] == $session->uid) {
if($session->sit == 0){
include("menu.tpl");
}else{
include("menu2.tpl");
}
}
?>
<table id="profile" cellpadding="1" cellspacing="1" >
    <thead>
    <tr>
        <th colspan="2">Jogador <?php echo $displayarray['username']; ?></th>
    </tr>
    <tr>
        <td>Detalhes</td>
        <td>Descrição</td>

    </tr>
    </thead><tbody>
    <tr>
        <td class="empty"></td><td class="empty"></td>
    </tr>
    <tr>
        <td class="details">
            <table cellpadding="0" cellspacing="0">
 
<?php if($displayarray['access']==BANNED){ echo "<tr><td colspan='2'><center><b>Banned</b></center></td></tr>"; } ?>

			<tr>

                <th>Classificação</th>
                <td><?php echo $ranking->getUserRank($displayarray['id']); ?></td>
            </tr>
            <tr>
                <th>Tribo</th>
                <td><?php 
                if($displayarray['tribe'] == 1) {
                echo "Romano";
                }
                else if($displayarray['tribe'] == 2) {
                echo "Teutão";
                }
                else if($displayarray['tribe'] == 3) {
                echo "Gaulês";
                }
				else if($displayarray['tribe'] == 4) {
                echo "Nature";
                
                }else if($displayarray['tribe'] == 5) {
                echo "Natars";
                }				?></td>
            </tr>

            <tr>
                <th>Aliança</th>
                <td><?php if($displayarray['alliance'] == 0) {
                echo "-";
                }
                else {
                $displayalliance = $database->getAllianceName($displayarray['alliance']);
                echo "<a href=\"allianz.php?aid=".$displayarray['alliance']."\">".$displayalliance."</a>";
                } ?></td>
            </tr>
            <tr>
                <th>Aldeias</th>
                <td><?php echo count($varray);?></td>

            </tr>
            <tr>
                <th>População</th>
                <td><?php echo $totalpop; ?></td>
            </tr>
            <?php 
			//Date of Birth
            if(isset($displayarray['birthday']) && $displayarray['birthday'] != 0) {
			$age = date('Y') - substr($displayarray['birthday'],0,4);
				if ((date('m') - substr($displayarray['birthday'],5,2)) < 0){$age --;}
				elseif ((date('m') - substr($displayarray['birthday'],5,2)) == 0){
					if(date('d') < substr($displayarray['birthday'],8,2)){$age --;}
				}
            echo "<tr><th>Idade</th><td>$age</td></tr>";
            }
			//Gender
            if(isset($displayarray['gender']) && $displayarray['gender'] != 0) {
            $gender = ($displayarray['gender']== 1)? "Homem" : "Mulher";
            echo "<tr><th>Genero</th><td>".$gender."</td></tr>";
            }
			//Location
            if($displayarray['location'] != "") {
            echo "<tr><th>Localização</th><td>".$displayarray['location']."</td></tr>";
            }
            ?>
            <tr>
                <td colspan="2" class="empty"></td>
            </tr>
            <tr>
				<?php if(preg_replace("/[^0-9]/","",$_GET['uid']) == $session->uid) {
				if($session->sit == 0){
                echo "<td colspan=\"2\"> <a href=\"spieler.php?s=1\">&raquo; Alterar perfil</a></td>";
				}else{
                echo "<td colspan=\"2\"> <span class=none><b>&raquo; Alterar perfil</b></span></td>";
				}
                } else {
             echo "<td colspan=\"2\"> <a href=\"nachrichten.php?t=1&amp;id=".$_GET['uid']."\">&raquo; Escrever mensagem</a></td>";
			 }
                ?>                
            </tr>
			<!--<tr><td colspan="2"><a href="nachrichten.php?t=1&id=0"><font color="Red">&raquo; Report Player</font></a></td></tr>-->
            <tr>
							<td colspan="2" class="desc2">
								<div class="desc2div"><?php echo nl2br($profiel[0]); ?></div>
							</td>
						</tr>
            </table>

        </td>
        <td class="desc1" >
            <div><?php echo nl2br($profiel[1]); ?>
            
            </div>
            
            </div>
        </td>

    </tr>
    </tbody>
</table><table cellpadding="1" cellspacing="1" id="villages">
    <thead>
    <tr>
        <th colspan="3">Aldeias</th>
    </tr>
    <tr>
        <td>Nome</td>
<?php if(NEW_FUNCTIONS_OASIS){ ?> 	
    	<td>Oasis</td>
		<?php } ?>	
        <td>Habitantes</td>
        <td>Coordenadas</td>
    </tr>
    </thead><tbody>
    <?php 
    foreach($varray as $vil) {
    	$coor = $database->getCoor($vil['wref']);
    	echo "<tr><td class=\"nam\"><a href=\"karte.php?d=".$vil['wref']."&amp;c=".$generator->getMapCheck($vil['wref'])."\">".$vil['name']."</a>";
        if($vil['capital'] == 1) {
        echo "<span class=\"none3\"> (capital)</span>";
        }
        echo "</td>";
		            if(NEW_FUNCTIONS_DISPLAY_ARTIFACT){
                if($hasArtifact) echo "<span class=\"none3\"> (Artifact)</span>";
            }
			if(NEW_FUNCTIONS_DISPLAY_WONDER){
				if($vil['natar'] == 1) echo "<span class=\"none3\"> (WoW)</span>";
			}
            
            if(NEW_FUNCTIONS_OASIS){
                echo "<td class=\"ico\">";
                $oases = $database->getOasis($vil['wref']);
                foreach ($oases as $oasis) {
					//echo $oasis['type'];
                    switch ($oasis['type']) {
                        case 1:
                        case 2:
                            echo "<img class='r1' src='img/x.gif' title='+25% Madeira'> ";
                            break;
                        case 3:
                            echo "<img class='r1' src='img/x.gif'>";
							echo "<img class='r4' src='img/x.gif' title='+25% Madeira +25% Cereal'> ";
                            break; 
                        case 4:
                        case 5:
                            echo "<img class='r2' src='img/x.gif' title='+25% Barro'> ";
                            break;
                        case 6:
                            echo "<img class='r2' src='img/x.gif'>";
							echo "<img class='r4' src='img/x.gif' title='+25% Barro +25% Cereal'> ";
                            break;
                        case 7:
                        case 8:
                            echo "<img class='r3' src='img/x.gif' title='+25% Ferro'> ";
                            break;
                        case 9:
                            echo "<img class='r3' src='img/x.gif'>";
							echo "<img class='r4' src='img/x.gif'  title='+25% Ferro +25% Cereal'> ";
                            break;
                        case 10:
                        case 11:
                            echo "<img class='r4' src='img/x.gif' title='+25% Cereal'> ";
                            break;
                        case 12:
                            echo "<img class='r4' src='img/x.gif'> ";
							echo "<img class='r4' src='img/x.gif' title='+50% Cereal'> ";
                            break;
							

                    }
                }
                echo "</td>";
            }  
        echo "<td class=\"hab\">".$vil['pop']."</td><td class=\"aligned_coords\">";
        echo "<div class=\"cox\">(".$coor['x']."</div><div class=\"pi\">|</div><div class=\"coy\">".$coor['y'].")</div></td></tr>";
    }
    ?>
        </tbody></table>