export function drawDiamond(ctx, number, color, shading, x=140, y=60, width = 40, height = 40)
{

            if(number == 3)
                x -= 50
            else if(number == 2)
                x -= 25
            
            for(let i = 0; i<number; i++)
            {
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
                x += 50
            }
}