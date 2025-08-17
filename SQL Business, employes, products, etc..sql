drop table if exists departamentos;
drop table if exists Empresa;
drop table if exists empleados;
drop table if exists empleados_proyectos;
drop table if exists proyectos;
drop table if exists proveedores;
drop table if exists proveedores_productos;
drop table if exists productos;

CREATE TABLE departamentos(
  codigo int AUTO_INCREMENT,
  nombre varchar(20),
  ubicacion varchar(25),
  constraint pk_departamentos PRIMARY KEY(codigo)
);

CREATE TABLE Empresa(
  codigo_Empresa int AUTO_INCREMENT,
  codigo_departamentos int not null,
  constraint pk_Empresa PRIMARY KEY(codigo_Empresa),
  constraint fk_Empresadepartamentos foreign key(codigo_departamentos) REFERENCES departamentos(codigo)
  );

CREATE TABLE empleados(
  id_empleados int AUTO_INCREMENT,
  nombre varchar(20),
  id_conyuge smallint(15),
  Empresa int not null,
  Departamentos int not null,
  constraint pk_empleados PRIMARY KEY(id_empleados),
 
  constraint fk_empleadosEmpresa foreign key(Empresa) REFERENCES
Empresa(codigo_Empresa),
 
  constraint fk_empleadosdepartamentos foreign key(departamentos) REFERENCES
 departamentos(codigo)
);

CREATE TABLE proyectos(
  codigo int AUTO_INCREMENT,
  nombre varchar(20),
  presupuesto int not null,
  Empresa int not null,
 
  constraint pk_proyectos PRIMARY KEY(codigo),
 
  constraint fk_proyectosEmpresa foreign key(Empresa) REFERENCES
  Empresa(codigo_Empresa)
);

CREATE TABLE empleados_proyectos(
  
  proyectos int not null,
  empleados int not null,
constraint fk_empleadosproyectos foreign key(proyectos) REFERENCES
  proyectos(codigo),
 
  constraint fk_proyectosempleados foreign key(empleados) REFERENCES
  empleados(id_empleados)
);

CREATE TABLE proveedores(
  codigo int AUTO_INCREMENT,
  nombre varchar(20),
  telefono smallint(15),
  direccion varchar(25),
  Empresa int not null,

  constraint pk_proveedores PRIMARY KEY(codigo),
  constraint fk_proveedoresempresa foreign key(Empresa) REFERENCES
Empresa(codigo_Empresa)
 
);

CREATE TABLE productos(
  codigo int AUTO_INCREMENT,
  nombre varchar(20),
  precio int not null,
  Empresa int not null,
  proyectos int not null,

  constraint pk_productos PRIMARY KEY(codigo),
  constraint fk_productosEmpresa foreign key(Empresa) REFERENCES
Empresa(codigo_Empresa),
  constraint fk_productosproyectos foreign key(proyectos) REFERENCES
  proyectos(codigo)
);

CREATE TABLE proveedores_productos(
proveedores int not null,
productos int not null,

constraint fk_proveedores foreign key(proveedores) REFERENCES
    proveedores(codigo),
   
    constraint fk_productos foreign key(productos) REFERENCES
    productos(codigo)
);
