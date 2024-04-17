    const myModal = document.getElementById('myModal');
    const myInput = document.getElementById('myInput');
    
    console.log(myInput);

    myModal.addEventListener('shown.bs.modal', () => {
      myInput.focus();
    });
