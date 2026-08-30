# Bookshop - CAP Java Backend

A minimal CAP Java bookshop backend for UI5/Fiori training. Exposes a simple Books OData service with Authors and Genres as value helps.

## Project Structure

```
cloud-cap-samples-java/
├── db/
│   ├── books.cds          # Domain model: Books, Authors, Genres
│   └── data/              # Sample CSV data
└── srv/
    ├── admin-service.cds  # BooksService - full CRUD at /api/admin
    └── cat-service.cds    # CatalogService - read-only at /api/browse
```

## Services

| Service | Path | Description |
|---------|------|-------------|
| `BooksService` | `/api/admin` | Full CRUD + draft for Books, read-only Authors & Genres |
| `CatalogService` | `/api/browse` | Read-only Books and Authors |

## Running Locally

After any changes to `.cds` files, rebuild first to regenerate the OData model:

```bash
mvn clean package -DskipTests
mvn spring-boot:run
```

The server starts at `http://localhost:8080`.

### OData Endpoints

- Books: `http://localhost:8080/api/admin/Books`
- Authors: `http://localhost:8080/api/admin/Authors`
- Genres: `http://localhost:8080/api/admin/Genres`

### H2 Database Console

Available at `http://localhost:8080/h2-console` while the app is running.

- **JDBC URL**: `jdbc:h2:mem:bookshop`
- **User Name**: `sa`
- **Password**: *(leave empty)*

## Fiori Generator

To generate a Fiori Elements app against this backend:

1. Run `npx fiori generate` (or use the SAP Fiori tools VS Code extension)
2. Select **List Report Page** template
3. Point to `http://localhost:8080/api/admin`
4. Select `BooksService` → `Books` entity
5. The annotations in `app/admin/fiori-service.cds` will be picked up automatically
