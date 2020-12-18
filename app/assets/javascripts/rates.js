$(document).on('turbolinks:load', function() {
  let startsContainer = document.getElementById("stars")
  if (startsContainer) {
    let stars = startsContainer.children
    let target_value = document.getElementById("target_value")
    let index;
    for(let i=0; i < stars.length; i++) {
    
    stars[i].addEventListener('mouseover', () => {
      
      for(let j=0; j < stars.length; j++) {
        stars[j].classList.remove("rate-good")
        stars[j].classList.add("rate-bad")
      }
      // クリックした箇所まで
      for(let j=0; j<=i; j++){
        
        stars[j].classList.remove("rate-bad");
        // カーソルが乗った星まで星を塗りつぶす
        stars[j].classList.add("rate-good");
      }
    })
    //  クリックされたら値を
    stars[i].addEventListener('click', () => {
      target_value.value = i + 1
      index = i;
    })
  
  stars[i].addEventListener('mouseout', () => {
     
      for(let j=0; j < stars.length; j++) {
        stars[j].classList.remove("rate-good")
        stars[j].classList.add("rate-bad")
      }
      // クリックした箇所まで
      for(let j=0; j<=index; j++){
        stars[j].classList.remove("rate-bad");
        // カーソルが乗った星まで星を塗りつぶす
        stars[j].classList.add("rate-good");
      }
    })
   }
  }
});