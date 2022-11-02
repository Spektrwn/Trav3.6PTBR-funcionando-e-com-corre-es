<?php

/** --------------------------------------------------- **\
| ********* DO NOT REMOVE THIS COPYRIGHT NOTICE ********* |
+---------------------------------------------------------+
| Released by:   Dzoki < dzoki.travian@gmail.com >        |
| Copyright:     TravianX Project All rights reserved     |
\** --------------------------------------------------- **/
		if(!is_numeric($_SESSION['search'])) {
		?>
			<center><font color=orange size=2><p class=\"error\">O usuário <b>"<?php echo $_SESSION['search']; ?>"</b> não existe ou não possui herói.</p></font></center>
		<?php
			$search = 0;
		} else {
        	$search = $_SESSION['search'];
        }

?>

		<table cellpadding="1" cellspacing="1" id="heroes" class="row_table_data">
			<thead>
				<tr>
					<th colspan="5">
						Os heróis mais experientes											</th>
				</tr>
		<tr><td></td><td>Herói</td><td>Jogador</td><td>Nível</td><td>Experiencia</td></tr>
		</thead><tbody>
        <?php
        if(isset($_GET['rank'])) {
        	$multiplier = 1;
        	if(is_numeric($_GET['rank'])) {
        		if($_GET['rank'] > count($ranking->getRank())) {
        			$_GET['rank'] = count($ranking->getRank()) - 1;
        		}
        		while($_GET['rank'] > (20 * $multiplier)) {
        			$multiplier += 1;
        		}
        		$start = 20 * $multiplier - 19;
        	} else {
        		$start = ($_SESSION['start'] + 1);
        	}
        } else {
        	$start = ($_SESSION['start'] + 1);
        }
        if(count($ranking->getRank()) > 0) {
        	$ranking = $ranking->getRank();
        	for($i = $start; $i < ($start + 20); $i++) {
        		if(isset($ranking[$i]['name']) && $ranking[$i] != "pad") {
        			if($ranking[$i]['uid'] == $session->uid) {
        				echo "<tr class=\"hl \"><td class=\"ra  fc\" >";
        			} else {
        				echo "<tr><td class=\"ra \" >";
        			}
        			echo $i . ".</td>
					<td class=\"hero \">
					<img class=\"unit u" . $ranking[$i]['unit'] . "\" alt=\"\" title=\"\" src=\"img/x.gif\"> " . $ranking[$i]['name'] . "</td>
					<td class=\"pla \"><center><a href=\"spieler.php?uid=" . $ranking[$i]['uid'] . "\">" . $ranking[$i]['owner'] . "</a></center></td>
					<td class=\"lev \">" . $ranking[$i]['level'] . "</td>
					<td class=\"xp \">" . $ranking[$i]['experience'] . "</td>
					</tr>
					";
        		}
        	}
        } else {
        	echo "<td class=\"none\" colspan=\"5\">Heróis não encontrados</td>";
        }

?>
 </tbody>
</table>
<?php

        include ("ranksearch.tpl");

?>