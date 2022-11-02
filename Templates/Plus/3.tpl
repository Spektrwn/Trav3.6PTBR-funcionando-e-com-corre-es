<?php

    $MyGold = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE `id`='".$session->uid."'") or die(mysql_error());
    $golds = mysql_fetch_array($MyGold);

include("Templates/Plus/pmenu.tpl");


    $MyGold = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE `id`='".$session->uid."'") or die(mysql_error());
    $golds = mysql_fetch_array($MyGold);

        $today = date("mdHi");

if (mysql_num_rows($MyGold)) {
    if($session->gold == 0) {
        echo "<p>Atualmente, você não possui ouro.</p>";
} else {
        echo "<p>Você tem atualmente <b> $session->gold </b>  Ouro</p>";
}
}
 ?>



    <table class="plusFunctions" cellpadding="1" cellspacing="1">
        <thead>
            <tr>
                <td></td>

                <td>Descrição</td>
                <td>Duração</td>
                <td>Ouro</td>
                <td>Ação</td>
            </tr>
        </thead>
        <tbody>

        <tr>
            <td class="man"><a href="#" onClick="return Popup(0,6);"><img class="help" src="img/x.gif" alt="" title="" /></a></td>
            <td class="desc">
                Conta PLUS<br />
        <span class="run">
<?php
$datetimep=$golds['plus'];
$datetime1=$golds['b1'];
$datetime2=$golds['b2'];
$datetime3=$golds['b3'];
$datetime4=$golds['b4'];
$datetimeap=$golds['ap'];
$datetimedp=$golds['dp'];
//Retrieve the current date/time
$date2=strtotime("NOW");


 if ($datetimep == 0) {
     print "get PLUS<br>";
    }else
 if ($datetimep <= $date2) {
     print "Sua vantagem PLUS terminou.<br>";
mysql_query("UPDATE ".TB_PREFIX."users set plus = '0' where `id`='".$session->uid."'") or die(mysql_error());
     } else {

$holdtotmin=(($datetimep-$date2)/60);
$holdtothr=(($datetimep-$date2)/3600);
$holdtotday=intval(($datetimep-$date2)/86400);
    echo "<font color='#B3B3B3' size='1'>Restante: <b>".$holdtotday. "</b> dias";

$holdhr=intval($holdtothr-($holdtotday*24));
    echo " <b>".($holdhr). "</b> horas ";

$holdmr=intval($holdtotmin-(($holdhr*60)+($holdtotday*1440)));
    echo "<b> ".($holdmr). "</b> minutos</font>";
 }
?>
    </span>
            </td>
            <td class="dur"><?php if(PLUS_TIME >= 86400){
            echo ''.(PLUS_TIME/86400).' Dia';
            } else if(PLUS_TIME < 86400){
            echo ''.(PLUS_TIME/3600).' Horas';
            } ?>
            </td>
            <td class="cost"><img src="img/x.gif" class="gold" alt="Ouro" title="Ouro" alt="Ouro" title="Ouro" />10</td>
            <td class="act">

<?php
    $MyGold = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE `id`='".$session->uid."'") or die(mysql_error());
    $golds = mysql_fetch_array($MyGold);

if (mysql_num_rows($MyGold)) {
    if($golds['gold'] > 9 && $datetimep < $date2) {
    echo '
                <a href="plus.php?id=8"><span>Ativar';
}elseif
    ($golds['gold'] > 9 && $datetimep > $date2) {
    echo '
                <a href="plus.php?id=8"><span>Estender';

} else {
    echo '<a href="plus.php?s=1"><span class="none">muito pouco ouro';}
}
 ?>
    </span></a></td>
        </tr>

        <tr>
            <td colspan="5" class="empty"></td>

        </tr>
        <tr>
            <td class="man"><a href="#" onClick="return Popup(1,6);"><img class="help" src="img/x.gif" alt="" title="" /></a></td>
            <td class="desc">
                +<b>25</b>% <img class="r1" src="img/x.gif" alt="Madeira" title="Madeira" /> Produção: Madeira<br />
                <span class="run">
<?php

$tl_b1=$golds['b1'];
 if ($tl_b1 < $date2) {
     print " ";
 } else {
$holdtotmin1=(($tl_b1-$date2)/60);
$holdtothr1=(($tl_b1-$date2)/3600);
$holdtotday1=intval(($tl_b1-$date2)/86400);
$holdhr1=intval($holdtothr1-($holdtotday1*24));
$holdmr1=intval($holdtotmin1-(($holdhr1*60)+($holdtotday1*1440)));
}

 if ($tl_b1 < $date2) {
     print " ";
 } else {

echo "<font color='#B3B3B3' size='1'>Restante <b> ".$holdtotday1. "</b> dias ";
echo "<b>  ".($holdhr1). "</b> horas ";
echo "<b>  ".($holdmr1). "</b> minutos</font> ";

 }
