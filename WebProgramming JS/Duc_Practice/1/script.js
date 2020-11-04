var tbl = document.getElementById("tbl-1");
var numRows = tbl.rows.length;
var btn = document.getElementById('button');
var inp = document.getElementById('input');
btn.addEventListener('click', function(){
    for (var i = 1; i < numRows; i++) {
        var ID = tbl.rows[i].id;
        var cells = tbl.rows[i].getElementsByTagName('td');
        newValue = parseFloat(cells[2].innerHTML) + (inp.value/ parseFloat(cells[1].innerHTML)) *100;
        if (newValue>= 100) {
            newValue = 100;
        } ;
        cells[2].innerHTML = newValue + '%';
    }
});