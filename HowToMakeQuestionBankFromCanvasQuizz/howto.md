1.Run below code in web console (F12->console) on quiz result page. If you can't paste then type allow pasting for firefox

2.Output is copied to clipboard automatically. If not then copy it from your console.

3.Paste as comment below
```
var i;
var markdown;
var elem = document.getElementsByClassName('quiz_sortable question_holder');
var tf;

function emoji(isAnswerSelected, wrongOrRight){
  if(isAnswerSelected){
    if(wrongOrRight == false) return ':heavy_check_mark:';
    if(wrongOrRight == true) return ':x:';
  }

  return '';
}

for(i=0;i<30;i++){
  tf = elem[i].children[2].classList.contains('incorrect');
  currentElem = elem[i].children[2].children[4];
  selected = 

  // Question
  markdown += '\r\n### **' + currentElem.children[1].innerText.trim() + '** \r\n';

  // Answer 1-4
  answers = currentElem.children[2].children[0].children;
  markdown += '\r\n' + emoji(answers[0].classList.contains('selected_answer'), tf) + answers[0].innerText.trim() + '\r\n';
  markdown += '\r\n' + emoji(answers[2].classList.contains('selected_answer'), tf) + answers[2].innerText.trim() + '\r\n';
  markdown += '\r\n' + emoji(answers[4].classList.contains('selected_answer'), tf) + answers[4].innerText.trim() + '\r\n';
  markdown += '\r\n' + emoji(answers[6].classList.contains('selected_answer'), tf) + answers[6].innerText.trim() + '\r\n';
}
console.log(markdown);
copy(markdown);
```