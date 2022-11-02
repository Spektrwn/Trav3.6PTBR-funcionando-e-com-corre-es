<?php

#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       Mailer.php                                                  ##
##  Developed by:  Dixie                                                       ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2011. All rights reserved.                ##
##                                                                             ##
#################################################################################

class Mailer {

	function sendActivate($email,$username,$pass,$act) {

		$subject = "Bem-vindo ao ".SERVER_NAME;

		$message = "Olá ".$username."

Obrigado pelo seu registo.

----------------------------
Nome: ".$username."
Senha: ".$pass."
Código de ativação: ".$act."
----------------------------

Clique no link a seguir para ativar sua conta:
".SERVER."activate.php?code=".$act."

Saudações,
Administração Travian ";

		$headers = "From: ".ADMIN_EMAIL."\n";

		mail($email, $subject, $message, $headers);
	}

	function sendInvite($email,$uid,$text) {

		$subject = "".SERVER_NAME." Cadastro";

		$message = "Olá ".$username."

Experimente o novo ".SERVER_NAME."!


Atalho: ".SERVER."anmelden.php?id=ref".$uid."

".$text."


Saudações,
Travian";

		$headers = "From: ".ADMIN_EMAIL."\n";

		mail($email, $subject, $message, $headers);
	}

	function sendPassword($email,$uid,$username,$npw,$cpw) {

		$subject = "Senha perdida";

		$message = "Olá ".$username."

Você solicitou uma nova senha para Travian.

----------------------------
Nome: ".$username."
Senha: ".$npw."
----------------------------

Clique neste link para ativar sua nova senha. A senha antiga então
Torna-se á inválida:

http://${_SERVER['HTTP_HOST']}/password.php?cpw=$cpw&npw=$uid

Se você quiser mudar a sua nova senha, você pode inserir uma nova em seu perfil
na guia \"account\".

No caso de você não solicitar uma nova senha, você pode ignorar este e-mail.

Travian
";

		$headers = "De: ".ADMIN_EMAIL."\n";

		mail($email, $subject, $message, $headers);
	}

};
$mailer = new Mailer;
?>