?>
&nbsp;    </span>

            </td>
            <td class="dur"><?php if(PLUS_PRODUCTION >= 86400){
            echo ''.(PLUS_PRODUCTION/86400).' Dia';
            } else if(PLUS_PRODUCTION < 86400){
            echo ''.(PLUS_PRODUCTION/3600).' Horas';
            } ?></td>
            <td class="cost"><img src="img/x.gif" class="gold" alt="Ouro" title="Ouro" />7</td>
            <td class="act"><span class="none">

<?php
if ($session->access != BANNED){
if (mysql_num_rows($MyGold)) {
    if($golds['gold'] > 6 && $tl_b1 < $date2) {
        echo '<a href="plus.php?id=9"><span>Ativar';
}elseif
    ($golds['gold'] > 6 && $datetime1 > $date2) {
    echo '        <a href="plus.php?id=9"><span>Estender';
} else {
    echo '<a href="plus.php?s=1"><span class="none">muito pouco ouro';}
}
} else {
if (mysql_num_rows($MyGold)) {
    if($golds['gold'] > 6 && $tl_b1 < $date2) {
        echo '<a href="banned.php"><span>Ativar';
}elseif
    ($golds['gold'] > 6 && $datetime1 > $date2) {
    echo '        <a href="banned.php"><span>Estender';
} else {
    echo '<a href="banned.php"><span class="none">muito pouco ouro';}
}
}
?>
   </span></a></td>
        </tr>

        <tr>
            <td class="man"><a href="#" onClick="return Popup(2,6);"><img class="help" src="img/x.gif" alt="" title="" /></a></td>

            <td class="desc">
                +<b>25</b>% <img class="r2" src="img/x.gif" alt="Barro" title="Barro" /> Produção: Barro<br />
                <span class="run">
<?php

$tl_b2=$golds['b2'];
 if ($tl_b2 < $date2) {
     print " ";
 } else {
$holdtotmin2=(($tl_b2-$date2)/60);
$holdtothr2=(($tl_b2-$date2)/3600);
$holdtotday2=intval(($tl_b2-$date2)/86400);
$holdhr2=intval($holdtothr2-($holdtotday2*24));
$holdmr2=intval($holdtotmin2-(($holdhr2*60)+($holdtotday2*1440)));
}

 if ($tl_b2 < $date2) {
     print " ";
 } else {

echo "<font color='#B3B3B3' size='1'>Restante: <b> ".$holdtotday2. "</b> dias ";
echo "<b>  ".($holdhr2). "</b> horas ";
echo "<b>  ".($holdmr2). "</b> minutos<font>";

 }
?>
&nbsp;    </span>
            </td>
            <td class="dur"><?php if(PLUS_PRODUCTION >= 86400){
            echo ''.(PLUS_PRODUCTION/86400).' Dia';
            } else if(PLUS_PRODUCTION < 86400){
            echo ''.(PLUS_PRODUCTION/3600).' Horas';
            } ?></td>
            <td class="cost"><img src="img/x.gif" class="gold" alt="Ouro" title="Ouro" />7</td>

            <td class="act"><span class="none">

<?php
if ($session->access != BANNED){
if (mysql_num_rows($MyGold)) {
    if($golds['gold'] > 6 && $tl_b2 < $date2) {
        echo '<a href="plus.php?id=10"><span>Ativar';
}elseif
    ($golds['gold'] > 6 && $tl_b2 > $date2) {
    echo '        <a href="plus.php?id=10"><span>Estender';
} else {
    echo '<a href="plus.php?s=1"><span class="none">muito pouco ouro</span></a></td>';}
}
} else {
if (mysql_num_rows($MyGold)) {
    if($golds['gold'] > 6 && $tl_b2 < $date2) {
        echo '<a href="banned.php"><span>Ativar';
}elseif
    ($golds['gold'] > 6 && $tl_b2 > $date2) {
    echo '        <a href="banned.php"><span>Estender';
} else {
    echo '<a href="banned.php"><span class="none">muito pouco ouro</span></a></td>';}
}
}
 ?>

        </tr>

        <tr>
            <td class="man"><a href="#" onClick="return Popup(3,6);"><img class="help" src="img/x.gif" alt="" title="" /></a></td>
            <td class="desc">
                +<b>25</b>% <img class="r3" src="img/x.gif" alt="Ferro" title="Ferro" /> Produção: Ferro<br />
                <span class="run">
<?php

