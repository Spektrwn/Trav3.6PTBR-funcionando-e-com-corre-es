<?php
if(isset($_GET['aid'])) {
$aid = $_GET['aid'];
}
else {
$aid = $session->alliance;
}
$varmedal = $database->getProfileMedalAlly($aid);  

$allianceinfo = $database->getAlliance($aid);
$memberlist = $database->getAllMember($aid);
$totalpop = 0;
if($allianceinfo['tag']==""){
header("Location: allianz.php");
}
foreach($memberlist as $member) {
    $totalpop += $database->getVSumField($member['id'],"pop");
}
echo "<h1>".$allianceinfo['tag']." - ".$allianceinfo['name']."</h1>";

$profiel="".$allianceinfo['notice']."".md5(skJkev3)."".$allianceinfo['desc']."";
require("medal.php");
$profiel=explode("".md5(skJkev3)."", $profiel);

include("alli_menu.tpl"); 

?>
<table cellpadding="1" cellspacing="1" id="profile">
<thead>
<tr>
<th colspan="2">Aliança</th>
</tr>
<tr>
<td>Detalhes</td>
<td>Descrição</td>

</tr>
</thead>
<tbody>
<tr><td class="empty"></td><td class="empty"></td></tr>
<tr>
    <td class="details">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <th>Identificação</th>
                <td><?php echo $allianceinfo['tag']; ?></td>
            </tr>
            <tr>
                <th>Nome</th>
                <td><?php echo $allianceinfo['name']; ?></td>
            </tr>
                <tr>
                <td colspan="2" class="empty"></td>
            </tr>
            <tr>
                <th>Ranque</th>
                <td><?php echo $ranking->getAllianceRank($aid); ?>.</td>
            </tr>
            <tr>
                <th>Pontos</th>
                <td><?php echo $totalpop; ?></td>
            </tr>
            <tr>
                <th>Membros</th>
                <td><?php echo count($memberlist); ?></td>
            </tr><tr>
                    <td colspan="2" class="empty"></td>
                </tr>
                <?php
                foreach($memberlist as $member) {
                
                //rank name
                $rank = $database->getAlliancePermission($member['id'],"rank",0);
                
                //username
                $name = $database->getUserField($member['id'],"username",0);
                
                //if there is no rank defined, user will not be printed
                if($rank == ''){
                echo '';
                }
                
                //if there is user rank defined, user will be printed
                else if($rank != ''){
                echo "<tr>";
                echo "<th>".stripslashes($rank)."</th>";
                echo "<td><a href='spieler.php?uid=".$member['id']."'>".$name."</td>";
                echo "</tr>";
                } 
				}
			if($allianceinfo['forumlink'] != ''){
                echo "<tr>";
                echo "<td><a href='".$allianceinfo['forumlink']."'>» para o fórum</td>";
                echo "</tr>";
                }else{
			?>
                <tr>
                <td colspan="2" class="emmty"></td>
            </tr>
			<?php } ?>
            <tr>
                <td class="desc2" colspan="2"><?php echo stripslashes(nl2br($profiel[0])); ?>
                </td>
            </tr>
            </table>
    </td>
    <td class="desc1"><?php echo stripslashes(nl2br($profiel[1])); ?>
    </td>
</tr>
</tbody>
</table><table cellpadding="1" cellspacing="1" id="member"><thead>
<tr>
<th>&nbsp;</th>
<th>Jogador</th>
<th>População</th>
<th>Aldeias</th>
<?php    
if($aid == $session->alliance){
     echo "<th>&nbsp;</th>";
}
?>
</tr>
</thead>
<tbody>
<?php
// Alliance Member list loop
$rank=0;
foreach($memberlist as $member) {

    $rank = $rank+1;
  $TotalUserPop = $database->getVSumField($member['id'],"pop");
    $TotalVillages = $database->getProfileVillages($member['id']);    
    
  echo "    <tr>";
  echo "    <td class=ra>".$rank.".</td>";
    echo "    <td class=pla><a href=spieler.php?uid=".$member['id'].">".$member['username']."</a></td>"; 
    echo "    <td class=hab>".$TotalUserPop."</td>"; 
    echo "    <td class=vil>".count($TotalVillages)."</td>";
    
    if($aid == $session->alliance){    
        if ((time()-600) < $member['timestamp']){ // 0 Min - 10 Min
            echo "    <td class=on><img class=online1 src=img/x.gif title='Online agora' alt='Online agora' /></td>";
        }elseif ((time()-86400) < $member['timestamp'] && (time()-600) > $member['timestamp']){ // 10 Min - 1 Days
            echo "    <td class=on><img class=online2 src=img/x.gif title='Offline' alt='Offline' /></td>";              
            }elseif ((time()-259200) < $member['timestamp'] && (time()-86400) > $member['timestamp']){ // 1-3 Days
            echo "    <td class=on><img class=online3 src=img/x.gif title='Últimos 3 days' alt='Últimos 3 days' /></td>";    
        }elseif ((time()-604800) < $member['timestamp'] && (time()-259200) > $member['timestamp']){
            echo "    <td class=on><img class=online4 src=img/x.gif title='Últimos 7 days' alt='Últimos 7 days' /></td>";    
        }else{
             echo "    <td class=on><img class=online5 src=img/x.gif title=Inativo alt=Inativo /></td>";   
        }
    }
    
    echo "    </tr>";    
}

?> 
</tbody>
</table>