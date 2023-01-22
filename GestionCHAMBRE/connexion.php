<?php
session_start();
$bdd = new PDO('mysql:host=localhost;dbname=espace_utilisateurs;charset=utf8;', 'root', '');
if(isset($_POST['envoi'])){
    if(!empty($_POST['pseudo']) and !empty($_POST['mdp'])){
        $peudo = htmlspecialchars($_POST['pseudo']);
        $mdp = sha1($_POST['mdp']);

        $recupusers = $bdd->prepare('select * from users where pseudo = ? and Mot_de_passe = ?');
        $recupusers->execute(array($peudo, $mdp));

        //$insertuser = $bdd->prepare('insert into users(Nom, Mot_de_passe)values(?,?)');
        //$insertuser->execute(array($peudo, $mdp));

        if($recupusers->rowCount()>0){
            $_SESSION['Nom'] = $peudo;
            $_SESSION['Mot_de_passe'] = $mdp;
            $_SESSION['ID'] = $recupusers->fetch()['ID'];
            header("Location:index.php");
            exit();

        }else{
            echo "votre identifiant ou nom est incorrect";
        }
    }else{
        echo "Veuillez completer tout les champs";
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        * {
    box-sizing: border-box;
  }
  body {
    font-size: 14px;
  }
  .v0_3 {
    width: 100%;
    height: 700px;
    background: rgb(139, 131, 131);
    opacity: 1;
    position: relative;
    top: 0px;
    left: 0px;
    overflow: hidden;
  }
  .v10_19 {
    width: 100%;
    height: 145%;
    background: url("etudiants-ulaz0z.jpg");
    background-repeat: no-repeat;
    background-position: center center;
    background-size: cover;
    opacity: 1;
    position: absolute;
    top: 0px;
    left: 0px;
    box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
    overflow: hidden;
  }
  .v10_32 {
    width: 439px;
    color: url("etudiants-ulaz0z.jpg");
    position: absolute;
    top: 736px;
    left: 502px;
    font-family: Inter;
    font-weight: Regular;
    font-size: 20px;
    opacity: 1;
    text-align: left;
  }
  .v10_28 {
    width: 532px;
    color: rgba(255,255,255,1);
    position: absolute;
    top: 170px;
    left: 502px;
    font-family: Inter;
    font-weight: Regular;
    font-size: 48px;
    opacity: 1;
    text-align: left;
  }
  .v10_22 {
    width: 439px;
    height: 43px;
    background: rgba(217,217,217,1);
    opacity: 1;
    position: absolute;
    top: 395px;
    left: 502px;
    overflow: hidden;
  }
  .v10_26 {
    width: 161px;
    color: rgba(255,255,255,1);
    position: absolute;
    top: 405px;
    left: 527px;
    font-family: Inter;
    font-weight: Regular;
    font-size: 24px;
    opacity: 1;
    text-align: left;
  }
  .v10_20 {
    width: 599px;
    height: 404px;
    background: rgba(1,1,1,0.6000000238418579);
    opacity: 1;
    position: absolute;
    top: 279px;
    left: 435px;
    overflow: hidden;
  }
  .v10_23 {
    width: 439px;
    height: 43px;
    background: rgba(95,93,93,1);
    opacity: 1;
    position: absolute;
    top: 480px;
    left: 502px;
    overflow: hidden;
  }
  .v10_27 {
    width: 203px;
    color: rgba(255,255,255,1);
    position: absolute;
    top: 491px;
    left: 527px;
    font-family: Inter;
    font-weight: Regular;
    font-size: 24px;
    opacity: 1;
    text-align: left;
  }
  .v10_21 {
    width: 210px;
    color: rgba(94,182,176,1);
    position: absolute;
    top: 323px;
    left: 623px;
    font-family: Inter;
    font-weight: Regular;
    font-size: 32px;
    opacity: 1;
    text-align: left;
  }
  .v10_24 {
    width: 284px;
    height: 51px;
    background: rgba(94,182,176,1);
    opacity: 1;
    position: absolute;
    top: 570px;
    left: 502px;
    overflow: hidden;
  }
  .v10_25 {
    width: 247px;
    color: rgba(255,255,255,1);
    position: absolute;
    top: 582px;
    left: 527px;
    font-family: Inter;
    font-weight: Regular;
    font-size: 24px;
    opacity: 1;
    text-align: left;
  }
  .v10_30 {
    width: 612px;
    color: rgba(251,244,244,0.6200000047683716);
    position: absolute;
    top: 230px;
    left: 435px;
    font-family: Inter;
    font-weight: Regular;
    font-size: 20px;
    opacity: 1;
    text-align: left;
  }
  
    </style>
</head>
<bgody>
<link href="https://fonts.googleapis.com/css?family=Inter&display=swap" rel="stylesheet" /><link href="C:\wamp\www\GestionCHAMBRE\css\style.css" rel="stylesheet" />
<title>Document</title>
</head>
<body>
    <form action="" method="post">
        <div class="v0_3">
        <div class="v10_19"></div><span class="v10_32">IAM digital campus v1.0 2023 © ARLYTCHI</span>
        <span class="v10_28">IAM DIGITAL CAMPUS</span>
        <div class="v10_22"></div>
        <div class="v10_20"></div>
        <div class="v10_23"></div>
        <span class="v10_27"><input type="password" name="mdp" autocomplete="off"></span>
        <span class="v10_26"><input type="text" name="pseudo" autocomplete="off"></span>
        <span class="v10_21">Identification</span>
        <div class="v10_24"></div>
        <span class="v10_25"><input type="submit" name="envoi"></span>
    </form>
    <span class="v10_30">la resource strategique au coeur de l’hebergement des etudiants</span></div>
</body>
</html>
