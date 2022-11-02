

<?php 
#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       header.tpl                                                  ##
##  Developed by:  Dzoki                                                       ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2011. All rights reserved.                ##
##                                                                             ##
#################################################################################
?>
<style type="text/css">
#btn_plusz {		
			width: 107px;
			height 130px;
			position: absolute;
			top: -39px;
			left: 640px;
		}
</style>
<div id="header">
    <div id="mtop">
        <a href="dorf1.php" id="n1" accesskey="1"><img src="img/x.gif" title="Visão geral da aldeia" alt="Visão geral da aldeia" /></a>
        <a href="dorf2.php" id="n2" accesskey="2"><img src="img/x.gif" title="Centro da aldeia" alt="Centro da aldeia" /></a>
        <a href="karte.php" id="n3" accesskey="3"><img src="img/x.gif" title="Mapa" alt="Mapa" /></a>
        <a href="statistiken.php" id="n4" accesskey="4"><img src="img/x.gif" title="Estatisticas" alt="Estatisticas" /></a>
        <?php
        if($message->unread && !$message->nunread) {
        $class = "i2";
        }
        else if(!$message->unread && $message->nunread) {
        $class = "i3";
        }
        else if($message->unread && $message->nunread) {
        $class = "i1";
        }
        else {
        $class = "i4";
        }
        ?>
          <div id="n5" class="<?php echo $class ?>">
            <a href="berichte.php" accesskey="5"><img src="img/x.gif" class="l" title="Relatórios" alt="Relatórios"/></a>
            <a href="nachrichten.php" accesskey="6"><img src="img/x.gif" class="r" title="Mensagens" alt="Mensagens" /></a>
        </div>
		<?php
		if ($session->plus==1){
			?><a href="plus.php?id=3"><img src="../Travi-Files/gpack/travian_default/lang/en/a/plus.gif" id="btn_plusz" class="<?php echo ($session->plus == 1 && strtotime("NOW") <= $session->userinfo['plus'])? 'active' : 'inactive';?>" title="Menu Plus" alt="Menu Plus"></a><?php
		}
		?>
		<div class="clear"></div>
    </div>
</div>