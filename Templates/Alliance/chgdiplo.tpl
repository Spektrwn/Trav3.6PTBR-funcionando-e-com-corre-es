<?php

/*
|--------------------------------------------------------------------------
|   PLEASE DO NOT REMOVE THIS COPYRIGHT NOTICE!
|--------------------------------------------------------------------------  
|
|   Developed by:   Dzoki < dzoki.travian@gmail.com >
|  
|   This script is property of TravianX Project. You are allowed to change
|   its source and release it, but you have no rights to remove copyright
|   notices.
|
|   TravianX All rights reserved
|
*/


    if(isset($aid)) {
        $aid = $aid;
    } else {
        $aid = $session->alliance;
    }
    $allianceinfo = $database->getAlliance($aid);
    echo "<h1>".$allianceinfo['tag']." - ".$allianceinfo['name']."</h1>";
    include("alli_menu.tpl"); 
?>
    <form method="post" action="allianz.php">
        <input type="hidden" name="a" value="6"> <input type="hidden" name="o" value="6"> <input type="hidden" name="s" value="5">

        <table cellpadding="1" cellspacing="1" id="diplomacy" class="dipl">
            <thead>
                <tr>
                    <th colspan="2">Diplomacia da Aliança</th>
                </tr>
            </thead>

            <tbody>
                <tr>
                    <th>Aliança</th>

                    <td><input class="ally text" type="text" name="a_name" maxlength="15"></td>
                </tr>

                <tr>
                    <td colspan="2" class="empty"></td>
                </tr>

                <tr>
                    <td colspan="2"><label><input class="radio" type="radio" name="dipl" value="1"> oferecer uma confederação</label></td>
                </tr>

                <tr>
                    <td colspan="2"><label><input class="radio" type="radio" name="dipl" value="2"> oferecer um pacto de não agressão</label></td>
                </tr>

                <tr>
                    <td colspan="2"><label><input class="radio" type="radio" name="dipl" value="3"> declarar guerra</label></td>
                </tr>
            </tbody>
        </table>

        <table cellpadding="1" cellspacing="1" id="hint" class="infos">
            <thead>
                <tr>
                    <th colspan="2">Dica</th>
                </tr>
            </thead>

            <tbody>
                <tr>
                    <td colspan="2">É parte da etiqueta diplomática falar com outra aliança e negociar antes de enviar uma oferta para um pacto de não agressão ou uma confederação.</td>
                </tr>
            </tbody>
        </table>

        <div id="box">
            <p><input type="image" value="ok" name="s1" id="btn_ok" class="dynamic_img" src="img/x.gif" alt="OK"></p>

            <p class="error"></p>
        </div>
    </form>

    <div class="clear"></div>

    <table cellpadding="1" cellspacing="1" id="own" class="dipl">
        <thead>
            <tr>
                <th colspan="3">Suas ofertas</th>
            </tr>
        </thead>

        <tbody>
        <tr>
        <?php 
        $alliance = $session->alliance;
        
        if(count($database->diplomacyOwnOffers($alliance))){
            foreach($database->diplomacyOwnOffers($alliance) as $key => $value){
                if($value['type'] == 1){
                    $type = "Conf.";
                } else if($value['type'] == 2){
                    $type = "Nap";
                } else if($value['type'] == 3){
                    $type = "War";
                }
                echo '<tr><td width="18"><form method="post" action="allianz.php"><input type="hidden" name="o" value="101"><input type="hidden" name="id" value="'.$value['id'].'"><input type="image" class="cancel" src="img/x.gif" title="Cancelar" /></form></td><td><a href="allianz.php?aid='.$value['alli2'].'"><center>'.$database->getAllianceName($value['alli2']).'</a></center></td><td width="80"><center>'.$type.'</center></td></tr>';
            }   
        } else {
            echo '<tr><td colspan="3" class="none">Nenhuma</td></tr>';
        }
        ?>
            </tr>
        </tbody>
    </table>

    <table cellpadding="1" cellspacing="1" id="tip" class="infos">
        <thead>
            <tr>
                <th colspan="2">Dica</th>
            </tr>
        </thead>

        <tbody>
            <tr>
                <td colspan="2">Se você quiser ver conexões na descrição da aliança automaticamente, tipo <span class="e">[diplomatie]</span> na descrição, <span class="e">[ally]</span>, <span class="e">[nap]</span> e <span class="e">[war]</span> Também são possíveis.</td>
            </tr>
        </tbody>
    </table>

    <table cellpadding="1" cellspacing="1" id="foreign" class="dipl">
        <thead>
            <tr>
                <th colspan="4">Ofertas estrangeiras</th>
            </tr>
        </thead>
       
        <tbody>
             <?php 
        unset($type);
        $alliance = $session->alliance;
        
        if(count($database->diplomacyInviteCheck($alliance))){
            foreach($database->diplomacyInviteCheck($alliance) as $key => $row){
                if($row['type'] == 1){
                    $type = "Conf.";
                } else if($row['type'] == 2){
                    $type = "Nap";
                } else if($row['type'] == 3){
                    $type = "War";
                }
                echo '<tr><td width="18"><form method="post" action="allianz.php"><input type="hidden" name="o" value="102"><input type="hidden" name="id" value="'.$row['id'].'"><input type="hidden" name="alli1" value="'.$row['alli1'].'"><input type="image" class="cancelar" src="img/x.gif" title="Cancelar" /></td></form><form method="post" action="allianz.php"><td width="18"><input type="hidden" name="o" value="103"><input type="hidden" name="id" value="'.$row['id'].'"><input type="hidden" name="alli2" value="'.$row['alli2'].'"><input type="hidden" name="type" value="'.$row['type'].'"><input type="image" class="aceitar" src="img/x.gif" title="Aceitar" /></td></form><td><a href="allianz.php?aid='.$row['alli1'].'"><center>'.$database->getAllianceName($row['alli1']).'</a></center></td><td width="80"><center>'.$type.'</center></td></tr>';
            }   
        } else {
            echo '<tr><td colspan="3" class="none">Nenhuma</td></tr>';
        }
        ?>
        </tbody>
    </table>

    <table cellpadding="1" cellspacing="1" id="existing" class="dipl">
        <thead>
            <tr>
                <th colspan="3">Relações existentes</th>
            </tr>
        </thead>

        <tbody>
             <?php 
        unset($type);
        unset($row);
        $alliance = $session->alliance;
        
        if(count($database->diplomacyExistingRelationships($alliance))){
            foreach($database->diplomacyExistingRelationships($alliance) as $key => $row){
                if($row['type'] == 1){
                    $type = "Conf.";
                } else if($row['type'] == 2){
                    $type = "Nap";
                } else if($row['type'] == 3){
                    $type = "War";
                }
                echo '<tr><td width="18"><form method="post" action="allianz.php"><input type="hidden" name="o" value="104"><input type="hidden" name="id" value="'.$row['id'].'"><input type="hidden" name="alli2" value="'.$row['alli2'].'"><input type="image" class="cancel" src="img/x.gif" title="Cancelar" /></form></td><td><a href="allianz.php?aid='.$row['alli1'].'"><center>'.$database->getAllianceName($row['alli1']).'</a></center></td><td width="80"><center>'.$type.'</center></td></tr>';
            }   
        } elseif(count($database->diplomacyExistingRelationships2($alliance))){
            foreach($database->diplomacyExistingRelationships2($alliance) as $key => $row){
                if($row['type'] == 1){
                    $type = "Conf.";
                } else if($row['type'] == 2){
                    $type = "Nap";
                } else if($row['type'] == 3){
                    $type = "War";
                }
                echo '<tr><td width="18"><form method="post" action="allianz.php"><input type="hidden" name="o" value="104"><input type="hidden" name="id" value="'.$row['id'].'"><input type="hidden" name="alli2" value="'.$row['alli1'].'"><input type="image" class="cancel" src="img/x.gif" title="Cancelar" /></form></td><td><a href="allianz.php?aid='.$row['alli2'].'"><center>'.$database->getAllianceName($row['alli2']).'</a></center></td><td width="80"><center>'.$type.'</center></td></tr>';
            }   
        }else {
            echo '<tr><td colspan="3" class="none">Nenhuma</td></tr>';
        }
        
        ?>
        </tbody>
    </table>