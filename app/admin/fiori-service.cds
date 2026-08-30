/*
  Fiori annotations for the Books List Report + Object Page
  Consumed by the Fiori Elements generator and the SAP Fiori launchpad.
*/

using BooksService from '../../srv/admin-service';

////////////////////////////////////////////////////////////////////////////
//
//  Books – List Report
//
annotate BooksService.Books with @(UI: {
    SelectionFields: [
        author_ID,
        genre_ID,
        price
    ],
    LineItem       : [
        {Value: title,       Label: 'Title'},
        {Value: author.name, Label: 'Author'},
        {Value: genre.name,  Label: 'Genre'},
        {Value: stock,       Label: 'Stock'},
        {Value: price,       Label: 'Price'},
        {Value: currency_code, Label: 'Currency'},
        {Value: rating,      Label: 'Rating'}
    ]
});

////////////////////////////////////////////////////////////////////////////
//
//  Books – Object Page
//
annotate BooksService.Books with @(UI: {
    HeaderInfo  : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Book',
        TypeNamePlural: 'Books',
        Title         : {Value: title},
        Description   : {Value: author.name}
    },
    Facets      : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'General',
            Target: '@UI.FieldGroup#General'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Details',
            Target: '@UI.FieldGroup#Details'
        }
    ],
    FieldGroup #General: {Data: [
        {Value: title},
        {Value: descr},
        {Value: author_ID,  Label: 'Author'},
        {Value: genre_ID,   Label: 'Genre'}
    ]},
    FieldGroup #Details: {Data: [
        {Value: stock},
        {Value: price},
        {Value: currency_code, Label: 'Currency'},
        {Value: rating},
        {Value: isbn, Label: 'ISBN'}
    ]}
});

////////////////////////////////////////////////////////////////////////////
//
//  Value Help: Author
//
annotate BooksService.Books with {
    author @(Common: {
        Text           : author.name,
        TextArrangement: #TextOnly,
        ValueList      : {
            CollectionPath: 'Authors',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: author_ID,
                    ValueListProperty: 'ID'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'name'
                }
            ]
        }
    });
    genre  @(Common: {
        Text           : genre.name,
        TextArrangement: #TextOnly,
        ValueList      : {
            CollectionPath: 'Genres',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: genre_ID,
                    ValueListProperty: 'ID'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'name'
                }
            ]
        }
    });
}
