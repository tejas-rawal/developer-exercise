'use strict';

var app = app || {};

// Model
app.Quote = Backbone.Model.extend({
	defaults: {
		source: '',
		context: '',
		quote: '',
		theme: ''
	}
});

// Collection
app.QuoteList = Backbone.Collection.extend({
	model: app.Quote,
	url: 'https://gist.githubusercontent.com/anonymous/8f61a8733ed7fa41c4ea/raw/1e90fd2741bb6310582e3822f59927eb535f6c73/quotes.json'
});

//  Single quote object view
app.QuoteItemView = Backbone.View.extend({
	tagName: 'tr',
	template: _.template($('#item-template').html()),

	render: function() {
		$(this.el).html(this.template(this.model));
		return this;
	}
});

// List of quotes
app.QuoteListView = Backbone.View.extend({
	el: '#quotes-list',
	tagName: 'tbody',

	render: function() {
		this.$el.empty();

		_.each(this.collection, function(quoteObject){
			this.renderItem(quoteObject);
		}, this);
	},

	renderItem: function(item) {
		var quoteView = new app.QuoteItemView({model: item});
		this.$el.append(quoteView.render().el);
	}
});
