<?php
#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       config.tpl                                                  ##
##  Developed by:  Dzoki                                                       ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2011. All rights reserved.                ##
##                                                                             ##
#################################################################################
?>
<?php
mysql_connect(SQL_SERVER, SQL_USER, SQL_PASS);
mysql_select_db(SQL_DB);
if ($_SESSON['access'] == MULTIHUNTER) die("<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><b><font color='Red'><center>Acesso negado: você não é administrador</b></font></center>");
?>

<style>
	.del {width:12px; height:12px; background-image: url(img/admin/icon/del.gif);}
</style>
<h2><center>Made by Dzoki / Traduzido Spketrwn</center></h2>
<table id="member">
	<thead>
		<tr>
		<th>~ Configurações do servidor ~</th>
		</tr>
	</thead>
</table>

<table id="profile">
	<tr>
		<td class="b">Variáveis</td>
		<td class="b">Valores</td>
	</tr>
	<tr>
		<td>Nome do servidor</td>
		<td><?php echo SERVER_NAME;?></td>
	</tr>
	<tr>
		<td>Servidor iniciado</td>
		<td><?php echo date("d.m.y H:i",COMMENCE);?></td>
	</tr>
	<tr>
		<td>Linguagem</td>
		<td><?php if(LANG == en){ echo 'English'; } 
		elseif (LANG == pt-BR) {echo 'Português BR';}?></td>
	</tr>
	<tr>
		<td>Velocidade do servidor</td>
		<td><?php echo ''.SPEED.'x';?></td>
	</tr>
	<tr>
		<td>Tamanho do mapa</td>
		<td><?php echo WORLD_MAX;?>x<?php echo WORLD_MAX;?></td>
	</tr>
	<tr>
		<td>Velocidade da tropa</td>
		<td><?php echo INCREASE_SPEED;?>x</td>
	</tr>
	<tr>
		<td>Velocidade de Expansão da Aldeia</td>
		<td><?php if(CP == 0){ echo "Fast"; } else if(CP == 1){ echo "Slow"; } ?></td>
	</tr>
	<tr>
		<td>Proteção de iniciante</td>
		<td><?php echo (PROTECTION/3600);?> horas/s</td>
	</tr>
	<tr>
		<td>E-mail de ativação</td>
		<td><?php if(AUTH_EMAIL == true) { echo "<b><font color='Green'>Enabled</font></b>"; } else if(AUTH_EMAIL == false){ echo "<b><font color='Red'>Disabled</font></b>"; } ?></td>
	</tr>
	<tr>
		<td>Pergunta</td>
		<td><?php if(QUEST == true) { echo "<b><font color='Green'>Enabled</font></b>"; } else if(QUEST == false) { echo "<b><font color='Red'>Disabled</font></b>"; } ?></td>
	</tr>
	<tr>
		<td>Demolição - Nível necessário</td>
		<td><?php echo DEMOLISH_LEVEL_REQ; ?></td>
	</tr>
	<tr>
		<td>Estatísticas da Maravilha do Mundo</td>
		<td><?php if(WW == true) { echo "<b><font color='Green'>Enabled</font></b>"; } else if(WW == false) { echo "<b><font color='Red'>Disabled</font></b>"; } ?></td>
	</tr>
	<tr>
		<td><b><font color='#71D000'>P</font><font color='#FF6F0F'>l</font><font color='#71D000'>u</font><font color='#FF6F0F'>s</font></b> duração da conta</td>
		<td><?php if(PLUS_TIME >= 86400){ echo ''.(PLUS_TIME/86400).' Days'; } else if(PLUS_TIME < 86400){ echo ''.(PLUS_TIME/3600).' Hours'; } ?></td>
	</tr>
	<tr>
		<td>+25% duração da produção</td>
		<td><?php if(PLUS_PRODUCTION >= 86400){ echo ''.(PLUS_PRODUCTION/86400).' Days'; } else if(PLUS_PRODUCTION < 86400){ echo ''.(PLUS_PRODUCTION/3600).' Hours'; } ?></td>
	</tr>
	</table>

	<table id="member">
		<thead>
			<tr>
				<th>~ Configuração dos Log's ~</th>
			</tr>
		</thead>
	</table>

  <table id="profile">
  <tr>
		<td class="b">Variáveis</td>
		<td class="b">Valores</td>
	</tr>
	<tr>
		<td>Log de Construção</td>
		<td><?php if(LOG_BUILD == true) { echo "<b><font color='Green'>Enabled</font></b>"; } else if(LOG_BUILD == false){ echo "<b><font color='Red'>Disabled</font></b>"; } ?></td>
	</tr>
	<tr>
		<td>Log de Technologia</td>
		<td><?php if(LOG_TECH == true) { echo "<b><font color='Green'>Enabled</font></b>"; } else if(LOG_TECH == false){ echo "<b><font color='Red'>Disabled</font></b>"; } ?></td>
	</tr>
	<tr>
		<td>Log de Acesso</td>
		<td><?php if(LOG_LOGIN == true) { echo "<b><font color='Green'>Enabled</font></b>"; } else if(LOG_LOGIN == false){ echo "<b><font color='Red'>Disabled</font></b>";  } ?></td>
	</tr>
	<tr>
		<td>Log do Ouro</td>
		<td><?php if(LOG_GOLD_FIN == true) { echo "<b><font color='Green'>Enabled</font></b>"; } else if(ALOG_GOLD_FIN == false){ echo "<b><font color='Red'>Disabled</font></b>"; } ?></td>
	</tr>
	<tr>
		<td>Log do Administrador</td>
		<td><?php if(LOG_ADMIN == true) { echo "<b><font color='Green'>Enabled</font></b>"; } else if(LOG_ADMIN == false){ echo "<b><font color='Red'>Disabled</font></b>";  } ?></td>
	</tr>
	<tr>
		<td>Log de Guerra</td>
		<td><?php if(LOG_WAR == true) {	echo "<b><font color='Green'>Enabled</font></b>"; } else if(LOG_WAR == false){ echo "<b><font color='Red'>Disabled</font></b>"; } ?></td>
	</tr>
	<tr>
		<td>Log de Comércio</td>
		<td><?php if(LOG_MARKET == true) { echo "<b><font color='Green'>Enabled</font></b>"; } else if(LOG_MARKET == false){ echo "<b><font color='Red'>Disabled</font></b>"; } ?></td>
	</tr>
	<tr>
		<td>Log de Ilegalidades</td>
		<td><?php if(LOG_ILLEGAL == true) { echo "<b><font color='Green'>Enabled</font></b>"; } else if(LOG_ILLEGAL == false){ echo "<b><font color='Red'>Disabled</font></b>";  } ?></td>
	</tr>
