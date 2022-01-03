window.addEventListener('load', () =>  {

const formItemInput = document.getElementById("sales-cost");
    const costInput = document.getElementById("cost-cost");
    const profitOutput = document.getElementById("cost-profit")
    const priceOutput = document.getElementById("cost-tax");
    costInput.addEventListener("input", () => {
      const profitOutputValue = profitOutput.value;
      const profitValue = Math.floor(formItemInput.value - costInput.value);
      profitOutput.value = profitValue;
      const value_result = formItemInput.value;
      const profitNumber = (Math.floor(profitValue / value_result * 100));
      priceOutput.value = profitNumber;
    })
  });
