<?php 
if(!is_numeric($_SESSION['search'])) {
?>
	<center><font color=orange size=2><p class=\"error\">O usuário <b>"<?php echo $_SESSION['search']; ?>"</b> não existe.</p></font></center>
<?php
    $search = 0;
}
else {
$search = $_SESSION['search'];
}
?>
<table cellpadding="1" cellspacing="1" id="player_off" class="row_table_data">
			<thead>
				<tr>
					<th colspan="5">
						Os atacantes mais bem sucedidos						<div id="submenu"><a title="Top 10" href="statistiken.php?id=7"><img class="btn_top10" src="img/x.gif" alt="Top 10" /></a><a title="defender" href="statistiken.php?id=32"><img class="btn_def" src="img/x.gif" alt="Defensorx" /></a><a title="attacker" href="statistiken.php?id=31"><img class="active btn_off" src="img/x.gif" alt="attacker" /></a></div>		    
					</th>
				</tr>
		<tr><td></td><td>Jogador</td><td>População</td><td>Aldeias</td><td>Pontos</td></tr>
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
            	if(isset($ranking[$i]['username']) && $ranking[$i] != "pad") {
                	if($session->uid == $ranking[$i]['id']){
					echo "<tr class=\"hl\"><td class=\"ra fc\" >";
                    }
                    else {
                    echo "<tr><td class=\"ra \" >";
                    }
                    echo $i.".</td><td class=\"pla \" >";
						if($ranking[$i]['access'] > 2){
						echo"<u><a href=\"spieler.php?uid=".$ranking[$i]['id']."\">".$ranking[$i]['username']."</a></u>";
						} else {
						echo"<a href=\"spieler.php?uid=".$ranking[$i]['id']."\">".$ranking[$i]['username']."</a>";
						}	
					echo"</td><td class=\"pop \" >".$ranking[$i]['totalpop']."";
                    echo "</td><td class=\"vil\">".$ranking[$i]['totalvillages']."</td><td class=\"po \" >".$ranking[$i]['apall']."</td></tr>";
                }
            }
        }
         else {
        	echo "<td class=\"none\" colspan=\"5\">Usuários não encontrados</td>";
        }
        ?>
        <?php
include("ranksearch.tpl");
?>
