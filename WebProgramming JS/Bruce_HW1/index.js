import { DECK } from './Model/deck.js';
import { Card } from './Model/card.js';
import { displayCards } from './functions.js'
import { isSet, Evaluate, createPlayers , getDifficultyLevel} from './functions.js'
import { Render } from './Views/Render.js'
import { delegate } from './Views/delegate.js';
import{ Player } from './Model/Player.js'

var startGame = document.querySelector('#startGame')
startGame.addEventListener('click', playGame)

var restartGame = document.querySelector('#reset')
restartGame.addEventListener('click', resetGame)

var namesFilled = false
var setNames =  document.querySelector('#setNames')
setNames.addEventListener('click', ()=>{
  namesFilled = true
  Render.NamesInputFields()
})

function playGame()
{
  event.preventDefault()

  disablePlayButton()
 
  Render.CardHolders()

  var level = getDifficultyLevel()
  var deck = new DECK(level)
  deck.shuffle()

  var cards = deck.getCards(12)
  displayCards(cards)

  var noOfPlayers = document.querySelector('#players').value
  var players = createPlayers(noOfPlayers, namesFilled)
  Render.PlayersNames(players)

  var results = 0
  var displayTable = document.querySelector('#displayTable')
  var eventHandler = function()
  {
      var found = false
      found = Evaluate(deck, cards)
  }


  delegate(displayTable, '.card', 'click', eventHandler)


}

function resetGame()
{
    startGame.disabled = false
    startGame.style = 'background-color: #4CAF50;'
    restartGame.style = 'background-color: grey;'
    document.querySelector('#playersNames').innerHTML = ''
    document.querySelector('#gameFigure').innerHTML=''
    var setNames =  document.querySelector('#setNames')
    setNames.disabled = false
    setNames.style = 'background-color: #4CAF50;'
    namesFilled = false
}
function disablePlayButton()
{
  startGame.disabled = true
  startGame.style = 'background-color: grey;'
  restartGame.style = 'background-color: #4CAF50;'
}