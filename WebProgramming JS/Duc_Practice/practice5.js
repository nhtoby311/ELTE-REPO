const canvas = document.body.querySelector('canvas');
const context = canvas.getContext('2d');
let x = 0;
let y =0
let xVelocity = 0;
let yVelocity = 0;
const player = { 
    width: 100,
    height: 100
}

function render() {
    requestAnimationFrame(render); // request browser to render if it can 
    //context.fillStyle= 'red';
    context.clearRect(0,0, canvas.width,canvas.height); // start from (0,0) to the end of canvas (x,y) coordinate
    context.fillRect(x,y,100,5);
    
    const newX = x+xVelocity;
    const newY = y+yVelocity;

    if (newX <= canvas.width - player.width && newX >= 0){
        x = newX;
    }
    if (newY <= canvas.height - player.height && newY >= 0){
        y = newY;
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
        else if (event.key === 'ArrowDown'){
            yVelocity=1;
        } 
        else if (event.key === 'ArrowUp'){
            yVelocity=-1;
        }
    } 
});

window.addEventListener('keyup', function(event){   // release left arrow
    // if ((xVelocity > 0 && event.key === 'ArrowRight' ) || (xVelocity < 0 && event.key === 'ArrowLeft' ) ) {
    //     xVelocity = 0;        
    // }
    // if ((yVelocity > 0 && event.key === 'ArrowDown') || (yVelocity < 0 && event.key === 'ArrowUp')){
    //     yVelocity = 0;
    // }         
});

