<?php
if(!is_numeric($_SESSION['search'])) {
?>
	<center><font color=orange size=2><p class=\"error\">A aldeia <b>"<?php echo $_SESSION['search']; ?>"</b> não existe.</p></font></center>
<?php
    $search = 0;
}
else {
	$search = $_SESSION['search'];
}
?>
<table cellpadding="1" cellspacing="1" id="villages" class="row_table_data">
			<thead>
				<tr>
					<th colspan="5">
						As maiores aldeias								    
					</th>
				</tr>
		<tr><td></td><td>Aldeia</td><td>Jogador</td><td>Habitantes</td><td>Coordenadas</td></tr>
		</thead><tbody>  
         <?php
        if(isset($_GET['rank'])){
		$multiplier = 1;
			if(is_numeric($_GET['rank'])) {
				if($_GET['rank'] > count($ranking->getRank())) {
				$_GET['rank'] = count($ranking->getRank())-1;
				}
				while($_GET['rank'] > (20*$multiplier)) {
					$multiplier +=1;
				}
			$start = 20*$multiplier-19;
			} else { $start = ($_SESSION['start']+1); }
		} else { $start = ($_SESSION['start']+1); }
        if(count($ranking->getRank()) > 0) {
        	$ranking = $ranking->getRank();
            for($i=$start;$i<($start+20);$i++) {
            if(isset($ranking[$i]['wref']) && $ranking[$i] != "pad") {
                	if($i == $search) {
                    echo "<tr class=\"hl\"><td class=\"ra fc\" >";
                    }
                    else {
                    echo "<tr><td class=\"ra \" >";
                    }
                    echo $i.".</td><td class=\"vil \" ><a href=\"karte.php?d=".$ranking[$i]['wref']."&amp;c=".$generator->getMapCheck($ranking[$i]['wref'])."\">".$ranking[$i]['name']."</a></td>";
                    echo "<td class=\"pla \" ><a href=\"spieler.php?uid=".$ranking[$i]['owner']."\">".$ranking[$i]['user']."</a></td>";
                    echo "<td class=\"hab\">".$ranking[$i]['pop']."</td><td class=\"aligned_coords \" ><div class=\"cox\">(".$ranking[$i]['x']."</div><div class=\"pi\">|</div><div class=\"coy\">".$ranking[$i]['y'].")</div></td></tr>";
                }
            }
        }
         else {
        	echo "<td class=\"none\" colspan=\"5\">Não foram encontradas aldeias</td>";
        }
            ?>
            <?php
include("ranksearch.tpl");
?>