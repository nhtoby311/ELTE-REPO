// 1. react to the button click
// 2. read name from the text input
// 3. generate output from input
// 4. display output

// 1.
const button = document.body.querySelector('#greet-button');

const redSquare = document.querySelector('#red-square');

// redSquare.style.position = 'absolute';
// redSquare.style.left = '100px';
// redSquare.style.top = '150px';

button.addEventListener('click', function (event) {
    // console.log(button.parentElement); vs. parentNode
    // console.log(button.parentElement.children); vs. childNodes
    const name = button.previousElementSibling.value;
    const output = generateGreetingText(name);

    console.log(output);

    // old, but more performant way
    // const outputElement = document.createElement('h1');
    // const outputTextNode = document.createTextNode(output);
    // outputElement.appendChild(outputTextNode);
    // document.body.appendChild(outputElement);

    // document.body.innerHTML += `<h1>${ output }</h1>`;

    redSquare.classList.toggle('moved');
});

// 3.
function generateGreetingText(name) {
    return `Hello ${ name || 'World' }!`;
}

const label = document.querySelector('label');

label.style.color = 'blue';
