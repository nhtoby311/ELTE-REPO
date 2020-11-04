export function drawOval(ctx, number, color, shading, x=140, y=60, width=40, height=40, radius=20) 
{
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
