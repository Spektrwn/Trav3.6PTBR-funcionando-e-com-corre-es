<?php
#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       ban_msq.tpl                                                 ##
##  Developed by:  yi12345                                                     ##
##  Copyright:     TravianX (c) 2010-2011. All rights reserved.                ##
##                                                                             ##
#################################################################################
$time = time();
$ban = mysql_query("SELECT * FROM ".TB_PREFIX."banlist WHERE `uid` = '".$session->uid."' and active = 1");
$ban1 = mysql_fetch_array($ban);
?>

<p></br>
Olá <?php echo $ban1['name']; ?>!
Você foi banido devido a uma violação das regras.
</br>
A razão por ser banido  é <?php echo $ban1['reason']; ?>.
</br>

</br></br> Para garantir que você não será banido novamente no futuro, você deve ler as regras cuidadosamente:
</br></br><center> <?php echo "<a class=\"rules\" href=\"rules.php\">» Regras do jogo</a>"; ?> </center>
</br></br></br>
Para continuar jogando entre em contato com o Multihunter e se explique diretamente com ele
</br></br><center> <?php echo "<a class=\"rules\" href=\"nachrichten.php?t=1&id=5\">» Escrever mensagem</a>"; ?> </center>
</br></br>
Preste atenção ao seguinte conselho ao escrever sua mensagem:
</br></br>
● Há sempre uma razão para uma proibição. <u>Tente pensar em possíveis razões para essa proibição</u> Se explique direito com o Multihunter.
</br>
● Multihunters podem rever enormes quantidades de informações sobre contas. <u>Fieis à verdade</u> E não faça desculpas para justificar sua violação das regras.
</br>
● Seja cooperativo e perspicaz, isso pode reduzir a punição.
</br>
● Se o Multihunter não responder imediatamente, então ele / ela provavelmente não está online. O problema não será resolvido mais rapidamente pelo envio de várias mensagens, especialmente se ele / ela não leu mesmo a primeira ainda.
</br>
● Se você realmente foi banido injustamente, tente ficar <u>calmo e educado</u> ao conversar com o Multihunter e contar a ele / ela sobre o seu ponto de vista.
</p>