<?php 

#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       quest.tpl                                                   ##
##  Developed by:  Dzoki                                                       ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2011. All rights reserved.                ##
##                                                                             ##
#################################################################################

if ($_SESSION['qst']!=24 && QUEST==true){?>

<div id="anm" style="width:120px; height:140px; visibility:hidden;"></div>
			<div id="qge">
				<?php if ($_SESSION['qst']==0){ ?>
				<img onclick="qst_handle();" src="img/x.gif" id="qgei" class="q_l<?php echo $session->userinfo['tribe'];?>" title="para a tarefa" style="height:174px" alt="para a tarefa" />
				<?php }else{?>
				<img onclick="qst_handle();" src="img/x.gif" id="qgei2" class="q_l<?php echo $session->userinfo['tribe'];?>" title="para a tarefa" style="height:174px" alt="para a tarefa" />
				<?php } ?>
			</div>
			<script type="text/javascript">
				<?php if ($_SESSION['qst']==0){ ?>
				quest.number=null;
				<?php }else{ ?>
				quest.number=0;
				<?php } ?>
				quest.last = 23;
				cache_preload = new Image();
				cache_preload.src = "img/x.gif";
				cache_preload.className = "wood";
			</script>						
<?php } ?>

