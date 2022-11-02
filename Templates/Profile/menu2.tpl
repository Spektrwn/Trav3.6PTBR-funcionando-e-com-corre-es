<div id="textmenu">
   <a href="spieler.php?uid=<?php if(isset($_GET['uid'])) { echo $_GET['uid']; } else { echo $session->uid; } ?>" <?php if(isset($_GET['uid'])) { echo "class=\"selected\""; } ?>>Visão geral</a>
 | <span class=none><b>Perfil</b></span>
 | <span class=none><b>Preferências</b></span>
 | <span class=none><b>Conta</b></span>
 <?php
 if(GP_ENABLE) {
 ?>
 | <span class=none><b>Pacote Gráfico</b></span>
 <?php
 }
 ?>

</div>