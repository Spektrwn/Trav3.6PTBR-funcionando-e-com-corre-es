<?php
#################################################################################
##                                                                             ##
##              -= YOU MUST NOT REMOVE OR CHANGE THIS NOTICE =-                ##
##                                                                             ##
## --------------------------------------------------------------------------- ##
##                                                                             ##
##  Project:       ZravianX                                                    ##
##  Version:       2011.11.30                                                  ##
##  Filename:      index.php                            					   ##
##  Developed by:  Dzoki & Advocaite & Donnchadh                               ##
##  Reworked by:   ZZJHONS                                                     ##
##  License:       Creative Commons BY-NC-SA 3.0                               ##
##  Copyright:     ZravianX (c) 2011 - All rights reserved                     ##
##  URLs:          http://zravianx.zzjhons.com                                 ##
##  Source code:   http://www.github.com/ZZJHONS/ZravianX                      ##
##                                                                             ##
#################################################################################

if(!file_exists('GameEngine/config.php')) {
header("Location: install/");
}

include ("GameEngine/config.php");
/*
if($_SERVER['HTTP_HOST'] != '.SERVER.')
{
    header('location: '.SERVER.'');
    exit;
}
*/

// delete the /* and the */ if you not use localhost.

error_reporting(E_ALL || E_NOTICE);

if(file_exists('Security/Security.class.php'))
{
    require 'Security/Security.class.php';
    Security::instance();
}
else
{
    die('Security: Please activate security class!');
}
include ("GameEngine/Database.php");
include ("GameEngine/Lang/".LANG.".php");
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title><?php echo SERVER_NAME; ?> - Powered by ZravianX - Traduzido Spektrtwn</title>
	<link rel="shortcut icon" href="favicon.ico" />
	<link rel="stylesheet" type="text/css" href="gpack/travian/main.css" />
	<link rel="stylesheet" type="text/css" href="gpack/travian/flaggs.css" />
	<link rel="stylesheet" type="text/css" href="gpack/travian/main_en.css" />
	<meta name="content-language" content="<?php echo LANG; ?>" />
	<meta http-equiv="imagetoolbar" content="no" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<script src="mt-core.js" type="text/javascript"></script>
	<script src="new.js" type="text/javascript"></script>
	<script src="new2.js" type="text/javascript"></script>
	<style type="text/css">
		<!-- li.c4 {background-image:url('img/en/welten/en1_big.jpg');} -->
		<!-- li.c3 {background-image:url('img/en/welten/en1_big_g.jpg');} -->
		div.c2 {left:237px;}
		ul.c1 {position:absolute; left:0px; width: 866px;}
		#imagem2 {
			width: 500px;
			height 2000px;
		}
		#texto1 {
			position: absolute;
			top: 390px; 
			left: 400px;
		}
		#texto {
			position: absolute;
			top: 415px;
			left: 400px;
		}
	</style>

</head>

