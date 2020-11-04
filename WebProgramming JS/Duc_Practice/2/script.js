//taskList.innerHTML += `<li data-index="${ tasksArray.length - 1 }"><input type="checkbox">${ task } <button type="button">x</button></li>`;
// var li = document.getElementsByClassName('shipment');
// for (let i = 0; i < li.length; i++) {
//         li[i].addEventListener("click", function() {
//         console.log(li.children[i]);
//         });
    
// }

// var div = document.querySelectorAll("#data li.shipment div");
// console.log(div[0]);
// console.log(div[2]);
// console.log(div[3]);
// console.log(div[5]);
// console.log(div[6]);
// console.log(div[8]);

document.addEventListener('click', function (event){
    
    if (event.target.matches('div') && event.target.innerHTML.includes("Arrival")){
        if (event.target.parentElement.classList.contains('arrival')){
            event.target.parentElement.classList.remove('arrival');
        } else {
            event.target.parentElement.classList.add('arrival');
        }
    } else if (event.target.matches('li')){
        if (event.target.classList.contains('product')){
            event.target.classList.remove('product');
        } else {
            event.target.classList.add('product');
        }
    } else if (event.target.matches('div') && event.target.innerHTML.includes("Shelf")) {
        if (event.target.parentElement.classList.contains('shelf')){
            event.target.parentElement.classList.remove('shelf'); 
        } else {
            event.target.parentElement.classList.add('shelf');        
        }
    }
})