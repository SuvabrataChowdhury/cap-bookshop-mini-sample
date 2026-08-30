/*
  Common Annotations shared by all apps
*/
using {my.bookshop as my} from '../db/index';
using {sap.common as common} from '@sap/cds/common';


////////////////////////////////////////////////////////////////////////////
//
//  Books Elements
//
annotate my.Books with {
    ID
    @title : '{i18n>ID}'
    @UI.HiddenFilter;
    title
    @title : '{i18n>Title}';
    genre
    @title : '{i18n>Genre}'
    @Common : {
        Text           : genre.name,
        TextArrangement: #TextOnly
    };
    author
    @title : '{i18n>Author}'
    @Common : {
        Text           : author.name,
        TextArrangement: #TextOnly
    };
    price
    @title : '{i18n>Price}';
    stock
    @title : '{i18n>Stock}';
    descr
    @title : '{i18n>Description}'
    @UI.MultiLineText;
    rating
    @title : '{i18n>Rating}';
}


////////////////////////////////////////////////////////////////////////////
//
//  Authors Elements
//
annotate my.Authors with {
    ID
    @title : '{i18n>ID}'
    @UI.HiddenFilter;
    name
    @title : '{i18n>Name}';
}


////////////////////////////////////////////////////////////////////////////
//
//  Genres Elements
//
annotate my.Genres with {
    name
    @title : '{i18n>Genre}';
}


////////////////////////////////////////////////////////////////////////////
//
//  Fiori requires generated IDs to be annotated with @Core.Computed
//
using {cuid} from '@sap/cds/common';

annotate cuid with {
    ID
    @Core.Computed
}
