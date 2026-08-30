namespace my.bookshop;

using {Currency, sap, managed, cuid} from '@sap/cds/common';

entity Books : cuid, managed {
    title    : localized String(111);
    descr    : localized String(1111);
    author   : Association to Authors;
    genre    : Association to Genres;
    stock    : Integer;
    price    : Decimal(9, 2);
    currency : Currency;
    rating   : Decimal(2, 1);
    isbn     : String(40);
}

entity Authors : cuid, managed {
    name  : String(111);
    books : Association to many Books on books.author = $self;
}

entity Genres : sap.common.CodeList {
    key ID       : UUID;
        parent   : Association to Genres;
        children : Composition of many Genres on children.parent = $self;
}

