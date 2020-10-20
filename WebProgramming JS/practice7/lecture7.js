const x = 0;
function f(x){
    return 2*x;
}


setTimeout(() => {
    console.log(0);
},1000);


console.log(1);

function waitNSeconds(n, f){
    setTimeout(f, 1000*n);
}

waitNSeconds(1,function(){
    waitNSeconds(3,function(){

    })
})

function waitMSeconds(m){
    return new Promise((resolve,reject) =>{ 
        setTimeout(resolve,1000*m);
    return});
};

waitMSeconds(1)
    .then(() => waitMSeconds(3))
    .then(() => console.log("Hello from the past!"));

// const xhr = new XMLHttpRequest();
// xhr.open("GET", "/numbers.json", true);
// xhr.send();
// xhr.onreadystatechange = function () {
//     if (xhr.readyState === XMLHttpRequest.DONE){
//         if (xhr.status === 200){
//             console.log(JSON.parse(xhr.responseText));
//         }
//     }
// };

fetch('/numbers.json')
    .then(response =>{
        if (response.ok){
            response.json();
        }
        throw Error('Failed to fetch');
    })
    .then(responseBody = {
        console.log(responseBody)
        .catch(error => {
        console.log(error);
    })

console.log(2);