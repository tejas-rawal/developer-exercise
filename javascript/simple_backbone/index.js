// Initialize collection
var collection = new app.QuoteList();

$(document).ready(function() {
  updateCollection(showQuotes);
});

function showQuotes(collection, response) {
  var quoteListView = new app.QuoteListView({
    collection: response
  });

  quoteListView.render();
}

function updateCollection(successCallback) {
  collection.fetch({
    success: successCallback,
    error: function(collection, response, options) {
      alert('Error while retrieving data.');
      console.log(response.statusText);
    }
  });
}
