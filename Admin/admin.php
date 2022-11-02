<?php
#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       admin.php                                                   ##
##  Developed by:  Dzoki                                                       ##
##  Reworked:      aggenkeech                                                  ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2012. All rights reserved.                ##
##                                                                             ##
#################################################################################

session_start();
include("../GameEngine/Database.php");
include("../GameEngine/Admin/database.php");
include("../GameEngine/config.php");
include("../GameEngine/Data/buidata.php");

class timeFormatGenerator
{
	public function getTimeFormat($time)
	{
		$min = 0;
		$hr = 0;
		$days = 0;
		while ($time >= 60): $time -= 60; $min += 1; endwhile;
		while ($min  >= 60): $min  -= 60; $hr  += 1; endwhile;
		while ($hr   >= 24): $hr   -= 24; $days +=1; endwhile;
		if ($min < 10)
		{
			$min = "0".$min;
		}
		if($time < 10)
		{
			$time = "0".$time;
		}
		return $days ." day ".$hr."h ".$min."m ".$time."s";
	}
};
$timeformat = new timeFormatGenerator;
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link REL="shortcut icon" HREF="favicon.ico"/>
		<title>Painel Administrativo</title>
		<link rel=stylesheet type="text/css" href="../img/admin/admin.css">
		<link rel=stylesheet type="text/css" href="../img/admin/acp.css">
		<link rel=stylesheet type="text/css" href="../img/img.css">
		<script src="/mt-full.js?423cb"  type="text/javascript"></script>
		<script src="ajax.js" type="text/javascript"></script>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta http-equiv="imagetoolbar" content="no">
	</head>
	<body>
		<script language="javascript">
			function aktiv() {this.srcElement.className='fl1'; }
			function inaktiv() {event.srcElement.className='fl2'; }

			function del(e,id){
			if(e == 'did'){ var conf = confirm('Você realmente deseja excluir da aldeia ID '+id+'?'); }
			if(e == 'unban'){ var conf = confirm('Você realmente quer desbanir o jogador '+id+'?'); }
			if(e == 'stopDel'){ var conf = confirm('Você realmente deseja parar de excluir o usuário '+id+'?'); }
			if(conf){return true;}else{return false;}
			}
		</script>
		<script type="text/javascript">
			function showStuff(id) {
				document.getElementById(id).style.display = 'block';
			}
			function hideStuff(id) {
				document.getElementById(id).style.display = 'none';
			}
		</script>
		<div id="ltop1">
			<div style="position:relative; width:231px; height:100px; float:left;">
				<img src="../img/x.gif" width="1" height="1">
			</div>
			<img class="fl2" src="../img/admin/x1.gif" width="70" height="100" border="0" onmouseover="this.className='fl1'" onmouseout="this.className='fl2'"><img class="fl2" src="../img/admin/x2.gif" width="70" height="100" border="0" onmouseover="this.className='fl1'" onmouseout="this.className='fl2'"><img class="fl2" src="../img/admin/x3.gif" width="70" height="100" border="0" onmouseover="this.className='fl1'" onmouseout="this.className='fl2'"><img class="fl2" src="../img/admin/x4.gif" width="70" height="100" border="0" onmouseover="this.className='fl1'" onmouseout="this.className='fl2'"><img class="fl2" src="../img/admin/x5.gif" width="70" height="100" border="0" onmouseover="this.className='fl1'" onmouseout="this.className='fl2'"></div>
			<div id="lmidall">
				<div id="lmidlc">
					<div id="lleft" style="width: 160px;">
						<a href="<?php echo HOMEPAGE; ?>"><img src="../img/en/a/travian0.gif" class="logo_plus" width="116" height="60" border="0"></a>
						<table id="navi_table" cellspacing="0" cellpadding="0" style="width: 150px;">
							<tr>
								<td class="menu">
									<?php
										if($funct->CheckLogin())
										{?>
											<?php
											if($_SESSION['access'] == ADMIN)
											{ ?>
												<a href="admin.php">Painel de Controle Administrador</a>
												<a href="<?php echo SERVER; ?>">Retornar ao servidor</a>
												<br />
												<a href="?action=logout">Sair</a>
												<br />
												<a href="#"><b>Informação do Servidor</b></a>
												<a href="?p=server_info">Informação do Servidor</a>
												<a href="?p=online">Usuários Online</a>
												<a href="?p=notregistered">Jogadores não Ativados</a>
												<br />
												<a href="#"><b>Pesquisa</b></a>
												<a href="?p=search">Geral</a>
												<a href="?p=message">IGMs/Relatórios</a>
												<br />
												<a href="#"><b>Banir</b></a>
												<a href="?p=ban">Ban/Desbanir Jogadores</a>
												<a href="?p=maintenence">Manutenção do Servidor</a>
												<a href="?p=cleanban">Limpar Lista de Banidos (TRUNCADO=Não funciona "ainda")</a>
												<br />
												<a href="#"><b>OURO</b></a>
												<a href="?p=gold">Dar a todos ouro grátis</a>
												<a href="?p=usergold">Dar ouro grátis ao usuário</a>
												<a href="?p=maintenenceResetGold">Resetar Ouro</a>
												<br />
												<a href="#"><b>Medalhas por Semana (TRUNCADO=Não funciona "ainda")</b></a>
												<a href="?p=delmedal">Medalhas dos Jogadores (Apagar)=TR</a>
												<a href="?p=delallymedal">Medalhas das Alianças (Apagar)=TR</a>
												<br />
												<a href="#"><b>Plus</b></a>
												<a href="?p=givePlus">Dar a todos Plus</a>
												<a href="?p=maintenenceResetPlus">Resetar Plus</a>
												<br />
												<a href="#"><b>Bonus de Recursos</b></a>
												<a href="?p=givePlusRes">Dar a todos Bonus de Recurso</a>
												<a href="?p=maintenenceResetPlusBonus">Resetar Bonus de Recurso</a>
												<br />
												<a href="#"><b>Mapa</b></a>
												<a href="?p=mapsi">Mapa de todo o jogo</a>
												<?php /*<a href="?p=map">Mapa do jogo + info (+-)</a>*/ ?>
												<br />
												<a href="#"><b>Natars</b></a>
												<a href="?p=natarend">Adicionar aldeias WW</a>
												<a href="?p=natarbuildingplan">Adicionar aldeias WW com Plano de construção</a>
												<br />
												<a href="#"><b>Administrador:</b></a>
												<a href="?p=admin_log"><font color="Red"><b>Log do Administrador</font></b></a>
												<a href="?p=config">Configurações do Servidor</a>
												<?php
											}
											else if($_SESSION['access'] == MULTIHUNTER)
											{ ?>
												<a href="admin.php">Painel de Controle Multihunter</a>
												<a href="<?php echo HOMEPAGE; ?>">Retornar ao servidor</a>
												<a href="#"></a><a href="#"></a>
												<a href="?p=server_info">Informação do Servidor</a>
												<a href="?p=online">Usuários Online</a>
												<a href="?p=search">Pesquisa</a>
												<a href="?p=message">Msg/Relatórios</a>
												<a href="?p=ban">Banir</a>
												<a href="#"></a><a href="#"></a><a href="#"></a>
												<a href="?action=logout">Sair</a><?php
											}
										}
									?>
								</td>
							</tr>
						</table>
					</div>
					<div id="lmid1">
						<div id="lmid3">
							<?php
								if($funct->CheckLogin())
								{
									if($_POST or $_GET)
									{
										if($_GET['p'] and $_GET['p']!="search")
										{
											$filename = 'Templates/'.$_GET['p'].'.tpl';
											if(file_exists($filename))
											{
												include($filename);
											}
											else
											{
												include('Templates/404.tpl');
											}
										}
										else
										{
											include('Templates/search.tpl');
										}
										if($_POST['p'] and $_POST['s'])
										{
											$filename = 'Templates/results_'.$_POST['p'].'.tpl';
											if(file_exists($filename))
											{
												include($filename);
											}
											else
											{
												include('Templates/404.tpl');
											}
										}
									}
									else
									{
										include('Templates/home.tpl');
									}
								}
								else
								{
									include('Templates/login.tpl');
								}
							?>
						</div>
					</div>
				</div>
			<div id="lright1"></div>
			<div id="ce"></div>
		</div>
	</body>
</html>