$tl_b3=$golds['b3'];
 if ($tl_b3 < $date2) {
     print " ";
 } else {
$holdtotmin3=(($tl_b3-$date2)/60);
$holdtothr3=(($tl_b3-$date2)/3600);
$holdtotday3=intval(($tl_b3-$date2)/86400);
$holdhr3=intval($holdtothr3-($holdtotday3*24));
$holdmr3=intval($holdtotmin3-(($holdhr3*60)+($holdtotday3*1440)));
}

 if ($tl_b3 < $date2) {
     print " ";
 } else {

echo "<font color='#B3B3B3' size='1'>Restante: <b> ".$holdtotday3. "</b> dias ";
echo "<b>  ".($holdhr3). "</b> horas ";
echo "<b>  ".($holdmr3). "</b> minutos</font>";

 }
?>
&nbsp;    </span>
            </td>
            <td class="dur"><?php if(PLUS_PRODUCTION >= 86400){
            echo ''.(PLUS_PRODUCTION/86400).' Dia';
            } else if(PLUS_PRODUCTION < 86400){
            echo ''.(PLUS_PRODUCTION/3600).' Horas';
            } ?></td>
            <td class="cost"><img src="img/x.gif" class="gold" alt="Ouro" title="Ouro" />7</td>
            <td class="act"><span class="none">

<?php
if ($session->access != BANNED){
if (mysql_num_rows($MyGold)) {
    if($golds['gold'] > 6 && $tl_b3  < $date2) {
        echo '<a href="plus.php?id=11"><span>Ativar';
}elseif
    ($golds['gold'] > 6 && $tl_b3 > $date2) {
    echo '        <a href="plus.php?id=11"><span>Estender';
} else  {
    echo '<a href="plus.php?s=1"><span class="none">muito pouco ouro';}
}
} else {
if (mysql_num_rows($MyGold)) {
    if($golds['gold'] > 6 && $tl_b3  < $date2) {
        echo '<a href="banned.php"><span>Ativar';
}elseif
    ($golds['gold'] > 6 && $tl_b3 > $date2) {
    echo '        <a href="banned.php"><span>Estender';
} else  {
    echo '<a href="banned.php"><span class="none">muito pouro ouro';}
}
}
 ?>
 <?php
/*
Retirar a linha abaixo igual a esta:
(igual à303)na 309 até (igual à 308) na 349 
nem será necessário incluir esta:
<p>Retirado para melhor jogabilidade.</p>
*/

?>
 
&nbsp;    </span></a></td>
        </tr>
				<tr><td colspan=5></td></tr>

<tr>
        <td class="man"><a href="#"><img  src="img/x.gif" alt="" title="" /></a></td>
        <td class="desc">Compre 1000 de cada recurso  ____________________________</td>
        <td class="dur">agora</td>
        <td class="cost"><img src="img/x.gif" class="gold" alt="Ouro" title="Ouro" />50</td>
        <td class="act"><span class="none">
<?php
if (mysql_num_rows($MyGold)) {
    if($golds['gold'] > 49) {
    echo '
                <a href="ewe.php"><span>Ir';
} else {
    echo '<a href="plus.php?s=1"><span class="none">muito pouco ouro';
    }
}
 ?>
		<tr><td colspan=5></td></tr>

<tr>
        <td class="man"><a href="#"><img  src="img/x.gif" alt="" title="" /></a></td>
        <td class="desc">Ganhar 5 ouros   ____________________________</td>
        <td class="dur">agora</td>
        <td class="cost"><img src="img/x.gif" class="gold" alt="Ouro" title="Ouro" />0</td>
        <td class="act"><span class="none">
<?php
if (mysql_num_rows($MyGold)) {
    if($golds['gold'] > -1) {
    echo '
                <a href="buy100k.php"><span>Ir';
} else {
    echo '<a href="plus.php?s=1"><span class="none">too little gold';
    }
}

 ?>
</span></a>
        </td>
</tr>

        <tr>

            <td class="man"><a href="#" onClick="return Popup(4,6);"><img class="help" src="img/x.gif" alt="" title="" /></a></td>
            <td class="desc">
                +<b>25</b>% <img class="r4" src="img/x.gif" alt="Cereal" title="Cereal" /> Produção: Cereal<br />
                <span class="run">
<?php

$tl_b4=$golds['b4'];
 if ($tl_b4 < $date2) {
     print " ";
 } else {
$holdtotmin4=(($tl_b4-$date2)/60);
$holdtothr4=(($tl_b4-$date2)/3600);
$holdtotday4=intval(($tl_b4-$date2)/86400);
$holdhr4=intval($holdtothr4-($holdtotday4*24));
$holdmr4=intval($holdtotmin4-(($holdhr4*60)+($holdtotday4*1440)));
}

 if ($tl_b4 < $date2) {
     print " ";
 } else {

echo "<font color='#B3B3B3' size='1'>Restante: <b> ".$holdtotday4. "</b> dias ";
echo "<b>  ".($holdhr4). "</b> horas ";
echo "<b>  ".($holdmr4). "</b> minutos</font>";
 }
