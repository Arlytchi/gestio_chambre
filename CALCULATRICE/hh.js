function verif(){
    var nombre=document.getElementById("lenombre").value;
    var nombre2=document.getElementById("lenombre2").value; 
    var msError="";/**cette variable contiendra toutes les erreurs */
    document.getElementById("erreur").innerHTML="";
    if(nombre==""){
        msError +="Veuillez renseigner le champ Nombre 1 <br>";
    }

    if(nombre2==""){
        msError +="Veuillez renseigner le champ Nombre 2 <br>";
    }
    if(nombre2<="0" && nombre2!=""){
        msError += "Impossible"
    }
    
    if(msError==""){
        document.getElementById("enregistrer").removeAttribute("disabled");
    }
    else{
        document.getElementById("erreur").innerHTML=msError;
        document.getElementById("enregistrer").setAttribute("disabled", "true");

    }
}