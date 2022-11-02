<?php
$count="0";
include("GameEngine/Config.php");

		$connection = mysql_connect(SQL_SERVER, SQL_USER, SQL_PASS) or die(mysql_error());
		mysql_select_db(SQL_DB, $connection) or die(mysql_error());

		$q = "SELECT * FROM ".TB_PREFIX."movement where endtime < ".time()." and proc = 0";
		$result = mysql_query($q, $connection);
		$count=mysql_num_rows($result);

?>

<h1><img class="point" src="img/x.gif" alt="" title="" /> Atolamento de eventos (00:00:0?)</h1>

<p>
Todos os eventos que ocorrem posteriormente são calculados por um sistema de eventos. Caso o servidor esteja sobrecarregado ou a conexão entre servidor web e banco de dados seja ruim, um atolamento de evento pode ocorrer.
<br />
Assim que mais eventos forem recebidos por segundo do que pode ser calculado por segundo, os eventos (por exemplo, "construção terminada" ou "tropas chegaram") serão colocados em um loop em espera.
<br />
A ordem cronológica dos movimentos de tropas permanece a mesma, mesmo em um atolamento evento, de modo que as tropas que normalmente chegariam em algum lugar primeiro ainda chegaram lá primeiro.
<br />

Como jogador, nada pode ser feito contra um atolamento de evento exceto esperar. Normalmente, esses problemas são resolvidos automaticamente após alguns minutos. No momento <b><?php echo $count; ?></b> aguardar eventos </p>

<map id="nav" name="nav">
 <area href="manual.php?s=1" title="atrás" coords="0,0,45,18" shape="rect" alt="" />
 <area href="manual.php?s=1" title="Visão geral" coords="46,0,70,18" shape="rect" alt="" />
 <area href="manual.php?s=1" title="a frente" coords="71,0,116,18" shape="rect" alt="" />
</map>
<img usemap="#nav" src="img/x.gif" class="navi" alt="" />