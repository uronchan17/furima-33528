function post (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const tax = itemPrice.value * 0.1;
    const salesCommission = document.getElementById("add-tax-price");
    const salesProfit = document.getElementById("profit") ;
    salesCommission.innerHTML = tax;
    salesProfit.innerHTML = itemPrice.value - tax;
  });
}

window.addEventListener('load', post);