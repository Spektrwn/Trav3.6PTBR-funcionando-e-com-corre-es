<div id="textmenu">
   <a href="dorf3.php" class="<?php if(!isset($_GET['s'])){echo 'selected';}?>">Visão geral</a>
 | <a href="dorf3.php?s=2" class="<?php if($_GET['s'] == 2){echo 'selected';}?>">Recursos</a>             
 | <a href="dorf3.php?s=3" class="<?php if($_GET['s'] == 3){echo 'selected';}?>">Armazém</a>
 | <a href="dorf3.php?s=4" class="<?php if($_GET['s'] == 4){echo 'selected';}?>">Pontos Cultura</a>  
 | <a href="dorf3.php?s=5" class="<?php if($_GET['s'] == 5){echo 'selected';}?>">Tropas</a>
</div>