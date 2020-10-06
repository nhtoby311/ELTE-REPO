// const x = 0;

// function f(x){
//     return 2 * n;
// }

// const id = setTimeout(function (){
//     console.log('timeout');
// }, 1000);
//clearTimeout(id);
// [setTimeout, clearTimeout] -> [clearTimeout, wait 1000ms to log] -> []

// setInterval(function () {
//     console.log('Hello');
// },1000);

// function setImmediateInterval(f, delay){
//     f();
//     setTimeout( () => setImmediateInterval(f, delay), delay);
//}

// setImmediateInterval(function(){
//     console.log("hello");
// },1000);

// setTimeout(()=> {
//     console.log("Hello");
// },0);
// console.log('world');

// setInterval(function() { //set the refresh rate to 16 ms fps
//     console.log(0);
// },16);

const canvas = document.body.querySelector('canvas');
const context = canvas.getContext('2d');

let x = 500;
let xVelocity = 0;

const player = { 
    width: 100,
    height: 100
}

function render() {
    requestAnimationFrame(render); // request browser to render if it can 
    //context.fillStyle= 'red';
    context.clearRect(0,0, canvas.width,canvas.height); // start from (0,0) to the end of canvas (x,y) coordinate
    context.fillRect(x,100,100,100);
    
    const newX = x+xVelocity;

    if (newX <= canvas.width - player.width && newX >= 0){
        x = newX;
    }
}

render();

window.addEventListener('keydown', function(event){  //pressed left arrow
    if (xVelocity === 0 ){
        if ( event.key === 'ArrowRight' ){
            xVelocity=1;        
        }
        else if ( event.key === 'ArrowLeft' ){
            xVelocity=-1;
        } 
    } 
});

window.addEventListener('keyup', function(event){   // release left arrow
    if ((xVelocity > 0 && event.key === 'ArrowRight' ) || (xVelocity < 0 && event.key === 'ArrowLeft' ) ) {
        xVelocity=0;        
    }         
});

