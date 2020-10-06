const x = 0;

function f(x){
    return 2 * n;
}

// setTimeout(function (){
//     console.log('Hello');
// }, 1000);

// setInterval(function () {
//     console.log('Hello');
// },1000);

function setImmediateInterval(f, delay){
    f();
    setTimeout( () => setImmediateInterval(f, delay), delay);
}

// setImmediateInterval(function(){
//     console.log("hello");
// },1000);

setTimeout(()=> {
    console.log("Hello");
},0);
console.log('world');

