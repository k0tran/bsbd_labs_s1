CREATE TABLE vendor (
    id INTEGER PRIMARY KEY,
    name TEXT,
    office TEXT,
    rating INTEGER
);

CREATE TABLE category (
    id INTEGER PRIMARY KEY,
    name TEXT
);

CREATE TABLE product_type (
    code INTEGER PRIMARY KEY,
    vendor INTEGER,
    category INTEGER,
    raise INTEGER,
    FOREIGN KEY(vendor) REFERENCES vendor(id),
    FOREIGN KEY(category) REFERENCES category(id)
);

CREATE TABLE country (
    id INTEGER PRIMARY KEY,
    name TEXT
);

CREATE TABLE product (
    id INTEGER PRIMARY KEY,
    type INTEGER,
    country INTEGER,
    price INTEGER,
    supply INTEGER,
    sold BOOLEAN,
    sale INTEGER,
    FOREIGN KEY(type) REFERENCES product_type(code),
    FOREIGN KEY(country) REFERENCES country(id),
    FOREIGN KEY(supply) REFERENCES supply(id),
    FOREIGN KEY(sale) REFERENCES sale(id)
);

CREATE TABLE supply (
    id INTEGER PRIMARY KEY,
    date DATE,
    done BOOLEAN,
    employee INTEGER,
    price INTEGER,
    FOREIGN KEY(employee) REFERENCES employee(id)
);

CREATE TABLE employee (
    id INTEGER PRIMARY KEY,
    job INTEGER,
    name TEXT,
    active BOOLEAN,
    exp_date TIMESTAMP,
    FOREIGN KEY(job) REFERENCES job(id)
);

CREATE TABLE job (
    id INTEGER PRIMARY KEY,
    name TEXT,
    salary INTEGER,
    days_per_week INTEGER
);

CREATE TABLE sale (
    id INTEGER PRIMARY KEY,
    date TIMESTAMP,
    employee INTEGER,
   customer INTEGER,
    bonus INTEGER,
    bonus_used INTEGER,
    FOREIGN KEY(employee) REFERENCES employee(id),
    FOREIGN KEY(customer) REFERENCES customer(id)
);

CREATE TABLE customer (
    id INTEGER PRIMARY KEY,
    phone INTEGER,
    name TEXT,
    reg_date TIMESTAMP
);
