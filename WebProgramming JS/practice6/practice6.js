const canvas = document.querySelector('canvas');
const context = canvas.getContext('2d');

const paddle = {  
    width: 128,
    height: 24,
    position: {
        x: 0,
        y: 0,
    },
    velocityX:0
}
paddle.position.x = canvas.width / 2 - paddle.width / 2;
paddle.position.y = canvas.height - 10 - paddle.height;
const brickWidth = 80;
const brickHeight = 20;
const bricks = [ // initialize bricks
    [null, null, null, null, null, null, null, null], 
    [null, {}, null, {}, {}, {}, {}, null],
    [null, {}, null, null, null, null, null, null], 
    [null, null, null, null, null, null, null, null],
    [null, null, null, null, null, null, null, null], 
];
const ball = { // initialize ball
    radius : 12,
    position : {
        x:0,
        y:0,
    },
    velocity: {
        x: 0, 
        y: 0,
    }
};

ball.position.x = paddle.position.x + paddle.width /2 - ball.radius;
ball.position.y = paddle.position.y - 2 * ball.radius;
let frameCount= 0;
const startTime = Date.now();

function render () {
    requestAnimationFrame(render);                              // ask browser to render anytimes
    context.clearRect(0,0, canvas.width, canvas.height) ;       // clear the context from 0,0 to entire screen
    const elapsedTime = Date.now() - startTime;                 //render FPS
    const fps = frameCount / (elapsedTime / 1000);
    context.fillText(Math.floor(fps) + ' FPS', canvas.width - 50, 12);
    context.fillRect(paddle.position.x, paddle.position.y, paddle.width, paddle.height); //render paddle
    for ( let i = 0; i< bricks.length; ++i){                    //render bricks
        for (let j = 0 ; j < bricks[i].length; ++j){
            const brick = bricks[i][j];
            const x = j * brickWidth;
            const y = i * brickHeight;
            if (brick){
                context.fillRect(x + 1, y + 1, brickWidth - 2, brickHeight-2); 
            }
        }
    }
    context.beginPath();                                        //render Ball
    context.arc(ball.position.x + ball.radius, ball.position.y + ball.radius, ball.radius, 0, 2 * Math.PI);
    context.fill();

    if (paddle.velocityX !== 0){                                //move paddle
        const newPaddlePositionX = paddle.position.x + paddle.velocityX;
        if (newPaddlePositionX >= 0 && newPaddlePositionX <= canvas.width - paddle.width){
            paddle.position.x = newPaddlePositionX;
        }
        else if ( paddle.velocityX > 0){
            paddle.position.x = canvas.width - paddle.width;
        }
        else{
            paddle.position.x = 0;
        }
        if (ball.velocity.x === 0 && ball.velocity.y === 0){
            ball.position.x =  paddle.position.x + paddle.width /2 - ball.radius;
        }
    }

    if (ball.velocity.x !== 0){                                   // move Ball
        const newBallPositionX = ball.position.x + ball.velocity.x;
        ball.position.x = newBallPositionX;
        if (newBallPositionX <= 0 || newBallPositionX >=canvas.width -2 * ball.radius){
            ball.velocity.x *=-1;
        }

    }

    if (ball.velocity.y !== 0){
        const newBallPositionY = ball.position.y + ball.velocity.y;
        ball.position.y = newBallPositionY;
        if (newBallPositionY <= 0){
            ball.velocity.y *= -1;
        }
    } 

    for ( let i = 0; i< bricks.length; ++i){                    // COllision
        for (let j = 0 ; j < bricks[i].length; ++j){
            const brick = bricks[i][j];
            const x = j * brickWidth;
            const y = i * brickHeight;
            if ( brick && 
                x < ball.position.x + 2 * ball.radius &&
                x + brickWidth > ball.position.x &&
                y < ball.position.y + 2 * ball.radius &&
                y + brickHeight > ball.position.y) {
                ball.velocity.x *= -1;
                ball.velocity.y *= -1;
                break;
            }
        }
    }
    if (paddle.position.x < ball.position.x + 2 * ball.radius &&
        paddle.position.x + paddle.width > ball.position.x &&
        paddle.position.y < ball.position.y + 2 * ball.radius &&
        paddle.position.y + paddle.height > ball.position.y) {
        if (Math.random () < 0.5){
            ball.velocity.x *= Math.random();
        }
        ball.velocity.y *= -1;
    }
    ++frameCount;
}
render();


window.addEventListener('keydown', function (event){
    if (paddle.velocityX === 0){
        if (event.key === 'ArrowRight'){
            paddle.velocityX = 5;
        }
        else if (event.key === 'ArrowLeft'){
            paddle.velocityX = -5;
        }
    }
});

window.addEventListener('keyup', function (event){
    if (event.key === 'ArrowRight' && paddle.velocityX > 0
        || event.key === 'ArrowLeft' && paddle.velocityX < 0){
        paddle.velocityX = 0;
    }
    if (ball.velocity.x === 0 && ball.velocity.y === 0 && event.key === ' '){ 
        ball.velocity.x = -5;
        ball.velocity.y = -5;
    }
});