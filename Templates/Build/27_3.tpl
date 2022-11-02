<body>
    <div id="build" class="gid27">
        <a href="#" onclick="return Popup(27,4);" class="build_logo"><img class="building g27" src="img/x.gif" alt="Tesouraria" title="Tesouraria"></a>

        <h1>Tesouraria <span class="level">Nível <?php

        echo $village->resarray['f' . $id];

?></span></h1>

        <p class="build_desc">As riquezas de seu império são mantidas na tesouraria. A tesouraria tem espaço para um tesouro. Depois de ter capturado um artefato que leva 24 horas em um servidor normal ou 12 horas em um servidor de velocidade três para ser eficaz.</p>
        
        <?php

        include ("27_menu.tpl");

?>
        
        <table id="show_artefacts" cellpadding="1" cellspacing="1">
    		<thead>
    			<tr>
			    	<th colspan="4">Grandes artefatos</th>
    			</tr>
    			<tr>
    				<td></td>
	    			<td>Nome</td>
	    			<td>Jogador</td>
	    			<td>Aliança</td>
    			</tr>
    		</thead>
    		<tbody>
            <?php

        if(mysql_num_rows(mysql_query("SELECT * FROM " . TB_PREFIX . "artefacts")) == 0) {
        	echo '<td colspan="4" class="none">Não há artefatos.</td>';
        } else {

        	$artefact = mysql_query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 2 AND type = 1");
        	while($row = mysql_fetch_array($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">' . $row['effect'] . '</span><div class="info">Tesouraria <b>20</b>, Efeito <b>Conta</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $database->getUserField($row['owner'], "alliance", 0) . '">' . $database->getAllianceName($database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

        	unset($artefact);
        	unset($row);
        	$artefact = mysql_query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 3 AND type = 1");
        	while($row = mysql_fetch_array($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">' . $row['effect'] . '</span><div class="info">Tesouraria <b>20</b>, Efeito <b>Conta</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $database->getUserField($row['owner'], "alliance", 0) . '">' . $database->getAllianceName($database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

?>
            <tr><td colspan="4"></td></tr>
            
            
            <?php

        	unset($artefact);
        	unset($row);
        	$artefact = mysql_query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 2 AND type = 2");
        	while($row = mysql_fetch_array($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">' . $row['effect'] . '</span><div class="info">Tesouraria <b>20</b>, Efeito <b>Conta</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $database->getUserField($row['owner'], "alliance", 0) . '">' . $database->getAllianceName($database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

        	unset($artefact);
        	unset($row);
        	$artefact = mysql_query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 3 AND type = 2");
        	while($row = mysql_fetch_array($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">' . $row['effect'] . '</span><div class="info">Tesouraria <b>20</b>, Efeito <b>Conta</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $database->getUserField($row['owner'], "alliance", 0) . '">' . $database->getAllianceName($database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

?>
            <tr><td colspan="4"></td></tr>
            
            
            <?php

        	unset($artefact);
        	unset($row);
        	$artefact = mysql_query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 2 AND type = 3");
        	while($row = mysql_fetch_array($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">' . $row['effect'] . '</span><div class="info">Tesouraria <b>20</b>, Efeito <b>Conta</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $database->getUserField($row['owner'], "alliance", 0) . '">' . $database->getAllianceName($database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

        	unset($artefact);
        	unset($row);
        	$artefact = mysql_query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 3 AND type = 3");
        	while($row = mysql_fetch_array($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">' . $row['effect'] . '</span><div class="info">Tesouraria <b>20</b>, Efeito <b>Conta</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $database->getUserField($row['owner'], "alliance", 0) . '">' . $database->getAllianceName($database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

?>
            <tr><td colspan="4"></td></tr>
            
            
            <?php

        	unset($artefact);
        	unset($row);
        	$artefact = mysql_query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 2 AND type = 4");
        	while($row = mysql_fetch_array($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">' . $row['effect'] . '</span><div class="info">Tesouraria <b>20</b>, Efeito <b>Conta</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $database->getUserField($row['owner'], "alliance", 0) . '">' . $database->getAllianceName($database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

        	unset($artefact);
        	unset($row);
        	$artefact = mysql_query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 3 AND type = 4");
        	while($row = mysql_fetch_array($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">' . $row['effect'] . '</span><div class="info">Tesouraria <b>20</b>, Efeito <b>Conta</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $database->getUserField($row['owner'], "alliance", 0) . '">' . $database->getAllianceName($database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

?>
            <tr><td colspan="4"></td></tr>
            
            <?php

        	unset($artefact);
        	unset($row);
        	$artefact = mysql_query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 2 AND type = 5");
        	while($row = mysql_fetch_array($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">' . $row['effect'] . '</span><div class="info">Tesouraria <b>20</b>, Efeito <b>Conta</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $database->getUserField($row['owner'], "alliance", 0) . '">' . $database->getAllianceName($database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

        	unset($artefact);
        	unset($row);
        	$artefact = mysql_query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 3 AND type = 5");
        	while($row = mysql_fetch_array($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">' . $row['effect'] . '</span><div class="info">Tesouraria <b>20</b>, Efeito <b>Conta</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $database->getUserField($row['owner'], "alliance", 0) . '">' . $database->getAllianceName($database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

?>
            <tr><td colspan="4"></td></tr>
            
            <?php

        	unset($artefact);
        	unset($row);
        	$artefact = mysql_query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 2 AND type = 6");
        	while($row = mysql_fetch_array($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">' . $row['effect'] . '</span><div class="info">Tesouraria <b>20</b>, Efeito <b>Conta</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $database->getUserField($row['owner'], "alliance", 0) . '">' . $database->getAllianceName($database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

        	unset($artefact);
        	unset($row);
        	$artefact = mysql_query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 3 AND type = 6");
        	while($row = mysql_fetch_array($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">' . $row['effect'] . '</span><div class="info">Tesouraria <b>20</b>, Efeito <b>Conta</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $database->getUserField($row['owner'], "alliance", 0) . '">' . $database->getAllianceName($database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

?>
            <tr><td colspan="4"></td></tr>
            
            <?php

        	unset($artefact);
        	unset($row);
        	$artefact = mysql_query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 2 AND type = 7");
        	while($row = mysql_fetch_array($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">' . $row['effect'] . '</span><div class="info">Tesouraria <b>20</b>, Efeito <b>Conta</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $database->getUserField($row['owner'], "alliance", 0) . '">' . $database->getAllianceName($database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

        	unset($artefact);
        	unset($row);
        	$artefact = mysql_query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 3 AND type = 7");
        	while($row = mysql_fetch_array($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">' . $row['effect'] . '</span><div class="info">Tesouraria <b>20</b>, Efeito <b>Conta</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $database->getUserField($row['owner'], "alliance", 0) . '">' . $database->getAllianceName($database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

?>
            <tr><td colspan="4"></td></tr>
            
            <?php

        	unset($artefact);
        	unset($row);
        	$artefact = mysql_query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 3 AND type = 8");
        	while($row = mysql_fetch_array($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="build.php?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">' . $row['effect'] . '</span><div class="info">Tesouraria <b>20</b>, Efeito <b>Conta</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="karte.php?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $database->getUserField($row['owner'], "alliance", 0) . '">' . $database->getAllianceName($database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

?>
            <tr><td colspan="4"></td></tr>
            
            <?php
	}
?>
    	</tbody></table></div>
        
        <?php

        	include ("upgrade.tpl");

?>
        
</div>