CREATE SCHEMA IF NOT EXISTS ONNOVAPP

drop table if exists "ONNOVAPP".CLIENTES;
create table "ONNOVAPP".CLIENTES
(
	CLI_ID INT not null auto_increment,
	RUT VARCHAR(250) not null primary key,
	NOMBRE VARCHAR(250) not null,
	APELLIDO VARCHAR(250),
	DOB DATE not null,
	CLI_ID_TYPE VARCHAR(1) not null
);

drop table if exists "ONNOVAPP".CUENTAS;
create table "ONNOVAPP".CUENTAS
(
	CNT_ID INT not null primary key auto_increment,
	CNT_CLI_ID INT not null,
	CTN_CUR VARCHAR(3) not null,
	CTN_BAL DECIMAL(15),
	foreign key (CNT_CLI_ID) references "ONNOVAPP".CLIENTES(CLI_ID)
);

drop table if exists "ONNOVAPP".MOVIMIENTOS;
create table "ONNOVAPP".MOVIMIENTOS
(
	MOV_CTN_ID INT not null primary key,
	MOV_MOV DECIMAL(15) not null,
	foreign key (MOV_CTN_ID) references "ONNOVAPP".CUENTAS(CNT_ID)
);



// 

create table "ONNOVAPP".CLIENTES
(
	CLI_ID INT not null PRIMARY KEY GENERATED ALWAYS AS IDENTITY(Start with 1, Increment by 1),
	RUT VARCHAR(250) not null UNIQUE,
	NOMBRE VARCHAR(250) not null,
	APELLIDO VARCHAR(250),
	DOB DATE not null,
	CLI_ID_TYPE VARCHAR(1) not null
);

create table "ONNOVAPP".CUENTAS
(
	CNT_ID INT not null PRIMARY KEY GENERATED ALWAYS AS IDENTITY(Start with 1, Increment by 1),
	CNT_CLI_ID INT not null,
	CTN_CUR VARCHAR(3) not null,
	CTN_BAL DECIMAL(15),
	foreign key (CNT_CLI_ID) references "ONNOVAPP".CLIENTES(CLI_ID)
);


create table "ONNOVAPP".MOVIMIENTOS
(
	MOV_CTN_ID INT not null primary key,
	MOV_MOV DECIMAL(15) not null,
	foreign key (MOV_CTN_ID) references "ONNOVAPP".CUENTAS(CNT_ID)
);