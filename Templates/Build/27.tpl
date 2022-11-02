

<body>
    <div id="build" class="gid27">
        <a href="#" onclick="return Popup(27,4);" class="build_logo"><img class="building g27" src="img/x.gif" alt="Tesouraria" title="Tesouraria"></a>

        <h1>Tesouraria <span class="level">Nível <?php echo $village->resarray['f'.$id]; ?></span></h1>

        <p class="build_desc">As riquezas de seu império são mantidas na tesouraria. A tesouraria tem espaço para um tesouro. Depois de ter capturado um artefato que leva 24 horas em um servidor normal ou 12 horas em um servidor de velocidade três para ser eficaz.</p>
        <?php
        
        include("27_menu.tpl");
        if(isset($_GET['show'])){  include("27_show.tpl");  }else{
        if(!isset($_GET['t'])){
            include("27_1.tpl");     
        }elseif(isset($_GET['t']) && $_GET['t'] == 2){
            include("27_2.tpl"); 
        }elseif(isset($_GET['t']) && $_GET['t'] == 3){
            include("27_3.tpl");
        }
        }
        
        include("upgrade.tpl");
        ?>
    </div>