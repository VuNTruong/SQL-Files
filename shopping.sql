create table users (
    id int primary key auto_increment,
    first_name varchar (50),
    last_name varchar (50)
);
 
create table cart(
    id int primary key auto_increment,
    user_id int,
    foreign key (user_id) references users (id)
);

create table shipping_address (
    id int primary key auto_increment,
    address varchar (50),
    user_id int,
    foreign key (user_id) references users (id)
);

create table payment_type (
    id int primary key auto_increment,
    card_type varchar (50),
    card_number varchar (50),
    user_id int,
    foreign key (user_id) references users (id)
);

create table brand (
    id int primary key auto_increment,
    brand_name varchar (50)
);

create table category (
    id int primary key auto_increment,
    category_name varchar (50)
);

create table store (
    id int primary key auto_increment,
    store_name varchar (50),
    store_location varchar (50)
);

create table products (
    id int primary key auto_increment,
    price double,
    cart_belong_to_id int,
    product_name varchar (50),
    foreign key (cart_belong_to_id) references cart (id)
);

create table products_store (
    id int primary key auto_increment,
    product_id int,
    store_id int,
    foreign key (product_id) references products (id),
    foreign key (store_id) references store (id)
);

create table products_brand (
    id int primary key auto_increment,
    product_id int,
    brand_id int,
    foreign key (product_id) references products (id),
    foreign key (brand_id) references brand (id)
);

create table products_category (
    id int primary key auto_increment,
    product_id int,
    brand_id int,
    foreign key (product_id) references products (id),
    foreign key (brand_id) references brand (id)
);

create table orders (
    id int primary key auto_increment,
    product_id int,
    order_id varchar (50),
    user_id int,
    foreign key (user_id) references users (id),
    foreign key (product_id) references products (id)
);

create table orderProducts (
    id int primary key auto_increment,
    order_id int,
    product_id int,
    foreign key (order_id) references orders (id),
    foreign key (product_id) references products (id)
);

create table order_payment_type (
    id int primary key auto_increment,
    order_id int,
    payment_type_id int,
    foreign key (order_id) references orders (id),
    foreign key (payment_type_id) references payment_type
);