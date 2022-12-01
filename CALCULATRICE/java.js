function Calcul() {
    var x, y, addition;
    
    x = Number(document.getElementById("nbr1").value);
    y = Number(document.getElementById("nbr2").value);
    addition = x + y;
    multiplication = x * y;
    //Tester si le diviseur n'est pas égal à 0 avec if
    division = x / y;
    modulo = x % y;

    document.getElementById("addition").value = addition;
    document.getElementById("multiplication").value = multiplication;
    document.getElementById("division").value = division;
    document.getElementById("modulo").value = modulo ;

}

function ControleSaisie(){
    var nombre=document.getElementById("nbr1").value;
    var nombre2=document.getElementById("nbr2").value; 
    var Error="";
    document.getElementById("erreur").innerHTML="";
    if(nombre==""){
        Error +="Veuillez renseigner le champ Nombre 1 <br>";
    }

    if(nombre2==""){
        Error +="Veuillez renseigner le champ Nombre 2 <br>";
    }
    if(nombre2<="0" && nombre2!=""){
        Error += "ERROR : DIVISION IMPOSSIBLE PAR 0"
    }
    
    if(Error==""){
        document.getElementById("valide").removeAttribute("disabled");
    }
    else{
        document.getElementById("erreur").innerHTML=Error;
        document.getElementById("valide").setAttribute("disabled", "true");

    }
}