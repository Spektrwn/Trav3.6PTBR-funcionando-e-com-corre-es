<?php if($session->goldclub == 1 && count($database->getProfileVillages($session->uid)) > 1) { ?>
<div id="build" class="gid17"><a href="#" onClick="return Popup(17,4);" class="build_logo"> 
	<img class="building g17" src="img/x.gif" alt="Mercado" title="Mercado" /> 
</a> 
<h1>Mercado <span class="level">Nível <?php echo $village->resarray['f'.$id]; ?></span></h1> 
<p class="build_desc">No Mercado você pode trocar recursos com outros jogadores. Quanto maior o seu nível, mais recursos podem ser transportados ao mesmo tempo.
</p> 
 
<?php include("17_menu.tpl"); 

if(isset($_GET['action'])){
$routeaccess = 1;
}
if(isset($_GET['create']) && $session->gold > 1){
$routeaccess = 1;
include("17_create.tpl");
}else if($_GET['action'] == 'editRoute' && isset($_GET['routeid']) && $_GET['routeid'] != ""){
$traderoute = $database->getTradeRouteUid($_GET['routeid']);
if($traderoute == $session->uid){
include("17_edit.tpl");
}
}else{
?>

<p>A rota de comércio permite que você configure rotas para o seu comerciante que ele vai andar todos os dias em uma determinada hora. <br /><br />
Por padrão, isso segue por 7 dias, mas você pode estendê-lo com 7 dias para o custo de <img src="../../<?php echo GP_LOCATE; ?>img/a/gold.gif" alt="Ouro" title="Ouro">2.</p>

<table id="npc" cellpadding="1" cellspacing="1"> 
<thead>
<tr>
<th></th>
<th>Descrição</th>
<th>Começar</th>
<th>Comerciante</th>
<th>Tempo restante</th>
</tr></thead><tbody>
<?php
$routes = $database->getTradeRoute($session->uid);
    if(count($routes) == 0) {
    echo "<td colspan=\"5\" class=\"none\">Nenhuma rota comercial ativa.</td></tr>";
    }else{
foreach($routes as $route){
?>
<tr>
<th><label><input class="radio" type="radio" onclick="window.location.href = '?id=<?php echo $id; ?>&t=4&routeid=<?php echo $route['id']; ?>';" name="routeid" value="<?php echo $route['id']; ?>" <?php if($routeid == $route['id']) { echo "checked"; } ?>></label></th>
<th>
<?php
echo "Rota comercial para <a href=karte.php?d=".$route['wid']."&c=".$generator->getMapCheck($route['wid']).">".$database->getVillageField($route['wid'],"name")."</a>"	
?>
</th>
<th><?php if($route['start'] > 9){ echo $route['start'];}else{ echo "0".$route['start'];} echo ":00"; ?></th>
<th><?php echo $route['deliveries']."x".$route['merchant']; ?></th>
<th><?php echo ceil(($route['timeleft']-time())/86400); echo " dias"; ?></th>
</tr>
<?php }} ?>
        </tbody><tfoot><tr>
<th>
</th>
	<th colspan="4">
   <a href="build.php?action=extendRoute&routeid=<?php echo $routeid; ?>">Estender </a>*
 | <a href="build.php?id=<?php echo $id; ?>&t=4&action=editRoute&routeid=<?php echo $routeid; ?>">Editar</a>
 | <a href="build.php?action=delRoute&routeid=<?php echo $routeid; ?>">Apagar</a>
	</th></tr></tfoot></table>
		* Estender a rota comercial por 7 dias por 2 <img src="../../<?php echo GP_LOCATE; ?>img/a/gold.gif" alt="Ouro" title="Ouro">
<br>
<div class="options">
    <a class="arrow" href="build.php?gid=17&t=4&create">» Criar nova rota de comércio</a>
</div>
	</div>
<?php
}}else{
header("Location: build.php?id=".$_GET['id']."");
}
?>