?>
&nbsp;    </span>            </td>
            <td class="dur"><?php if(PLUS_PRODUCTION >= 86400){
            echo ''.(PLUS_PRODUCTION/86400).' Dia';
            } else if(PLUS_PRODUCTION < 86400){
            echo ''.(PLUS_PRODUCTION/3600).' Horas';
            } ?></td>
            <td class="cost"><img src="img/x.gif" class="gold" alt="Ouro" title="Ouro" />7</td>
            <td <span class="none">
<?php
if ($session->access != BANNED){
if (mysql_num_rows($MyGold)) {
    if($golds['gold'] > 6 && $tl_b4 < $date2) {
    echo '<a href="plus.php?id=12"><span>Ativar';
}elseif
    ($golds['gold'] > 6 && $tl_b4 > $date2) {
    echo '        <a href="plus.php?id=12"><span>Estender';
} else {
    echo '<a href="plus.php?s=1"><span class="none">muito pouco ouro';}
}
} else {
if (mysql_num_rows($MyGold)) {
    if($golds['gold'] > 6 && $tl_b4 < $date2) {
    echo '<a href="banned.php"><span>Ativar';
}elseif
    ($golds['gold'] > 6 && $tl_b4 > $date2) {
    echo '        <a href="banned.php"><span>Estender';
} else {
    echo '<a href="banned.php"><span class="none">muito pouco ouro';}
}
}
?>
</span></a></td>
        </tr>

        <tr>
            <td colspan="5" class="empty"></td>
        </tr>
        <tr>

            <td class="man"><a href="#" onClick="return Popup(7,6);"><img class="help" src="img/x.gif" alt="" title="" /></a></td>
            <td class="desc">Complete ordens de construção e pesquisas nesta aldeia agora (não funciona para o Palácio e Residência).</td>
            <td class="dur">agora</td>
            <td class="cost"><img src="img/x.gif" class="gold" alt="Ouro" title="Ouro" />3</td>
            <td class="act"><span class="none">

<?php
if ($session->access != BANNED){
if (mysql_num_rows($MyGold)) {
    if($golds['gold'] > 2) {
    echo '
                <a href="plus.php?id=7"><span>Completar';
} else {
    echo '<a href="plus.php?s=1"><span class="none">muito pouco ouro';
    }
}
} else {
if (mysql_num_rows($MyGold)) {
    if($golds['gold'] > 2) {
    echo '
                <a href="banned.php"><span>Completar';
} else {
    echo '<a href="banned.php"><span class="none">muito pouco ouro';
    }
}
}
 ?>
</span></a></td>
        </tr>

        <tr>
            <td class="man"><a href="#" onClick="return Popup(8,6);"><img class="help" src="img/x.gif" alt="" title="" /></a></td>
            <td class="desc">1:1 Troca no mercado</td>
            <td class="dur"></td>
            <td class="cost"><img src="img/x.gif" class="gold" alt="Ouro" title="Ouro" />3</td>

            <td class="act"><span class="none">

<?php
if ($session->access != BANNED){
if (mysql_num_rows($MyGold)) {
    if($golds['gold'] > 2) {
    echo ' <a href="build.php?gid=17&t=3">';
} else {
    echo '<a href="plus.php?s=1"><span class="none">muito pouco ouro';
    }
}
} else {
if (mysql_num_rows($MyGold)) {
    if($golds['gold'] > 2) {
    echo ' <a href="banned.php"><span>NPC';
} else {
    echo '<a href="banned.php"><span class="none">muito pouco ouro';
    }
}
}
 ?>
</span></a>
            </td>
        </tr>

        </tbody>
    </table>
    <table class="plusFunctions">
        <tr>
            <td class="man"><a href="#" onClick="return Popup(9,6);"><img class="help" src="img/x.gif" alt="" title="" /></a></td>
            <td class="desc">
    Clube do Ouro</></br>
        <span class="run">
    </span>
            </td>
            <td class="dur">ilimitado
            </td>
            <td class="cost"><img src="img/x.gif" class="gold" alt="Ouro" title="Ouro"  />500</td>
            <td class="act">

<?php
    $MyGold = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE `id`='".$session->uid."'") or die(mysql_error());
    $golds = mysql_fetch_array($MyGold);

if (mysql_num_rows($MyGold)) {
	if($golds['goldclub']==0){
    if($golds['gold'] > 499) {
    echo '
                <a href="plus.php?id=15"><span>Ativar';
}else{
    echo '
                <a href="plus.php?s=1"><span class="none">muito pouco ouro';

}} else {
    echo '<a href="plus.php?id=3"><span class="none">Ligar';}
}
 ?>
    </span></a></td>
        </tr>
        </tbody>
    </table>
</div>