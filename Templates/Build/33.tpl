<?php
include("next.tpl");
?>
<div id="build" class="gid33">
<h1>Paliçada <span class="level">Nível <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc">Ao construir um Paliçada você pode proteger sua aldeia contra as hordas bárbaras de seus inimigos. Quanto maior o nível da parede, maior o bônus dado à defesa de suas tropas.</p>

<table cellpadding="1" cellspacing="1" id="build_value">
		<tr>
			<th>Bônus de defesa agora:</th>
			<td><b><?php echo $bid33[$village->resarray['f'.$id]]['attri']; ?></b> Por cento</td>
		</tr><tr>
        <?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
		$next = $village->resarray['f'.$id]+1+$loopsame+$doublebuild+$master;
		if($next<=20){
        ?>
			<th>Bônus de Defesa ao nível <?php echo $next; ?>:</th>

			<td><b><?php echo $bid33[$next]['attri']; ?></b> Por cento</td>
            <?php
            }else{
		?>
		<th>Bônus de Defesa agora ao nível 20:</th>
		<td><b><?php echo $bid33[20]['attri']; ?></b> Por cento</td>
		<?php
			}
			}
            ?>
		</tr></table>
<?php 
include("upgrade.tpl");
?>
        </p>
         </div>