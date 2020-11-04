import { drawDiamond } from './Shapes/diamond.js'
import { drawOval } from './Shapes/oval.js'
import { drawSquiggle } from './Shapes/squiggle.js'

export class Card
{
    constructor(SHAPE, COLOR, NUMBER, SHADING='striped')
    {
        this.COLOR = COLOR
        this.NUMBER = NUMBER
        this.SHADING = SHADING
        this.SHAPE = SHAPE
    }

    display(ctx)
    {
        switch(this.SHAPE)
        {
            case 'diamond' : drawDiamond(ctx, this.NUMBER, this.COLOR, this.SHADING); break;
            case 'oval' : drawOval(ctx, this.NUMBER, this.COLOR, this.SHADING); break;
            case 'squiggle' : this.NUMBER >= '2' ? 
                                drawDiamond(ctx, this.NUMBER, this.COLOR, this.SHADING) : 
                                drawOval(ctx, this.NUMBER, this.COLOR, this.SHADING);
            
            //drawSquiggle(ctx, this.NUMBER, this.COLOR, this.SHADING);
             break;
             default: throw new Error("INVALID CARD")
        }
    }
}