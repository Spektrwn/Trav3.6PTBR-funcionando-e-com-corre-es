<div id="build" class="gid17"><a href="#" onClick="return Popup(17,4);" class="build_logo">  
    <img class="building g17" src="img/x.gif" alt="Mercado" title="Mercado" />  
</a>  
<h1>Mercado <span class="level">Nível <?php echo $village->resarray['f'.$id]; ?></span></h1>  
<p class="build_desc">No Mercado você pode trocar recursos com outros jogadores. Quanto maior o seu nível, mais recursos podem ser transportados ao mesmo tempo.</p>  
  
<?php include("17_menu.tpl"); ?> 
<form method="POST" action="build.php">  
    <input type="hidden" name="id" value="<?php echo $id; ?>" />  
    <input type="hidden" name="ft" value="mk2" />  
  
    <table id="sell" cellpadding="1" cellspacing="1">  
        <tr>  
            <th>Oferecendo</th>  
            <td class="val"><input class="text" tabindex="1" name="m1" value="" maxlength="6" /></td>  
            <td class="res">  
                <select name="rid1" tabindex="2" class="dropdown">  
                    <option value="1" selected="selected">Madeira</option>  
                    <option value="2">Barro</option>  
                    <option value="3">Ferro</option>  
                    <option value="4">Cereal</option>  
                </select>  
            </td>  
            <td class="tra"><input class="check" type="checkbox" tabindex="5" name="d1" value="1" /> tempo máximo de transporte: <input class="text" tabindex="6" name="d2" value="2" maxlength="2" /> horas</td> 
        </tr>  
        <tr>  
            <th>Procurando</th>  
            <td class="val"><input class="text" tabindex="3" name="m2" value="" maxlength="6" /></td>  
            <td class="res">  
                <select name="rid2" tabindex="4" class="dropdown">  
                    <option value="1">Madeira</option>  
                    <option value="2" selected="selected">Barro</option>  
                    <option value="3">Ferro</option>  
                    <option value="4">Cereal</option>  
                </select>  
            </td>  
            <td class="al"> 
                <?php  
                    if($session->userinfo['alliance'] != 0) 
                    { 
                        echo "<input class=\"check\" type=\"checkbox\" tabindex=\"7\" name=\"ally\" value=\"1\" /> Própria aliança apenas"; 
                    } 
                ?>  
            </td> 
        </tr>  
    </table> 

    <?php 
        if(isset($_GET['e1'])) 
        { 
            echo "<p class=\"error2\">Recursos insuficientes</p>"; 
        } 
        elseif(isset($_GET['e2'])) 
        { 
            echo "<p class=\"error2\">Oferta inválida</p>"; 
        } 
        elseif(isset($_GET['e3'])) 
        { 
            echo "<p class=\"error2\">Mercadores insuficientes</p>"; 
        } 
        else 
        { 
            echo "<p>Mercadores: ".$market->merchantAvail()."/".$market->merchant."</p>"; 
        } 
    ?> 
    <input type="image" tabindex="8" value="ok" name="s1" id="btn_ok" class="dynamic_img" src="img/x.gif" alt="OK" <?php //if(!$market->merchantAvail()) { echo "DISABLED"; }?>/></p> 
</form> 
<?php 
if(count($market->onmarket) > 0) 
{ 
    echo "<table id=\"sell_overview\" cellpadding=\"1\" cellspacing=\"1\"><thead><tr><th colspan=\"6\">Suas ofertas</th></tr><tr><td>&nbsp;</td><td>Oferta</td><td>Procura</td><td>Comerciantes</td><td>Aliança</td><td>Duração</td></tr></thead><tbody>"; 
    foreach($market->onmarket as $offer) 
    { 
        if($session->access != BANNED) 
        { 
            echo "<tr><td class=\"abo\"><a href=\"build.php?id=$id&t=2&a=5&del=".$offer['id']."\"><img class=\"del\"src=\"img/x.gif\" alt=\"Apagar\" title=\"Apagar\" /></a></td>"; 
            echo "<td class=\"val\">"; 
        } 
        else 
        { 
            echo "<tr><td class=\"abo\"><a href=\"banned.php\"><img class=\"del\"src=\"img/x.gif\" alt=\"Apagar\" title=\"Apagar\" /></a></td>"; 
            echo "<td class=\"val\">"; 
        } 
        switch($offer['gtype']) 
        { 
            case 1: echo "<img src=\"img/x.gif\" class=\"r1\" alt=\"Madeira\" title=\"Madeira\" />"; break; 
            case 2: echo "<img src=\"img/x.gif\" class=\"r2\" alt=\"Barro\" title=\"Barro\" />"; break; 
            case 3: echo "<img src=\"img/x.gif\" class=\"r3\" alt=\"Ferro\" title=\"Ferro\" />"; break; 
            case 4: echo "<img src=\"img/x.gif\" class=\"r4\" alt=\"Cereal\" title=\"Cereal\" />"; break; 
        } 
        echo $offer['gamt']; 
        echo "</td><td class=\"val\">"; 
        switch($offer['wtype']) 
        { 
            case 1: echo "<img src=\"img/x.gif\" class=\"r1\" alt=\"Madeira\" title=\"Madeira\" />"; break; 
            case 2: echo "<img src=\"img/x.gif\" class=\"r2\" alt=\"Barro\" title=\"Barro\" />"; break; 
            case 3: echo "<img src=\"img/x.gif\" class=\"r3\" alt=\"Ferro\" title=\"Ferro\" />"; break; 
            case 4: echo "<img src=\"img/x.gif\" class=\"r4\" alt=\"Cereal\" title=\"Cereal\" />"; break; 
        } 
        echo $offer['wamt']; 
        echo "</td><td class=\"tra\">1</td><td class=\"al\">"; 
        echo ($offer['alliance'] == 0)? 'Não' : 'Sim'; 
        echo "</td><td class=\"dur\">"; 
        if($offer['maxtime'] != 0) 
        { 
            echo $offer['maxtime']/3600; 
            echo " hrs."; 
        } 
        else 
        { 
            echo "Todos"; 
        } 
        echo "</td></tr>"; 
    } 
    echo "</table>"; 
} 
?> 
</div>