using {my.bookshop as my} from '../db/index';

@path: 'bookshop'
service BookshopService @(requires: 'any') {

  @odata.draft.enabled
  entity Books   as projection on my.Books;

  @readonly
  entity Authors as projection on my.Authors;

  @readonly
  entity Genres  as projection on my.Genres excluding {children};
}
