class QuoteModal {
  String? quote;
  String? author;

  List<QuoteModal> quoteModelList = [];

  QuoteModal({this.quote, this.author});

  factory QuoteModal.fromQuoteList(Map m1) {
    return QuoteModal(quote: m1['quote'], author: m1['author']);
  }

  QuoteModal.toList({required List l1}) {
    for (int i = 0; i < l1.length; i++) {
      quoteModelList.add(QuoteModal.fromQuoteList(l1[i]));
    }
  }
}
