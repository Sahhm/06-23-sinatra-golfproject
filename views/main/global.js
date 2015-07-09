var burgerbutton = document.getElementById("burgerbutton");
var d = document.getElementById("hamburger")




function showHide(){
  if (d.className != "hamburger") {
    d.className = "hamburger"
  } else if (d.className != "hamburger hide") {
    d.className = "hamburger hide";
  }
}





burgerbutton.addEventListener("click", showHide);



