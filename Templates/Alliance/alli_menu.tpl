<?php if($session->alliance == $aid) {
?>
<div id="textmenu">
   <a href="allianz.php" <?php if(!isset($_GET['s'])) { echo "class=\"selected\""; } ?>>Visão Geral</a>
 | <a href="allianz.php?s=2" <?php if(isset($_GET['s']) && $_GET['s'] == 2) { echo "class=\"selected\""; } ?>>Fórum</a>
 | <a href="allianz.php?s=6" <?php if(isset($_GET['s']) && $_GET['s'] == 6) { echo "class=\"selected\""; } ?>>Chat</a>
 | <a href="allianz.php?s=3" <?php if(isset($_GET['s']) && $_GET['s'] == 3) { echo "class=\"selected\""; } ?>>Ataques</a>
 | <a href="allianz.php?s=4" <?php if(isset($_GET['s']) && $_GET['s'] == 4) { echo "class=\"selected\""; } ?>>Notícias</a>
<?php
if($session->sit == 0){
?>
 | <a href="allianz.php?s=5" <?php if(isset($_GET['s']) && $_GET['s'] == 5) { echo "class=\"selected\""; } ?>>Opções</a>
<?php
}else{
?>
 | <span class=none><b>Opções</b></span>
<?php 
}
?>
</div>
<?php 
}
?>