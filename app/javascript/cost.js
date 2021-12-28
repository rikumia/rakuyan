window.addEventListener('load', function(){

  const formItemInput = document.getElementById("sales-cost");
  formItemInput.addEventListener("input", () => {
    const costInput = document.getElementById("cost-cost");
    costInput.addEventListener("input", () => {
      const inputValue = Math.floor(formItemInput.value - costInput.value);
      const costTaxDom = document.getElementById("cost-tax");
      costTaxDom.innerHTML = Math.floor(inputValue * 0.1);
      const profitNumber = document.getElementById("cost-profit")
      const value_result = inputValue * 0.1
      profitNumber.innerHTML = (Math.floor(inputValue - value_result));
    })
  })
});
