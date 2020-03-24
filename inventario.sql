create database if not exists inventario;

use inventario;


create table if not exists rol(

id_rol int not null primary key auto_increment,

nombre_rol varchar(25) not null

)engine InnoDB;

insert into rol(nombre_rol) values ("Administrador"),("Bodeguero"),("Vendedor");

select * from rol;


create table if not exists usuario(

id_usuario int not null primary key auto_increment,

nombre_usuario varchar(25) not null,

contra varchar(25) not null,

id_rol int not null,
constraint fk_rol foreign key (id_rol)
references rol (id_rol) on delete cascade on update cascade

)engine InnoDB;

insert into usuario(nombre_usuario,contra,id_rol) values ("Claudia","123",1),("Pineda","456",2),("Arce","789",3);

select id_usuario as total from usuario where nombre_usuario='Claudia';

create table if not exists persona(

id_persona int not null primary key auto_increment,

nombre_persona varchar(50) not null,

apellidos_persona varchar(50) not null,

edad_persona int not null,

telefono_persona varchar(15) not null,

direccion_persona varchar(100) not null,

id_usuario int not null,

constraint fk_usuario foreign key (id_usuario) references usuario(id_usuario) on delete cascade on update cascade

)engine InnoDB;

insert into persona(nombre_persona,apellidos_persona,edad_persona,telefono_persona,direccion_persona,id_usuario) values
("Claudia Marisol","Pineda Arce",24,"7124-3783","Santa Tecla, col. Quezaltepeque psj 1",1),

("David","Quintanilla Orellana",26,"7254-1253","Santo Tomas residencial Flores casa # 12",2),

("Edgar Ernesto","Martinez Mayorga",23,"7329-3754","los planes de renderos residencial Santa Margarita casa # 7",3);

select * from persona;

create table if not exists cliente(

id_cliente int not null primary key auto_increment,

nombre_cliente varchar(50) not null,

apellidos_cliente varchar(50) not null,

edad_cliente int not null,

dui_cliente varchar(11) not null,

telefono_cliente varchar(15) not null,

correo_cliente varchar(50) not null

)engine InnoDB;

select * from cliente;

insert into cliente (nombre_cliente, apellidos_cliente, edad_cliente, dui_cliente, telefono_cliente, correo_cliente) 
values 
("Javier","Puro Diaz",24,"12456329-3","7894-4567","javier@gmail.com"),
("Daniel","Costa Guerrero",26,"32564897-6","7564-4522","daniel@gmail.com"),

("Stiven","Magin Lopez",28,"32564457-4","7894-4557","steven@gmail.com"),
("Josue","Mayorga Martinez",26,"32124897-6","7994-5567","josue@gmail.com"),

("joel","Martinez Mayorga",26,"32674897-2","7994-4267","joel@gmail.com"),
("Aaron ","Altamirano Alguera",26,"32136897-7","6894-4567","aaron@gmail.com"),

("Irvin","Amado Amalla",24,"32124889-5","7694-6567","irvin@gmail.com"),
("Ivan","Rodas Diaz",24,"32185897-6","6894-4587","ivan@gmail.com"),

("Alberto","Alvear Alvergue",28,"32145897-9","6894-4569","alberto@gmail.com"),
("Armando","Estupinian Martinez",29,"32124457-7","7394-4367","aramando@gmail.com");

create table if not exists proveedor(

id_proveedor int not null primary key auto_increment,

nombre_proveedor varchar(50) not null,

apellidos_proveedor varchar(50) not null,

direccion_proveedor varchar(100) not null,

telefono_proveedor varchar(15) not null,

correo_proveedor varchar(50) not null

)engine InnoDB;

insert into proveedor(nombre_proveedor, apellidos_proveedor, direccion_proveedor,telefono_proveedor, correo_proveedor) values

("Jeferson","Beltran","Los Planes Residencial Cumbres de santa Margarita  casa #5","6574-3567","jeferson@gmail.com"),

("Matias","Beltran Beltran","Olocuilta Residencial Las Plamas casa #32","6564-3567","Matias@gmail.com"),

("Mateo","Sanchez Sanchez","Santa Tecla Residencial el Porvenir casa #32","7564-3563","Mateo@gmail.com"),

("Jose","Sanchez Beltran"," Olocuilta Residencial Las Plamas  casa #5","6564-9567","leonardo@gmail.com"),

("Martin","Cuellar Amaya","San Salvador Residencial el Porvenir casa #9","7864-3562","Martin@gmail.com"),

("kevin"," Villanueva Beltran"," Apopa residencial El Sol pj. 4 casa #3","7964-5567","kevin@gmail.com"),

("Armando","Sanchez","Los Planes Residencial Cumbres de santa Margarita casa #4","7564-3969","Armando@gmail.com"),

