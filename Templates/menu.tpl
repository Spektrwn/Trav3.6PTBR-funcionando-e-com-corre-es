<?php

/** --------------------------------------------------- **\
| ********* DO NOT REMOVE THIS COPYRIGHT NOTICE ********* |
+---------------------------------------------------------+
| Credits:     All the developers including the leaders:  |
|              Advocaite & Dzoki & Donnchadh              |
|                                                         |
| Copyright:   TravianX Project All rights reserved       |
\** --------------------------------------------------- **/

?><?php
if(!$session->logged_in) {
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <title></title>
    <style type="text/css">
div.c1 {text-align: center}
    </style>
</head>

<body>
    <div id="side_navi">
        <a id="logo" href="<?php echo HOMEPAGE; ?>" name="logo"><img src="img/x.gif" alt="Travian"></a>

        <p><a href="login.php"><?php echo LOGIN; ?></a> <a href="anmelden.php"><?php echo REG; ?></a></p>
    </div><?php
    }
    else {
    ?>

    <div id="side_navi">
        
		<?php
		if ($session->plus==1){
			?><a><href=""><img src="../Travi-Files/img/en/a/travian1.gif"></a> <?php
		}
		if ($session->plus==0){
			?><a><href=""><img src="../Travi-Files/img/en/a/travian0.gif"></a> <?php
		}
		?>
        <p><a href="spieler.php?uid=<?php echo $session->uid; ?>"><?php echo PROFILE; ?></a> <a href="#" onclick="return Popup(0,0,1);"><?php echo INSTRUCT; ?></a> <?php if($session->access == MULTIHUNTER) {

                    echo "<a href=\"Admin/admin.php\"><font color=\"Blue\">Painel Multihunter</font></a>";
                    } ?> <?php if($session->access == ADMIN) {
                    echo "<a href=\"Admin/admin.php\"><font color=\"Red\">".ADMIN_PANEL."</font></a>";
                    echo "<a href=\"massmessage.php\">".MASS_MESSAGE."</a>";
                    echo "<a href=\"medals.php\">".UPDATE_T_10."</a>";
                    echo "<a href=\"sysmsg.php\">".SYSTEM_MESSAGE."</a>";
					echo "<a href=\"create_account.php\">Criar Artefatos Natars (87)</a>";
                    } ?> <a href="logout.php"><?php echo LOGOUT;?></a></p>

        <p><a href="plus.php?id=3">Ouro<b></b></a>
        <br></p>
		<?php
		$timestamp = $database->isDeleting($session->uid);
		if($timestamp) {
		echo "<td colspan=\"2\" class=\"count\">";
		if($timestamp > time()+48*3600) {
		echo "<a href=\"spieler.php?s=3&id=".$session->uid."&a=1&e=4\"><img
		class=\"del\" src=\"img/x.gif\" alt=\"Cancelar o processo\"
		title=\"Cancelar o processo\" /> </a>";
		}
		$time=$generator->getTimeFormat(($timestamp-time()));
        echo "<a href=\"spieler.php?s=3\"> A conta será excluída em <span
		id=\"timer1\">".$time."</span> .</a></td>";
		}
		?>
    </div><?php
    if($_SESSION['ok']=='1'){
    ?>

    <div id="content" class="village1">
        <h1>Announcement</h1>
</br>
        <h3>Hi <?php echo $session->username; ?>,</h3>
        <?php include("Templates/text.tpl"); ?>
        <div class="c1">
		</br>
            <h3><a href="dorf1.php?ok">&raquo; Go to my village</a></h3>
        </div>
    </div>

    <div id="side_info">
        <?php
        include("Templates/multivillage.tpl");
        include("Templates/links.tpl");
        ?>
    </div>

    <div class="clear"></div>


    <div class="clear"></div><?php 
    include("Templates/res.tpl"); 
    ?>

    <div id="stime">
        <div id="ltime">
            <div id="ltimeWrap">
                Calculated in <b><?php
                echo round(($generator->pageLoadTimeEnd()-$start)*1000);
                ?></b> ms
                <br>
                Server time: <span id="tp1" class="b"><?php echo date('H:i:s'); ?></span>
            </div>
        </div>
    </div>

    <div id="ce"></div><?php
    die();
    }
    }
    ?>
</body>
</html>
