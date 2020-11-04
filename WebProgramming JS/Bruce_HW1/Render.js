export class Render
{
    static CardHolders()
    {
        const figure = document.querySelector("#gameFigure")
        var table = document.createElement('table')
        table.id = 'displayTable'

       

        for(let i=0; i<3; i++)
        {
            const dataROW = document.createElement("tr")
            for(let j=0; j<4; j++)
            {
                const TD = document.createElement("td")

                const canvas = document.createElement('canvas')
                let id = i * 4 + j
                canvas.id = id.toString()
                canvas.className = 'card'

                TD.appendChild(canvas)
                dataROW.appendChild(TD)
            }
            table.appendChild(dataROW)
        }
        figure.appendChild(table)
    }
    static PlayersNames(players)
    {
        let holder = document.querySelector('#playersNames')
        holder.innerHTML = ''

        let label = document.createElement('label')
        label.innerHTML = 'PLAYERS  : '
        holder.appendChild(label)

        players.forEach(player=>{
            const button = document.createElement('button')
            button.innerHTML = player.name + ': ' + player.score
            holder.appendChild(button)
        })
    }
    static NamesInputFields()
    {
        event.preventDefault()
        var number = document.querySelector('#players').value
        var nameHolder = document.querySelector('#playersNames')

        let label = document.createElement('label')
        label.innerHTML = 'PLAYERS  : '

        for(let i=0; i<number; i++)
        {
            var field = document.createElement("input"); 
            field.setAttribute("type", "text"); 
            field.setAttribute("name", "FullName"); 
            field.setAttribute("placeholder", "Player " + (i+1));
            field.className = 'name' 
    
            nameHolder.appendChild(field)
        }
        var setNames =  document.querySelector('#setNames')
        setNames.disabled = true
        setNames.style = 'background-color: grey;'
    }

}