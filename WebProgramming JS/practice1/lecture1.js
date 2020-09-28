// prints message to DevTools' console
console.log('Hello');

// DATA TYPES
null; // falsy
undefined; // falsy
// boolean values
true;
false; // falsy
// numbers
0; // false
1;
0.1;
// strings
'Hello';
"Hello";
`Hello ${ name }`; // = 'Hello ' + name
// objects
{};
{ key: 'value' };
{ key1: { key2: 'value' }};
// arrays
[];
[1, 2, 3];
[1, 0.2, '3'];

// VARIABLES
var x = 0; // deprecated
const y = 0;
let z = 0; // better var keyword with block scope
// things are not always constant
const student = { name: 'Sandor' };

student = { name: 'Alex' }; // illegal
student.name = 'Alex'; // works

// OPERATORS
// equality comparison
y == 0; // true
y == '0'; // true
// === does not do type coercion
y === 0; // true
y === '0'; // false

// ternary operator
// let a;

// if (condition) {
//     a = 1;
// }
// else {
//     a = 2;
// }
const a = condition ? 1 : 2;

// logical or
const b = 0;
const c = b || 'c'; // c gets wrong value, because b is falsy
const c = b ?? 'c';

// unary +
// can only handle strings which look like numbers,
// so for example no trailing characters like unit
const d = '0.1';
const dAsANumber = +d;
const e = '0.1m'
const eAsANumber = +d; // will be NaN (not a number)

NaN === NaN; // false

// STRUCTURAL ELEMENTS
// if-else
if (condition) {
    // then
}
else {
    // otherwise
}

// switch
switch (value) {
    case value1:
        // ...
        break;

    case value2:
        // ...

    default:
        // somthing else than value1 or value2
}

// while loops
while (preCondition) {
    // ...
}

do {
    // ...
}
while (postCondition);

// for loops
const fruits = ['apple', 'orange'];

for (let i = 0; i < 5; ++i) {
    const fruit = fruits[i];
}

for (const fruit of fruits) {
    // ...
}

// FUNCTIONS
// if no return statement was given, it returns undefined
function f(x) {
    return x * x;
}

const g = function (x) { return x * x };

const h = x => x * x;
// const h = x => { return x * x; }
// const h = (x, y) => x * y;

// functions are values

f(1);

function doWork(x, done) {
    const y = x * x;

    done(y);
}

doWork(1, y => { console.log(y); });

console.log('Hmmm');

button.addEventListener('click', function (event) {
    console.log(event.x);
});
