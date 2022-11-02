<?php

#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       ww.tpl                                                      ##
##  Developed by:  Dixie                                                       ##
##  Edited by:     Dzoki                                                       ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2011. All rights reserved.                ##
##                                                                             ##
#################################################################################
	$loopsame = ($building->isCurrent($id) || $building->isLoop($id))?1:0;
	$doublebuild = ($building->isCurrent($id) && $building->isLoop($id))?1:0;
?>

<div id="build" class="gid40"><a href="#" onClick="return Popup(40,4);" class="build_logo">
	<img class="building g40" src="img/x.gif" alt="Maravilha do Mundo" title="Maravilha do Mundo" />
</a>
<h1>Maravilha do Mundo <br /><span class="level">Nível <?php echo $village->resarray['f'.$id];?></span></h1>
<p class="build_desc">A Maravilha do Mundo (também conhecida como WW) é tão maravilhosa quanto parece. "Este edifício" foi construído para ganhar o servidor. Cada nível da Maravilha do Mundo custa centenas de milhares (até milhões) de recursos para construir.</p>
<form action="GameEngine/Game/WorldWonderName.php" method="POST">
<input type="hidden" name="vref" value="<?php echo $_SESSION['wid']; ?>" />
<?php
$vref = $_SESSION['wid'];
$wwname = $database->getWWName($vref);

if($village->resarray['f'.$id] < 0){
echo 'Você precisa ter o nível 1 da maravilha do mundo para poder mudar seu nome.
			<center><br />Nome da Maravilha do Mundo: <input class="text" name="wwname" id="wwname" disabled="disabled" value="'.$wwname.'" maxlength="20"></center><p class="btn"><input type="image" value="" tabindex="9" name="s1" disabled="disabled" id="btn_ok" class="dynamic_img" src="img/x.gif" alt="OK" /></p>';
} else if($village->resarray['f'.$id] > 0 and $village->resarray['f'.$id] < 11) {
echo '<center><br />Nome da Maravilha do Mundo: <input class="text" name="wwname" id="wwname" value="'.$wwname.'" maxlength="20"></center><p class="btn"><input type="image" value="" tabindex="9" name="s1" id="btn_ok" class="dynamic_img" src="img/x.gif" alt="OK" /></p>'; 
} else if ($village->resarray['f'.$id] > 10){
echo 'Você não pode mudar o nome da Maravilha do Mundo após o nível 10.
			<center><br />Nome da Maravilha do Mundo: <input class="text" name="wwname" id="wwname" disabled="disabled" value="'.$wwname.'" maxlength="20"></center><p class="btn"><input type="image" value="" tabindex="9" name="s1" disabled="disabled" id="btn_ok" class="dynamic_img" src="img/x.gif" alt="OK" /></p>';
}?>
    </form>
	<?php
    if(isset($_GET['n'])) {
		echo '<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="Red"><b>Nome alterado.</b></font>';
		  }
		  ?>

<?php
include("wwupgrade.tpl");
?>
</p></div>