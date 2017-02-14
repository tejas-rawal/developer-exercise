function showQuotes(collection, response) {
  collection.set(response);

  var quoteListView = new app.QuoteListView({
    collection: collection
  });

  quoteListView.render();
}

function loadError(request, status, error) {
  alert("Error Loading JSON: " + status + " - " + error);
}

// Collection initialize options
var fetchOptions = {
  success: showQuotes,
  error: loadError
};

// Initialize collection with options
new app.QuoteList(fetchOptions);
