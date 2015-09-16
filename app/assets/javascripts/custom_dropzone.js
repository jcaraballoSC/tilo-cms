$(document).ready(function() {
/**/
Dropzone.options.myAwesomeDropzone = { // The camelized version of the ID of the form element

    // The configuration we've talked about above
    autoProcessQueue: false,
    uploadMultiple: true,
    parallelUploads: 100,
    maxFiles: 100,
    uploadMultiple: true,
    addRemoveLinks: true,
    url: urls,
    dictRemoveFile: ' <span class="btn btn-danger drop">Eliminar</span>',
    previewsContainer: ".dropzone-previews",

    // The setting up of the dropzone
    init: function() {

        var submitButton = document.querySelector("#btn-submit");

        

        var myDropzone = this;

        // First change the button to actually tell Dropzone to process the queue.
        submitButton.addEventListener("click", function(e) {
            // Make sure that the form isn't actually being sent.
            e.preventDefault();
            e.stopPropagation();
            myDropzone.processQueue();
        });

          myDropzone.on("sending", function(file, xhr, formData) {
                    //formData.append("name", "value");
                    formData.append("start_publish", $("#start_publish").val());
                    formData.append("end_publish", $("#end_publish").val());
                     // Append all the additional input data of your form here!
                  });

        // Listen to the sendingmultiple event. In this case, it's the sendingmultiple event instead
        // of the sending event because uploadMultiple is set to true.
        this.on("sendingmultiple", function(file, xhr, formData) {
            // Gets triggered when the form is actually being sent.
            // Hide the success button or the complete form.
        });
        this.on("successmultiple", function(files, response) {
            // Gets triggered when the files have successfully been sent.
            // Redirect user or notify of success.
        });
        this.on("errormultiple", function(files, response) {
            // Gets triggered when there was an error sending the files.
            // Maybe show form again, and notify user of error
        });
    }

}
/**/
});
