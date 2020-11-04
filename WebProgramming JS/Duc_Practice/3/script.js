
// document.addEventListener("keydown", function(){
//     console.log(inp.values);
// })

document.addEventListener('keydown', function (event){
    var inp = document.getElementById("input").value;
    if ((event.key == "Backspace")|| (event.keyCode < 48)){
        event.preventDefault();
    }
    console.log(inp);
    ValidateIPaddress(inp);
});

function ValidateIPaddress(ipaddress) {  
    if (/^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/.test(ipaddress)) {  
      console.log(true);
    }  else console.log (false)  ;
}  
