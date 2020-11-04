import { Card } from './card.js'

/**
 * Deck of cards
 */
export class DECK
{
    /**
     * 
     * @param {difficulty} difficulty 
     * Makes a deck of cards based on the difficulty
     */
    constructor(difficulty='hard')
    {
        this.difficulty = difficulty
        this.CARDS = []


        let SHAPES = ['squiggle', 'oval', 'diamond']
        let COLOR = ['red', 'green', 'purple']
        let NUMBER  = [1, 2, 3]
        let SHADING = ['solid', 'striped', 'outlined']
        
        SHAPES.forEach(shape=>
            {
                COLOR.forEach(color=>{
                    NUMBER.forEach(number=>{
                        if(difficulty === 'HARD')
                        {
                            SHADING.forEach(shade=>
                                {
                                    var newCard = new Card(shape, color, number, shade)
                                    this.CARDS.push(newCard)
                                })
                        }
                        else
                        {
                            var newCard = new Card(shape, color, number)
                            this.CARDS.push(newCard)
                        }
                    })
                })
            })
    }
    shuffle() 
    {
        var currentIndex = this.CARDS.length, temporaryValue, randomIndex;
      
        while (0 !== currentIndex) 
        {
      
          randomIndex = Math.floor(Math.random() * currentIndex);
          currentIndex -= 1;
      
          temporaryValue = this.CARDS[currentIndex];
          this.CARDS[currentIndex] = this.CARDS[randomIndex];
          this.CARDS[randomIndex] = temporaryValue;
        }
      
      }
      getCards(number)
      {
          return this.CARDS.splice(0, number)
      }
      getCARDS()
      {
          return this.CARDS
      }
}