("Andres","Romero Mineros","Santa Tecla Residencial Alturas de Holanda casa #34","7674-6587","Andres@gmail.com"),

("Maria","Platero Martinez","San  Marcos Vias de San Marcos casa #50","7564-3587","jose@gmail.com"),

("Marcos","Ventura Villanueva"," Santo Tomas Residencial Brisas del Volcan casa #45","7224-9567","Marcos@gmail.com"),

("Jose","Sanchez Beltran","Santa tecla Residencial el Porvenir casa #3","7564-3555","jose@gmail.com");

select *from proveedor;

create table if not exists articulo(

id_articulos int not null primary key auto_increment,

nombre_articulo  varchar(50) not null,

tipo_articulo varchar(50),

id_proveedor int not null,

constraint fk_proveedor foreign key (id_proveedor) references proveedor(id_proveedor) on delete cascade on update cascade

)engine InnoDB;

insert into articulo(nombre_articulo, tipo_articulo, id_proveedor)values

("Vino Tinto Merlot","vino",1),
("Vino Tinto Cabernet Sauvignon","vino",1),

("Vino Tinto Malbec","vino",2),
("Vino Blanco Chardonnay","vino",2),

("Vino Blanco Sauvignon Blanc","vino",3),
("Tequila","Alcohol",3),

("Ron","Alcohol",4),
("Whisky","Alcohol",4),
("Coñac","Alcohol",5),

("Vodka","Alcohol",5),
("Agua de Cuevas","Agua",6),
("Monte Pinos","Agua",6),

("Naturis","Agua",7),
("Fuenteblanca","Agua",7),
("Cristal","Agua",8),

("Valle Naranja","jugo",8),
("Valle Mandarina","jugo",9),
("la Granja","jugo",9),

("CocaCola","soda",10),
("Pepsi","soda",10);

select * from articulo;

create table if not exists registro_articulos(

id_registro_articulos int not null primary key auto_increment,

precio_compra double not null,

precio_venta double not null,

fecha_ingreso date not null,

cantidad int not null,

id_persona int not null,

id_articulos int not null,

constraint fkr_persona foreign key (id_persona) references persona(id_persona) on delete cascade on update cascade,

constraint fkr_articulos foreign key (id_articulos) references articulo(id_articulos) on delete cascade on update cascade

)engine InnoDB;

insert into registro_articulos (precio_compra, precio_venta, fecha_ingreso, cantidad, id_persona ,id_articulos) values 

(15.99,20.99,'2019-11-01',40,2,1),
(12.99,18.99,'2019-11-01',40,2,2),
(10.99,15.99,'2019-11-03',40,2,3),

(17.99,25.99,'2019-11-03',40,2,4),
(19.99,30.99,'2019-11-08',40,2,5),
(16.99,18.99,'2019-11-10',50,2,6),

(20.99,35.99,'2019-11-10',50,2,7),
(15.99,20.99,'2019-11-16',50,2,8),
(20.99,25.99,'2019-11-18',50,2,9),

(21.99,26.99,'2019-11-18',50,2,10),
(0.75,1.99,'2019-11-22',60,2,11),
(0.50,1.00,'2019-11-22',60,2,12),

(0.99,1.50,'2019-11-24',60,2,13),
(0.50,1.25,'2019-11-24',60,2,14),
(1.25,2.50,'2019-11-26',60,2,15),

(1.00,1.99,'2019-11-26',50,2,16),
(1.00,1.99,'2019-11-28',50,2,17),
(1.50,2.00,'2019-11-28',50,2,18),

(1.10,1.75,'2019-11-29',50,2,19),
(1.00,1.25,'2019-11-29',50,2,19);

select * from registro_articulos;

create table if not exists stock_articulo(

id_stock_articulo int not null primary key auto_increment,

id_articulos int not null,
stock int not null,

constraint fk_articulos foreign key (id_articulos) references articulo(id_articulos) on delete cascade on update cascade

)engine InnoDB;


insert into stock_articulo(id_articulos,stock)  values 
(1,40),(2,40),(3,40),(4,40),(5,40),(6,50),(7,50),(8,50),(9,50),(10,50),
(11,60),(12,60),(13,60),
(14,60),(15,60),(16,50),(17,50),(18,50),(19,50),(20,50);

select * from stock_articulo;


create table if not exists devoluciones(
id_devoluciones int not null primary key auto_increment,
id_articulos int not null,
cantidad int  not null,
constraint fk_articulo foreign key (id_articulos) references articulo(id_articulos) on delete cascade on update cascade
)engine InnoDB;

select * from devoluciones;

insert into devoluciones (id_articulos,cantidad) values (5,3),(10,1),(15,5),(20,2);
