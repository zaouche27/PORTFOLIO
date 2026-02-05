function addition(){

    var a = document.getElementById("t1").value;
    var b = document.getElementById("t2").value;
    var c = Number(a) + Number(b);
    document.getElementById("resultat").value = c;
    afficherResulat(resultat);


}
function soustraction (){

    var a = document.getElementById("t1").value;
    var b = document.getElementById("t2").value;
    var c = Number(a) - Number(b);
    document.getElementById("resultat").value = c;


}

function multiplication (){

    var a = document.getElementById("t1").value;
    var b = document.getElementById("t2").value;
    var c = Number(a) * Number(b);
    document.getElementById("resultat").value = c;


}

function division(){

    var a = document.getElementById("t1").value;
    var b = document.getElementById("t2").value;
    var c = Number(a) / Number(b);
    document.getElementById("resultat").value = c;
    if (b==0){
        document.getElementById("resultat").value = "impossible"
    }

}

function pair()
{
	var x = document.getElementById("t1").value
	if (x % 2 ==0){
    	document.getElementById("Pair").value = " Nombre Pair "
	}
	else{
    	document.getElementById("Pair").value = " Nombre Impair "
	}
}

function permute() {
    var a = document.getElementById("t1").value;
    var b = document.getElementById("t2").value;

    var x = a;
    a = b;
    b = x;

    document.getElementById("t1").value = a;
    document.getElementById("t2").value = b;
}
