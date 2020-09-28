const taskInput = document.querySelector("#input-task");
const AddBtn = document.querySelector("#add-task");
const tasks = document.querySelector("#tasks");

const taskArray = [];

AddBtn.addEventListener('click',function(events){
    events.preventDefault();
    const task = taskInput.value.split(',');
    for (const t of task){        
        if (t && !taskArray.includes(t)){        
            // const node = document.createElement("li");
            // node.innerHTML = `<li style="list-style: none;">${t}</li>`;
            taskArray.push(t);
            tasks.innerHTML+=`<li style="list-style: none;">${t}</li>`;            
        }                
    }
    taskInput.value='';
});


