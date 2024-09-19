document.addEventListener("turbo:load", function() {
    const queryInput = document.getElementById("query");
    const searchButton = document.getElementById("search_button");

    function validateSearch() {
        console.log('Input value:', queryInput.value); // Debug: log input value
        if (queryInput.value.trim() === "") {
            searchButton.disabled = true;
        } else {
            searchButton.disabled = false;
        }
    }

    if (queryInput) {
        queryInput.addEventListener("input", validateSearch);
    }

    // Initial validation on page load
    validateSearch();
});
