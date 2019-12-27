create table restaurant (
    id identity primary key not null,
    city varchar (50) not null,
    state varchar (50) not null,
    phone_number varchar (50) not null,
    street_name varchar (50) not null,
    number varchar (50) not null,
    name varchar (50) not null,
);

create table employee (
    id identity primary key not null,
    first_name varchar (50) not null,
    last_name varchar (50) not null,
    
);

create table menu_item (
    id identity primary key not null,
    item_name varchar (50) not null,
    price double,
    category varchar (50) not null,
);

create table menu (
    id identity primary key not null,
    menu_type varchar (50),
);

Create table customer (
    id identity primary key not null,
    First_Name Varchar (50)not null,
    Last_Name Varchar (50)not null,
);

Create table payment_option (
    id identity primary key not null,   
    payment_type varchar (50),
    card_number varchar (16),
    issuer varchar (50),
    name_on_card varchar (50),
    customer_id int,
    foreign key (customer_id) references customer (id)
);

create table orders (
    id identity primary key not null,
    order_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
);

create table menu_item_orders (
    id identity primary key not null,
    price double,
    menu_item_id int not null,
    orders_id int not null,
    foreign key (menu_item_id) references menu_item (id),
    foreign key (orders_id) references orders (id),
);

create table menu_restaurant (
    id identity primary key not null,
    menu_id int not null,
    restaurant_id int not null,
    foreign key (menu_id) references menu (id),
    foreign key (restaurant_id) references restaurant (id),
);

create table customer_restaurant (
    id identity primary key not null,
    customer_id int not null,
    restaurant_id int not null,
    foreign key (customer_id) references customer (id),
    foreign key (restaurant_id) references restaurant (id),
);

create table employee_restaurant(
    id identity primary key not null,
    employee_id int not null,
    restaurant_id int not null,
    foreign key (employee_id) references employee (id),
    foreign key (restaurant_id) references restaurant (id),
);

create table orders_employee(
    id identity primary key not null,
    orders_id int not null,
    employee_id int not null,
    foreign key (orders_id) references orders (id),
    foreign key (employee_id) references employee (id),
);

create table orders_payment_option(
    id identity primary key not null,
    orders_id int not null,
    payment_option_id int not null,
    foreign key (orders_id) references orders (id),
    foreign key (payment_option_id) references payment_option (id),
);

-- inserting data

INSERT INTO CUSTOMER VALUES(default, 'John', 'Bond');
INSERT INTO CUSTOMER VALUES(default, 'Jeff', 'Anderson', );
INSERT INTO CUSTOMER VALUES(default, 'Suzzy', 'Patterson');
INSERT INTO CUSTOMER VALUES(default, 'Jack', 'Daniels');
INSERT INTO CUSTOMER VALUES(default, 'Donald', 'Redd');
INSERT INTO CUSTOMER VALUES(default, 'Mitchelle', 'Bond');
INSERT INTO CUSTOMER VALUES(default, 'John', 'Depp');

INSERT INTO EMPLOYEE VALUES(default, 'Abhishek', 'Shah');
INSERT INTO EMPLOYEE VALUES(default, 'Sabin' ,'Maharjan');
INSERT INTO EMPLOYEE VALUES(default, 'Robert' ,'Bortner');
INSERT INTO EMPLOYEE VALUES(default, 'Darian' ,'Rivera');
INSERT INTO EMPLOYEE VALUES(default, 'Vu', 'Truong');
INSERT INTO EMPLOYEE VALUES(default, 'Marian', 'Ansah');

INSERT INTO RESTAURANT VALUES(default, 'youngstown', 'OH', 614337456, 'Almasey drive', 220,'Kendall Ave' );

INSERT INTO MENU_ITEM VALUES(default, 'pasta', 13.00, 'vegetarian');
INSERT INTO MENU_ITEM VALUES(default, 'chicken salad', 12.00, 'salad');
INSERT INTO MENU_ITEM VALUES(default, 'shrimp scampi', 11.00,'non vegetarian');
INSERT INTO MENU_ITEM VALUES(default, 'chips', 9.00,'snack');

