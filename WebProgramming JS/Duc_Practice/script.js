const input = document.querySelector("#numbers");
const solve = document.querySelector("#solve");
// task 1
function calSum(numbStr){
    var c;
    var s = 0;
    for (i =0; i<numbStr.length;i++) {
        if ((numbStr[i]==0)||(numbStr[i]==6)||(numbStr[i]==9)){
            s+=1;
        } else if (numbStr[i]==9){
            s+=2;
        };
    };
    return s;
}

solve.addEventListener('click', function (){
    console.log(calSum(input.value));
});

// task 2
const task2 = document.querySelector("#task2");
const teachers = [
    {
      name: "Gergő Márton ",
      hunLessons: 1,
      engLessons: 1,
    },
    {
      name: "Tamás Győztes ",
      hunLessons: 0,
      engLessons: 2,
    },
    {
      name: "Sándor Rendes",
      hunLessons: 5,
      engLessons: 0,
    },
    {
      name: "Vikthor Visno ",
      hunLessons: 3,
      engLessons: 0,
    },
    {
      name: "Erik Horgász",
      hunLessons: 2,
      engLessons: 1,
    },
  ];
function displayTeacher(){
    for (var i=0; i<teachers.length; i++){
        task2.innerHTML+=` ${ teachers[i].name} `;
    }
}
const displayBtn = document.querySelector("#display");
displayBtn.addEventListener('click', displayTeacher);

  let OisNext = true;
 
function theTicTac(event)
{
    if(event.target.innerHTML =="")
    {
        if(OisNext == true)
        {
            event.target.innerHTML = "O"
            OisNext = false
        }
        else
        {
            event.target.innerHTML ="X"
            OisNext = true;
        }
    }
}
 
const TICTAC = document.querySelectorAll(".cell")
 
TICTAC.forEach( cell => cell.addEventListener("click", theTicTac) );
