<?php
#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       function.php                                                ##
##  Developed by:  Dzoki                                                       ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2011. All rights reserved.                ##
##                                                                             ##
#################################################################################

class funct {

  function CheckLogin(){
	if($_SESSION['access'] >= MULTIHUNTER and $_SESSION['id']){
	  return true;
	}else{
	  return false;
	}
  }

  function Act($get){
	global $admin,$database;

	switch($get['action']){
	  case recountPop:
		$admin->recountPop($get['did']);
		$admin->recountCP($get['did']);
	  break;
	  case recountPopUsr:
		$admin->recountPopUser($get['uid']);
	  break;
	  case StopDel:
		//stop deleting
	  break;
	  case delVil:
		$admin->DelVillage($get['did']);
	  break;
	  case delBan:
		$admin->DelBan($get['uid'],$get['id']);
		//remove ban
	  break;
	  case addBan:
		if($get['time']){$end = time()+$get['time']; }else{$end = '';}

		  if(is_numeric($get['uid'])){
		  $get['uid'] = $get['uid'];
		  }else{
		  $get['uid'] = $database->getUserField(addslashes($get['uid']),'id',1);
		  }

		$admin->AddBan($get['uid'],$end,$get['reason']);
		//add ban
	  break;
	  case delOas:
		//oaza
	  break;
	  case logout:
		$this->LogOut();
	  break;
	}
	if($get['action'] == 'logout'){
	  header("Location: admin.php");
	}else{
	  header("Location: ".$_SERVER['HTTP_REFERER']);
	}
  }

  function Act2($post){
	global $admin,$database;
	  switch($post['action']){
	  case DelPlayer:
		$admin->DelPlayer($post['uid'],$post['pass']);
		header("Location: ?p=search&msg=ursdel");
	  break;
	  case punish:
		$admin->Punish($post);
		header("Location: ".$_SERVER['HTTP_REFERER']);
	  break;
	  case addVillage:
		$admin->AddVillage($post);
		header("Location: ".$_SERVER['HTTP_REFERER']);
	  break;
	  }
  }

  function LogIN($username,$password){
	global $admin,$database;
	if($admin->Login($username,$password)){
	  //$_SESSION['username'] = $username;
	  $_SESSION['access'] = $database->getUserField($username,'access',1);
	  $_SESSION['id'] = $database->getUserField($username,'id',1);
	  header("Location: ".$_SERVER['HTTP_REFERER']);
	  //header("Location: admin.php");
	}else{
	  echo "Error";
	}
  }

  function LogOut(){
	$_SESSION['access'] = '';
	$_SESSION['id'] = '';
  }

	public function procResType($ref) {
		global $session;
		switch($ref) {
			case 1: $build = "Bosque"; break;
			case 2: $build = "Poço de Barro"; break;
			case 3: $build = "Mina de Ferro"; break;
			case 4: $build = "Campo de Cereais"; break;
			case 5: $build = "Serraria"; break;
			case 6: $build = "Alvenaria"; break;
			case 7: $build = "Fundição"; break;
			case 8: $build = "Moinho"; break;
			case 9: $build = "Padaria"; break;
			case 10: $build = "Armazém"; break;
			case 11: $build = "Celeiro"; break;
			case 12: $build = "Ferreiro"; break;
			case 13: $build = "Fábrica de Armaduras"; break;
			case 14: $build = "Praça de Torneios"; break;
			case 15: $build = "Edifício Principal"; break;
			case 16: $build = "Ponto de Reunião Militar"; break;
			case 17: $build = "Mercado"; break;
			case 18: $build = "Embaixada"; break;
			case 19: $build = "Quartel"; break;
			case 20: $build = "Cavalaria"; break;
			case 21: $build = "Oficina"; break;
			case 22: $build = "Academia"; break;
			case 23: $build = "Esconderijo"; break;
			case 24: $build = "Casa do Povo"; break;
			case 25: $build = "Residencia"; break;
			case 26: $build = "Palácio"; break;
			case 27: $build = "Tesouraria"; break;
			case 28: $build = "Companhia de Comércio"; break;
			case 29: $build = "Grande Quartel"; break;
			case 30: $build = "Grande Cavalaria"; break;
			case 31: $build = "Muralha"; break;
			case 32: $build = "Barreira"; break;
			case 33: $build = "Paliçada"; break;
			case 34: $build = "Alojamento do Pedreiro"; break;
			case 35: $build = "Cervejaria"; break;
			case 36: $build = "Fábrica de Armadilhas"; break;
			case 37: $build = "Mansão do Herói"; break;
			case 38: $build = "Grande Armazém"; break;
			case 39: $build = "Grande Celeiro"; break;
			case 40: $build = "Maravilha do Mundo"; break;
			case 41: $build = "Bebedouro para cavalos"; break;
			case 42: $build = "Grande Oficina"; break;
			default: $build = "Error"; break;
		}
		return $build;
	}

};

$funct = new funct;
if($funct->CheckLogin()){
  if($_GET['action']){
	$funct->Act($_GET);
  }
  if($_POST['action']){
	$funct->Act2($_POST);
  }
}
if($_POST['action']=='login'){
  $funct->LogIN($_POST['name'],$_POST['pw']);
}
?>