INSERT INTO MENU VALUES(default, 'seafood');
INSERT INTO MENU VALUES(default, 'appetizer');
INSERT INTO MENU VALUES(default, 'Dessert');

INSERT INTO ORDERS VALUES(default, default);
INSERT INTO ORDERS VALUES(default, default);
INSERT INTO ORDERS VALUES(default, default);

INSERT INTO PAYMENT_OPTION VALUES(default,'credit', '2011456723456231', 'chase', 'Jack_Daniels', 4);
INSERT INTO PAYMENT_OPTION VALUES(default,'debit', '2011456723456232', 'chase', 'John Depp', 7);
INSERT INTO PAYMENT_OPTION VALUES(default,'debit', '1324554655768879' ,'BNP Paribas', 'John_Bond', 1);
INSERT INTO PAYMENT_OPTION VALUES(default,'credit', '2234335466576687', 'Bank of America', 'Jeff Anderson', 2);
INSERT INTO PAYMENT_OPTION VALUES(default,'debit', '3324665766451123', 'Wells Fargo', 'Jeff Anderson', 2);
INSERT INTO PAYMENT_OPTION VALUES(default,'debit', '1143554766879900', 'Chase', 'Suzzy Patterson', 3);
INSERT INTO PAYMENT_OPTION VALUES(default,'credit', '1132554655768899', 'Bank Of America', 'Donald Redd', 5);
INSERT INTO PAYMENT_OPTION VALUES(default,'debit', '13136464675758889','BNP Paribas', 'Mitchell Bond', 6);
INSERT INTO PAYMENT_OPTION VALUES(default,'credit', '5574668799807798','Chase', 'John Depp', 7);
INSERT INTO PAYMENT_OPTION VALUES(default,'debit', '1132443544657700', 'Bank Of America', 'Maxwell Davis', 3);

INSERT INTO PAYMENT_OPTION_CUSTOMER (DEFAULT, )

INSERT INTO CUSTOMER_RESTAURANT VALUES(default, 1,1); 
INSERT INTO CUSTOMER_RESTAURANT VALUES(default, 2,1); 
INSERT INTO CUSTOMER_RESTAURANT VALUES(default, 3,1); 

INSERT INTO EMPLOYEE_RESTAURANT VALUES (default,1,1);
INSERT INTO EMPLOYEE_RESTAURANT VALUES (default,2,1);
INSERT INTO EMPLOYEE_RESTAURANT VALUES (default,3,1);

INSERT INTO MENU_ITEM_ORDERS VALUES(default,select price from menu_item where id = 1,1);
INSERT INTO MENU_ITEM_ORDERS VALUES(default,select price from menu_item where id = 2,2);
INSERT INTO MENU_ITEM_ORDERS VALUES(default,select price from menu_item where id = 3,3);

INSERT INTO MENU_RESTAURANT VALUES(default,1,1);
INSERT INTO MENU_RESTAURANT VALUES(default,2,1);
INSERT INTO MENU_RESTAURANT VALUES(default,3,1);

INSERT INTO ORDERS_EMPLOYEE VALUES(default,1,1);
INSERT INTO ORDERS_EMPLOYEE VALUES(default,2,4);
INSERT INTO ORDERS_EMPLOYEE VALUES(default,3,3);

INSERT INTO ORDERS_PAYMENT_OPTION VALUES(default,1,1);
INSERT INTO ORDERS_PAYMENT_OPTION VALUES(default,2,2);
INSERT INTO ORDERS_PAYMENT_OPTION VALUES(default,3,1);

SELECT ORDERS.*, PAYMENT_OPTION.*, CUSTOMER.Last_Name, CUSTOMER.First_Name, menu_item.item_name from orders
INNER JOIN ORDERS_PAYMENT_OPTION ON ORDERS_PAYMENT_OPTION.orders_id = ORDERS.id
INNER JOIN PAYMENT_OPTION ON ORDERS_PAYMENT_OPTION.PAYMENT_OPTION_ID = PAYMENT_OPTION.ID
INNER JOIN CUSTOMER ON PAYMENT_OPTION.CUSTOMER_ID = CUSTOMER.ID inner join menu_item_orders on menu_item_orders.orders_id = orders.id
inner join menu_item on menu_item_orders.menu_item_id = menu_item.id