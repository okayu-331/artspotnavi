document.addEventListener('turbolinks:load', function() {
  const path = location.pathname;
  const editRegex = /^\/exhibitions\/\d+\/edit$/
  const updateRegex = /^\/exhibitions\/\d+$/

  if(path === "/exhibitions/new" || path === "/exhibitions" || editRegex.test(path) || updateRegex.test(path)) {
    
    const PreviewArea = document.getElementById('preview-area');
    const imageFileField = document.getElementById("exhibition_image_0");
    const imgFormGroup = document.getElementById('img-form-group');

    const createImageHTML = (blob) => {

      const imageElement = document.createElement('div')
      imageElement.setAttribute('class', "image-element")
      let imageElementNum = document.querySelectorAll('.image-element').length

      const blobImage = document.createElement('img')
      blobImage.setAttribute('src', blob)

      const inputFileHTML = document.createElement('input')
      inputFileHTML.setAttribute('id', `exhibition_image_${imageElementNum + 1}`)
      inputFileHTML.setAttribute('name', 'exhibition_event[images][]')
      inputFileHTML.setAttribute('type', 'file')

      const inputLABEL = document.createElement('label')
      inputLABEL.setAttribute('for', `exhibition_image_${imageElementNum + 1}`)
      inputLABEL.classList.add('input-label-image')

      const removeButton = document.createElement('div')
      removeButton.classList.add('preview-remove-btn')

      imageElement.appendChild(blobImage)
      imageElement.appendChild(removeButton)
      imgFormGroup.appendChild(inputLABEL)
      inputLABEL.appendChild(inputFileHTML)
      PreviewArea.appendChild(imageElement)

      inputLABEL.previousElementSibling.classList.add('hide-label')

      removeButton.addEventListener('click', function(e){
        removeButton.dataset.index = imageElementNum
        const index = e.target.dataset.index
        const removeIndex = document.getElementById(`exhibition_image_${index}`)
        e.target.parentNode.remove()
        removeIndex.remove()
      });

      inputFileHTML.addEventListener('change', (event) => {
        file = event.target.files[0];
        blob = window.URL.createObjectURL(file);

        createImageHTML(blob)
      })
    };

    imageFileField.addEventListener("change", event => {
      const file = event.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });

  }

});