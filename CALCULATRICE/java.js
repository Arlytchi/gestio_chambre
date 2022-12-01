
function calcul(){
    var nbr1,nbr2,multi,addi,div;
    multi = nbr1*nbr2;
    addi = nbr1+nbr2;
    div = nbr1/nbr2;

    nbr1=Number(document.getElementById("nbr1").value);
    nbr2=Number(document.getElementById("nbr2").value);
    document.getElementById("multi").value=multi;
    document.getElementById("addi").value=addi;
    document.getElementById("div").value=div;
}