</table>

<table id="member">
	<thead>
		<tr>
			<th>~ Configurações da caixa de notícias ~</th>
		</tr>
	</thead>
</table>

<table id="profile">
	<tr>
		<td class="b">Variáveis</td>
		<td class="b">Valores</td>
	</tr>
	<tr>
		<td>Caixa de notícias 1</td>
		<td><?php if(NEWSBOX1 == true){ echo "<b><font color='Green'>Enabled</font></b>"; } else if(NEWSBOX1 == false){ echo "<b><font color='Red'>Disabled</font></b>"; } ?> </td>
	</tr>
	<tr>
		<td>Caixa de notícias 2</td>
		<td><?php if(NEWSBOX2 == true){ echo "<b><font color='Green'>Enabled</font></b>"; } else if(NEWSBOX2 == false){ echo "<b><font color='Red'>Disabled</font></b>"; } ?> </td>
	</tr>
	<tr>
		<td>Caixa de notícias 3</td>
		<td><?php if(NEWSBOX3 == true){ echo "<b><font color='Green'>Enabled</font></b>"; } else if(NEWSBOX3 == false){ echo "<b><font color='Red'>Disabled</font></b>"; } ?> </td>
	</tr>
	<tr>
	<td>Casa 1</td>
		<td><?php if(HOME1 == true){ echo "<b><font color='Green'>Enabled</font></b>"; } else if(HOME1 == false){ echo "<b><font color='Red'>Disabled</font></b>"; } ?> </td>
	</tr>
	<tr>
	<td>Casa 2</td>
		<td><?php if(HOME2 == true){ echo "<b><font color='Green'>Enabled</font></b>"; } else if(HOME2 == false){ echo "<b><font color='Red'>Disabled</font></b>"; } ?> </td>
	</tr>
	<tr>
	<td>Casa 3</td>
		<td><?php if(HOME3 == true){ echo "<b><font color='Green'>Enabled</font></b>"; } else if(HOME3 == false){ echo "<b><font color='Red'>Disabled</font></b>"; } ?> </td>
	</tr>
