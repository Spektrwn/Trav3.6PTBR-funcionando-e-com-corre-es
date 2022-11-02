<?php 
        if(!isset($timer)) {
        $timer = 1;
        }
		$timeleft = $database->getVillageField($village->wid, 'celebration');
		if($timeleft > Time()){
			echo '</br>';
			echo '<table cellpadding="0" cellspacing="0" id="building_contract">';
			echo '<tr><td>';
            echo 'A celebração ainda segurá por:';
            echo "</td><td><span id=\"timer".$timer."\">";
            echo $generator->getTimeFormat($timeleft-time());
            echo "</span> hrs.</td>";
            echo "<td>finaliza às ".date('H:i', $timeleft)."</td></tr>";
			echo "</table>";
            $timer +=1;
		}
?>