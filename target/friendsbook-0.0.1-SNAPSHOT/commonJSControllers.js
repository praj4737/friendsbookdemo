function convertFormToJSON(form) {
    const array = $(form).serializeArray();
    const json = {};
    $.each(array, function() {
        json[this.name] = this.value || ""; // Assign field name as key and value as value
    });
    console.log(json);
    return json;
}
function isFormField(form){
    const array = $(form).serializeArray();
    var isValid=true;
    $.each(array, function() {
            if(!this.value.trim().length >0){
                isValid=false;

            }
        });
        return isValid;
}