</table>

<table id="member">
	<thead>
		<tr>
			<th>~ Configurações SQL  ~</th>
		</tr>
	</thead>
</table>

<table id="profile">
	<tr>
		<td class="b">Variáveis</td>
		<td class="b">Valores</td>
	</tr>
	<tr>
		<td>Nome do Host</td>
		<td><?php echo SQL_SERVER;?></td>
	</tr>
	<tr>
		<td>Usuário do Banco de Dados</td>
		<td><?php echo SQL_USER;?></td>
	</tr>
	<tr>
		<td>Senha do Banco de Dados</td>
		<td>*********</td>
	</tr>
	<tr>
		<td>Nome do DB </td>
		<td><?php echo SQL_DB;?></td>
	</tr>
	<tr>
		<td>Prefixo da Tabela</td>
		<td><?php echo TB_PREFIX;?></td>
	</tr>
	<tr>
		<td>Banco de Dados Tipo</td>
		<td><?php if(DB_TYPE == 0) { echo "MYSQL"; } else if(DB_TYPE == 1) { echo "MYSQLi"; } ?></td>
	</tr>
</table>

<table id="member">
  <thead>
		<tr>
			<th>~ Configurações Extras ~</th>
		</tr>
	</thead>
</table>

<table id="profile">
	<tr>
		<td class="b">Variáveis</td>
		<td class="b">Valores</td>
	</tr>
	<tr>
		<td>Limite na caixa de mensagem</td>
		<td><?php if(LIMIT_MAILBOX == true){ echo "<b><font color='Green'>Enabled</font></b>"; } else if(LIMIT_MAILBOX == false){ echo "<b><font color='Red'>Disabled</font></b>"; } ?></td>
	</tr>
	<tr>
		<td>Número máximo de mails</td>
		<td><?php if(LIMIT_MAILBOX == true){ echo MAX_MAIL; } else if(LIMIT_MAILBOX == false){ echo "<font color='Gray'>Limit mailbox disabled</font>"; } ?></td>
	</tr>
	<tr>
		<td>Incluir Admin no ranque</td>
		<td><?php if(INCLUDE_ADMIN == true){ echo "<b><font color='Green'>Enabled</font></b>"; } else if(INCLUDE_ADMIN == false){ echo "<b><font color='Red'>Disabled</font></b>"; } ?></td>
	</tr>
</table>

<table id="member">
	<thead>
		<tr>
			<th>~ Informações do Administrador ~</th>
		</tr>
	</thead>
</table>
<table id="profile">
  <tr>
		<td class="b">Variáveis</td>
		<td class="b">Valores</td>
	</tr>
	<tr>
		<td>Admin E-mail</td>
		<td><?php if(ADMIN_EMAIL == ''){ echo "<b><font color='Red'>No admin email defined!</b></font>"; } else if(ADMIN_EMAIL != ''){ echo ADMIN_EMAIL; } ?></td>
	</tr>
	<tr>
		<td>Admin Nome</td>
		<td><?php if(ADMIN_NAME == ''){ echo "<b><font color='Red'>No admin name defined!</b></font>"; } else if(ADMIN_NAME != ''){ echo ADMIN_NAME; } ?></td>
	</tr>
</table>

<?php
function define_array( $array, $keys = NULL )
{
	foreach( $array as $key => $value )
	{
		$keyname = ($keys ? $keys . "_" : "") . $key;
		if( is_array( $array[$key] ) )
			define_array( $array[$key], $keyname );
		else
			define( $keyname, $value );
	}
}
//define_array($array);
?>