<body class="presto indexPage">
	<div class="wrapper">
		<div id="country_select">
			<div id="flags"></div>
			<script src="flaggen.js?a" type="text/javascript"></script>
			<script type="text/javascript">
			var region_list = new Array('Europe','America','Asia','Middle East','Africa','Oceania');
			show_flags('', '', region_list);
			</script>
		</div>
		<div id="header"><h1><?php echo "Bem vindo"; ?></h1></div>
		<center>
		<div id="navigation">
			<a href="index.php" class="home"><img src="img/x.gif" alt="Travian" /></a>
			<table class="menu">
				<tr>
					<td><a href="http://www.travian.com.br/#tutorial"  target="_blanck"><span><?php echo TUTORIAL; ?></span></a></td>
					<td><a href="anleitung.php"><span><?php echo $lang['index'][0][2]; ?></span></a></td>
					
					<td><a href="anmelden.php" ><span><?php echo $lang['register']; ?></span></a></td>
					<td><a href="login.php" ><span><?php echo LOGIN; ?></span></a></td>
				</tr>
			</table>
		</div>
		</center>
		<?php
		if(T4_COMING==true){
		?>
		<div id="t4play">
		<a href="notification/">
		<img src="img/t4n/Teaser_Prelandingpage_EN.png" alt="Travian 4" />
		</a>
		</div>
		<?php } ?>
		<div id="register_now">
			
			<span><?php echo PLAY_NOW; ?></span>
			<p><span><tr><?php echo STARTED;?></tr>
			<tr><?php echo START_DAT; ?></tr></span></p>
		</div>
		<div id="content">
			<div class="grit">
				<div class="infobox">
					<div id="what_is_travian">
						<h2>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<?php echo $lang['index'][0][4]; ?></h2>
						<p><?php echo $lang['index'][0][5]; ?></p>
						<center>
						<p class="play_now"><a href="login.php" ><?php echo $lang['index'][0][6]; ?></a></p>
						</center>
					</div>
					<div id="signup_layer" class="overlay">
					<div class="mask closer"></div>
						<div id="signup_list" class="overlay_content">
							<h2><?php echo CHOOSE; ?></h2>
							<a href="#" class="closer"><img class="dynamic_img" alt="Close" src="img/un/x.gif" /></a>
							<ul class="world_list">
								<table border="0">
									<tr>				
										<a href="login.php" onmouseover="document.NOME.src='img/en/welten/en1_big.jpg'" onmouseout="document.NOME.src='img/en/welten/en1_big_g.jpg'"><img id="imagem2" src="img/en/welten/en1_big_g.jpg" name="NOME" Border="0"></a>
										<div id="texto1" class="label_players c0"><?php echo PLAYERS; ?>: <?php echo $users; ?></div>
										<div id="texto" class="label_online c0"><?php echo ONLINE; ?>: <?php echo $online; ?></div>
									</tr>
								</table>
							</ul>
							<div class="footer"></div>
						</div>
					</div>
					<div id="player_counter">
						<table>
							<tbody>
								<tr>
									<th>&emsp;&emsp;&emsp;<?php
										   echo $lang['index'][0][7];
									?>:</th>
									<td><?php
										   $users = mysql_num_rows(mysql_query("SELECT * FROM " . TB_PREFIX . "users WHERE tribe!=0 AND tribe!=4 AND tribe!=5"));
										   echo $users;
									?></td>
								</tr>
								<tr>
									<th>&emsp;&emsp;&emsp;<?php
										   echo $lang['index'][0][8];
									?>:</th>
									<td><?php
										   $active = mysql_num_rows(mysql_query("SELECT * FROM " . TB_PREFIX . "users WHERE " . time() . "-timestamp < (3600*24) AND tribe!=0 AND tribe!=4 AND tribe!=5"));
										   echo $active;
									?></td>
								</tr>
								<tr>
									<th>&emsp;&emsp;&emsp;<?php
										   echo $lang['index'][0][9];
									?>:</th>
									<td><?php
										   $online = mysql_num_rows(mysql_query("SELECT * FROM " . TB_PREFIX . "users WHERE " . time() . "-timestamp < (60*10) AND tribe!=0 AND tribe!=4 AND tribe!=5"));
										   echo $online;
									?></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div id="about_the_game">
						<h2>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<?php echo $lang['index'][0][10]; ?>:</h2>
						<ul>
							<li><?php echo $lang['index'][0][11]; ?></li>
							<li><?php echo $lang['index'][0][12]; ?></li>
							<li><?php echo $lang['index'][0][13]; ?></li>
						</ul>
					</div>
				</div>
				
				<div id="screenshot_layer" class="overlay">
					<div class="mask closer"></div>
					<div class="overlay_content">
						<a href="#" class="closer"><img class="dynamic_img" alt="Close" src="img/x.gif" /></a>
						<div class="screenshot_view">
							<h4 id="screen_hl"></h4>
							<img id="screen_view" src="img/x.gif" alt="Screenshot" name="screen_view" />
							<div id="screen_desc"></div>
						</div>
							<a href="#prev" class="navi prev" onclick="galarie.showPrev();"><img class="dynamic_img" src="img/x.gif" alt="previous" /></a>
							<a href="#next" class="navi next" onclick="galarie.showNext();"><img class="dynamic_img" src="img/x.gif" alt="next" /></a>
							<div class="footer"></div>
					</div>
				</div>
				<script type="text/javascript">
					var screenshots = [
					{'img':'img/en/s/s1.png','hl':"<?php echo $lang['screenshots']['title1']; ?>", 'desc':"<?php echo $lang['screenshots']['desc1']; ?>"},
					{'img':'img/en/s/s2.png','hl':"<?php echo $lang['screenshots']['title2']; ?>", 'desc':"<?php echo $lang['screenshots']['desc2']; ?>"},
					{'img':'img/en/s/s4.png','hl':"<?php echo $lang['screenshots']['title3']; ?>", 'desc':"<?php echo $lang['screenshots']['desc3']; ?>"},
					{'img':'img/en/s/s3.png','hl':"<?php echo $lang['screenshots']['title4']; ?>", 'desc':"<?php echo $lang['screenshots']['desc4']; ?>"},
					{'img':'img/en/s/s5.png','hl':"<?php echo $lang['screenshots']['title5']; ?>", 'desc':"<?php echo $lang['screenshots']['desc5']; ?>"},
					{'img':'img/en/s/s7.png','hl':"<?php echo $lang['screenshots']['title6']; ?>", 'desc':"<?php echo $lang['screenshots']['desc6']; ?>"},
					{'img':'img/en/s/s8.png','hl':"<?php echo $lang['screenshots']['title7']; ?>", 'desc':"<?php echo $lang['screenshots']['desc7']; ?>"}];
					var galarie = new Fx.Screenshots('screen_view', 'screen_hl', 'screen_desc', screenshots);
				</script>		
				<div class="secondarybox">
					<div id="screenshots">
						
						<a href="#last" class="navi prev dynamic_btn"><img class="dynamic_btn" src="img/x.gif" alt="previous" /></a>
						<div id="screenshots_preview">
							<ul id="screenshot_list" class="c1">
								<li><?php echo SCREENSHOTS; ?><a href="#"><img src="img/un/s/s1s.jpg" alt="Screenshot" /></a> 
								<a href="#"><img src="img/un/s/s2s.jpg" alt="Screenshot" /></a>
								<a href="#"><img src="img/un/s/s4s.jpg" alt="Screenshot" /></a>
								<a href="#"><img src="img/un/s/s3s.jpg" alt="Screenshot" /></a>
								<a href="#"><img src="img/un/s/s5s.jpg" alt="Screenshot" /></a>
								<a href="#"><img src="img/un/s/s7s.jpg" alt="Screenshot" /></a>
								<a href="#"><img src="img/un/s/s8s.jpg" alt="Screenshot" /></a></li>
							</ul>
						</div><a href="#next" class="navi next"><img class="dynamic_btn" src="img/x.gif" alt="next" /></a>
					</div>
					<div id="newsbox">
					<br>
					<br>
					<br>
					<br>
						<h2><?php echo NEWS; ?></h2>
					</div>
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<div id="footer">
			<div class="container">

				<ul class="menu">
					<p><a href="anleitung.php?s=3"><?php echo FAQ; ?></a> |
					
					<td><?php echo SPIELREGELN; ?></td> |
					<td><?php echo AGB; ?></td> |
					<td><?php echo IMPRINT; ?></td>
					<li class="copyright">&copy; 2011 - ZravianX - All rights reserved</li>
				</ul>
			</div>
		</div>
	</div>
<div class="mask closer"></div>
		<div id="signup_list" class="overlay_content">
			
			<a href="#" class="closer"><img class="dynamic_img" alt="Close" src="img/un/x.gif" /></a>
			<ul class="world_list">
				<table border="0">
					<tr>				
						
						<div id="texto1" class="label_players c0"><?php echo PLAYERS; ?>: <?php echo $users; ?></div>
						<div id="texto" class="label_online c0"><?php echo ONLINE; ?>: <?php echo $online; ?></div>
						</tr>
				</table>
			</ul>
			<div class="footer"></div>
		</div>
	</div>
</body>
</html>
