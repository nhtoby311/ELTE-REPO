const taskInput = document.body.querySelector('#task-input');
const taskList = document.body.querySelector('#tasks'); //ul
const removeAllButton = document.body.querySelector('#remove-all-button');

const removeDoneButton = document.body.querySelector('#remove-done');
const toggleSelected = document.body.querySelector('#toggle-selected');

const tasksArray = [];

taskInput.parentElement.addEventListener('submit', function (event) {
    event.preventDefault();

    const tasks = taskInput.value.split(',');

    for (const task of tasks) {
        if (task && !tasksArray.includes(task)) {
            tasksArray.push(task);
            taskList.innerHTML += `<li data-index="${ tasksArray.length - 1 }"><input id="checkbox" type="checkbox" name="checkbox" style="float: left;">${ task } <button type="button">x</button></li>`;
            taskInput.value = '';
        }
    }
});

// removeDoneButton.addEventListener('click', function (){
//     var rmvCheckBoxes = document.getElementsByName('checkbox');

//     for(var i = 0; i < rmvCheckBoxes.length; i++)
//     {
//         if(rmvCheckBoxes[i].checked)
//         {
//             removeElm(rmvCheckBoxes[i]); 
//             taskList.removeChild(taskList.childNodes[i]);
//         }
//     } 
// });

removeDoneButton.addEventListener('click',function(){
    var items = document.querySelectorAll("#tasks li");
    for(var i = 0; i < items.length; i++){
        //check if the element contains class 'done'
        if (items[i].classList.contains("done")){
            items[i].innerHTML='';
        }
    }
});

toggleSelected.addEventListener('click', function (){
    var toggleCheckBoxes = document.getElementsByName('checkbox');
    var items = document.querySelectorAll("#tasks li");
    for(var i = 0; i < toggleCheckBoxes.length; i++)
    {
        if(toggleCheckBoxes[i].checked)
        {
            if  (items[i].classList.contains("done")){
                items[i].classList.toggle("done", false);
            } else {
                items[i].classList.toggle('done',true); 
            }; 
            
        }
    } 
});

removeAllButton.addEventListener('click', function () {
    taskList.innerHTML = '';
    tasksArray.length = 0;
});

taskList.addEventListener('click', function (event) {
    // or event.target.matches('li')
    if (event.target.tagName === 'LI') {
        event.target.classList.toggle('done');
    }
    else if (event.target.matches('button')) {
        const index = [].indexOf.call(taskList.children, event.target.parentElement);
        // you need to reindex the array to make this work
        // tasksArray.splice(+event.target.parentElement.dataset.index, 1);
        tasksArray.splice(index, 1);
        taskList.removeChild(event.target.parentElement);
    }
});
