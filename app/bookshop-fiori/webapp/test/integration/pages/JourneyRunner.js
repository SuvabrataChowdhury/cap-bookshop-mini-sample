sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"bookshopfiori/test/integration/pages/BooksList.gen",
	"bookshopfiori/test/integration/pages/BooksObjectPage.gen"
], function (JourneyRunner, BooksListGenerated, BooksObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('bookshopfiori') + '/test/flpSandbox.html#bookshopfiori-tile',
        pages: {
			onTheBooksListGenerated: BooksListGenerated,
			onTheBooksObjectPageGenerated: BooksObjectPageGenerated
        },
        async: true
    });

    return runner;
});

