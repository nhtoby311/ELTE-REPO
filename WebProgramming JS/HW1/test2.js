// Generate deck of card_decks which has 81 cards
var card_deck = [];

const cardWidth = 250;
const cardHeight = 100;
let chosed_Card = [];

var number = [1, 2, 3];
var shading = ['solid', 'striped', 'outlined shape'];
var color = ['red', 'purple', 'green'];
var shape = ['oval', 'squiggle', 'diamond'];
for (var i = 0; i < number.length; i++) {
    for ( var j = 0; j < shading.length; ++j){
        for (var k = 0; k< color.length; ++k){
            for ( var l = 0; l<shape.length; ++l){
                card_deck.push({ number: number[i], shading: shading[j], color: color[k], shape: shape[l] });
            }
        }
    }
}
// Suffle cards and choose randomly 12 cards
function RandomCard() {
    var r = Math.floor(Math.random() * card_deck.length);
    var temp = card_deck[r];
    // card_deck[r] = null;
    return temp;
}
var card_UI=[
    [RandomCard(),RandomCard(),RandomCard()],
    [RandomCard(),RandomCard(),RandomCard()],
    [RandomCard(),RandomCard(),RandomCard()],
    [RandomCard(),RandomCard(),RandomCard()],
];

// Render
const canvas = document.querySelector('canvas');
const context = canvas.getContext('2d');
let card_Position = [];
let cnt = 0;
function render () {
    requestAnimationFrame(render);                              
    context.clearRect(0,0, canvas.width, canvas.height);
    for ( let i = 0; i< card_UI.length; ++i){                    //render bricks
        for (let j = 0 ; j < card_UI[i].length; ++j){
            const card = card_UI[i][j];        
            const x = j * cardWidth;
            const y = i * cardHeight;
            if (cnt < 12){
                card_Position.push([x,x+cardWidth,y,y+cardHeight]);
            }
            if (card){
                context.fillRect(x+5, y+5, cardWidth - 2 ,cardHeight -2 );                 
                context.fillStyle = "#f79011"; 
                
                
                if (card_UI[i][j].shape === 'diamond') {
                    drawDiamond(context, card_UI[i][j].number, card_UI[i][j].color,card_UI[i][j].shading,x+125,y+30);
                }
                else if (card_UI[i][j].shape === 'oval'){
                    drawOval(context, card_UI[i][j].number, card_UI[i][j].color,card_UI[i][j].shading,x+110,y+15);
                }                                     
            }
            
        }
    }
    
    
}
render();

document.getElementById('canvasID').addEventListener('click',function(event){
    mouseX = event.clientX;
    mouseY = event.clientY;
    let checkHit = true;
    let pos = 0;

    // Detect card and Games Logic
    while (checkHit){
        if (mouseX >= card_Position[pos][0] && mouseX <= card_Position[pos][1] && mouseY >= card_Position[pos][2] && mouseY <=card_Position[pos][3] ){ // detect card on click
            let i = 0;
            let j = 0;
            if (pos <=2 ){
                i = 0;
                j = pos;
            } else if (pos>2 && pos<=5) {
                i = 1;
                j = pos-3;
            } else if (pos>5 && pos<= 8){
                i = 2;
                j = pos-6;
            } else if (pos>8 && pos<=11){
                i = 3;
                j = pos-9;
            }
            console.log("card: ",pos,"number: ",card_UI[i][j].number," shading: ",card_UI[i][j].shading," color: ",card_UI[i][j].color," shape: ",card_UI[i][j].shape);
            chosed_Card.push(card_UI[i][j]);
            console.log(chosed_Card.length);
            if (chosed_Card.length == 3){
                //Check pair of card logic
                chosed_Card = [];
            }
            
            checkHit = false;
        } else {
            pos+=1;
        }
    }
       
    

});

function drawDiamond(ctx, number, color, shading, x, y, width=40, height = 40){ // x= 125, y= 30, width = 40
    if(number == 3)
        x -= 50;
    else if(number == 2)
        x -= 25;
    
    for(let i = 0; i<number; i++){
        ctx.save();
        ctx.beginPath();
        ctx.moveTo(x, y);
        ctx.lineTo(x - width / 2, y + height / 2);
        ctx.lineTo(x, y + height);
        ctx.lineTo(x + width / 2, y + height / 2);
        ctx.closePath();
        ctx.strokeStyle = color
        ctx.stroke()
        if(shading == 'solid')
        {
            ctx.fillStyle = color;
            ctx.fill();
            ctx.restore();
        }
        x += 50;
    };
}
function drawOval(ctx, number, color, shading, x, y, width=40, height=70, radius=20){ // x = 140, y = 60, width = 40
    if(number == 3)
        x -= 50
    else if(number == 2)
        x -= 25
        
    for(let i=0; i<number; i++) 
    {
        ctx.beginPath();
        ctx.moveTo(x, y + radius);
        ctx.lineTo(x, y + height - radius);
        ctx.arcTo(x, y + height, x + radius, y + height, radius);
        ctx.lineTo(x + width - radius, y + height);
        ctx.arcTo(x + width, y + height, x + width, y + height-radius, radius);
        ctx.lineTo(x + width, y + radius);
        ctx.arcTo(x + width, y, x + width - radius, y, radius);
        ctx.lineTo(x + radius, y);
        ctx.arcTo(x, y, x, y + radius, radius);

        ctx.strokeStyle = color
        ctx.stroke()

        if(shading == 'solid')
        {
            ctx.fillStyle = color;
            ctx.fill();
            ctx.restore();
  
        }
        x += 50
    }
}