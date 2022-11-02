<?php
#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       home.tpl                                                    ##
##  Developed by:  Dzoki                                                       ##
##  Reworked:      aggenekech												   ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2011. All rights reserved.                ##
##                                                                             ##
#################################################################################
?>
<font size="3">
	<b>
		<center>
			BEM-VINDO AO
				<?php
				if($_SESSION['access'] == MULTIHUNTER)
				{
					echo 'MULTIHUNTER';
				}
				else if($_SESSION['access'] == ADMIN)
				{
					echo 'ADMINISTRATOR';
				} ?>
			PAINEL DE CONTROLE
		</center>
	</b>
</font>


<br /><br /><br /><br />

	Olá <b><?php echo $_SESSION['username']; ?></b>, Você está logado como: <b><font color="Red">Administrador</font></b></center>
	<br /><br /><br />

	<br /><br /><br /><br /><br />


	<font color="#c5c5c5" size="1">
		Credits: Akakori & Elmar<br />
		Fixed, remade and new features added by <b>Dzoki</b><br />
		Reworked by <b>aggenkeech</b>
	</font>