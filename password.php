<?php

#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       password.php                                                ##
##  Developed by:  Dixie                                                       ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2011. All rights reserved.                ##
##                                                                             ##
#################################################################################
if(!file_exists('GameEngine/config.php')) {
	header("Location: install/");
	exit;
}
include("GameEngine/config.php");
include("GameEngine/Lang/" . LANG . ".php");
include("GameEngine/Database.php");
include("GameEngine/Mailer.php");
include("GameEngine/Generator.php");

if(!isset($_REQUEST['npw'])){
	header("Location: login.php");
	exit;
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
	<title><?php echo SERVER_NAME; ?></title>
		<link REL="shortcut icon" HREF="favicon.ico"/>
	<meta name="content-language" content="en" />
	<meta http-equiv="cache-control" content="max-age=0" />
	<meta http-equiv="imagetoolbar" content="no" />
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="mt-core.js?0faaa" type="text/javascript"></script>
	<script src="mt-more.js?0faaa" type="text/javascript"></script>
	<script src="unx.js?0faaa" type="text/javascript"></script>
	<script src="new.js?0faaa" type="text/javascript"></script>
	<link href="<?php echo GP_LOCATE; ?>lang/en/compact.css?f4b7c" rel="stylesheet" type="text/css" />
	<link href="<?php echo GP_LOCATE; ?>lang/en/lang.css?f4b7c" rel="stylesheet" type="text/css" />
	<link href="<?php echo GP_LOCATE ?>travian.css?f4b7c" rel="stylesheet" type="text/css" />
		<link href="<?php echo GP_LOCATE ?>lang/en/lang.css" rel="stylesheet" type="text/css" />
	   </head>

<body class="v35 ie ie7" onload="initCounter()">

<div class="wrapper">
<div id="dynamic_header">
</div>
<div id="header"></div>
<div id="mid">
<?php include("Templates/menu.tpl"); ?>
<div id="content"  class="activate">

		<h1><img src="img/x.gif" class="passwort" alt="new password" /></h1>
		<h5><img src="img/x.gif" class="img_u22" alt="forgotten password" /></h5>

<?php
	// user input email and submit
	if(isset($_POST['email']) && isset($_POST['npw'])){
		$uid = intval($_POST['npw']);
		$email = $database->getUserField($uid, 'email', 0);
		$username = $database->getUserField($uid, 'username', 0);
		if($email != $_POST['email']){
			echo "<p>Infelizmente, o endereço de e-mail inserido não corresponde ao usado para registrar a conta.</p>\n";
		}else{
			// generate password and cpw
			$npw = $generator->generateRandStr(7);
			$cpw = $generator->generateRandStr(10);

			$database->addPassword($uid, $npw, $cpw);

			// send password mail
			$mailer->sendPassword($email, $uid, $username, $npw, $cpw);

			echo "<p>Password was sent to: ${_POST['email']}</p>\n";
		}

	// user click the link in 'password forgotten' email
	}else if(isset($_GET['cpw']) && isset($_GET['npw'])){
		$uid = intval($_GET['npw']);
		$cpw = preg_replace('#[^a-zA-Z0-9]#', '', $_GET['cpw']);

		if(!$database->resetPassword($uid, $cpw)){
			echo '<p>A senha não foi alterada. Talvez o código de ativação já tenha sido usado.</p>';
		}else{
			echo '<p>A senha foi alterada com êxito.</p>';
		}


	// user click 'generate password' link in login fail page, display input form here
	}else {

?>
		<p>Antes de poder solicitar uma nova palavra-passe, tem de introduzir o endereço de e-mail que foi utilizado para registar a conta.
<br /><br />Depois, você receberá um e-mail com uma nova senha. A senha só funcionará depois de confirmá-la,.</p>
		<form action="password.php" method="POST">
			<p>
				<b>E-mail</b><br />
				<input type="hidden" name="npw" value="<?php echo intval($_GET['npw']); ?>" />
				<input class="text" type="text" name="email" maxlength="50" />
			</p>

			<p>
				<input type="image" value="ok" name="s1" src="img/x.gif" class="dynamic_img" id="btn_ok" alt="OK" />
			</p>
		</form>
<?php
	}
?>
</div>
<div id="side_info" class="outgame">
</div>

<div class="clear"></div>
			</div>

			<div class="footer-stopper outgame"></div>
			<div class="clear"></div>

<?php include("Templates/footer.tpl"); ?>
<div id="ce"></div>
</body>
</html>