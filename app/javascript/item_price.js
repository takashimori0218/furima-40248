document.addEventListener('turbo:load', () => {
  // Payjpの初期化
  const payjp = Payjp('pk_test_818593cfbeeb2e553a575e61');
  const elements = payjp.elements();

  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  const priceInput = document.getElementById("item-price");
  if (priceInput) {
    priceInput.addEventListener("input", () => {
      const inputValue = parseFloat(priceInput.value) || 0;

      const addTaxDom = document.getElementById("add-tax-price");
      const taxValue = Math.floor(inputValue * 0.1);
      addTaxDom.innerHTML = taxValue;

      const addProfitDom = document.getElementById("profit");
      addProfitDom.innerHTML = Math.floor(inputValue - taxValue);
    });
  }

  const pay = () => {
    const form = document.getElementById('charge-form');
    form.addEventListener('submit', (event) => {
      event.preventDefault();

      payjp.createToken(numberElement).then(function (response) {
        if (response.error) {
          console.error(response.error);
        } else {
          const token = response.id;
          console.log(token);

          const renderDom = document.getElementById("charge-form");
          const tokenObj = `<input value="${token}" type="hidden" name="token">`;
          renderDom.insertAdjacentHTML("beforeend", tokenObj);
          debugger;

          numberElement.clear();
          expiryElement.clear();
          cvcElement.clear();

          form.submit();
        }
      });
    });
  };

  pay();
});
