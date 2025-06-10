use sistema_ventas_4e;
alter table usuarios
add password varchar(100) not null;

alter table tipo_usuarios
add descripcion_tipo varchar(300) not null after nombre_tipo;

use sistema_ventas_4e;

select * from usuarios;
INSERT INTO usuarios (
    nombre_usuario, password, correo,tipo_usuario_id , created_by, updated_by
)
VALUES (
    'sistema',
    '$2y$10$2pEjT0G2k9YzHs1oZ.abcde3Y8GkmHfvhO1/abcxyz', -- Contraseña encriptada (ejemplo realista con bcrypt)
    'sistema@plataforma.cl',
    NULL,
    NULL,
    NULL
);
select * from tipo_usuarios;
-- Inserción de los tipos
INSERT INTO tipo_usuarios (
    nombre_tipo,
    descripcion_tipo,
    created_by,
    updated_by
)
VALUES (
    'Administrador',
    'Accede a todas las funciones del sistema, incluida la administración de usuarios.',
    1, -- creado por el usuario inicial
    1  -- actualizado por el mismo
);

-- Inserción de los tipos
INSERT INTO tipo_usuarios (
    nombre_tipo,
    descripcion_tipo,
    created_by,
    updated_by
)
VALUES (
    'Vendedor',
    'Usuario con perfil de ventas',
    1, -- creado por el usuario inicial
    1  -- actualizado por el mismo
);
INSERT INTO tipo_usuarios (
    nombre_tipo,
    descripcion_tipo,
    created_by,
    updated_by
)
VALUES (
    'Cliente',
    'Usuario con perfil de cliente',
    1, -- creado por el usuario inicial
    1  -- actualizado por el mismo

);
INSERT INTO tipo_usuarios (
    nombre_tipo,
    descripcion_tipo,
    created_by,
    updated_by
)
VALUES (
    'gerente',
    'perfil de control total',
    1, -- creado por el usuario inicial
    1  -- actualizado por el mismo

);
  INSERT INTO tipo_usuarios (
    nombre_tipo,
    descripcion_tipo,
    created_by,
    updated_by
)
VALUES (
    'invitado',
    'perfil de invitado',
    1, -- creado por el usuario inicial
    1  -- actualizado por el mismo

);
INSERT INTO usuarios (
    nombre_usuario, password, correo,tipo_usuario_id , created_by, updated_by
)
VALUES (
    'amyra',
    '$2y$10$2pEjT0G2k9YzHs1oZ.abcde3Y8GkmHfvhO1/abcxyz', -- Contraseña encriptada (ejemplo realista con bcrypt)
    'amyra.antoenlla@gmail.cl',
    2,
    1,
	1
);
INSERT INTO usuarios (
    nombre_usuario, password, correo,tipo_usuario_id , created_by, updated_by
)
VALUES (
    'alonso',
    '$2y$10$2pEjT0G2k9YzHs1oZ.abcde3Y8GkmHfvhO1/abcxyz', -- Contraseña encriptada (ejemplo realista con bcrypt)
    'alonsoo.alonso@gmail.cl',
    2,
    1,
	1
);
INSERT INTO usuarios (
    nombre_usuario, password, correo,tipo_usuario_id , created_by, updated_by
)
VALUES (
    'daniel',
    '$2y$10$2pEjT0G2k9YzHs1oZ.abcde3Y8GkmHfvhO1/abcxyz', -- Contraseña encriptada (ejemplo realista con bcrypt)
    'profe.dani@gmail.cl',
    2,
    1,
	1
);
INSERT INTO usuarios (
    nombre_usuario, password, correo,tipo_usuario_id , created_by, updated_by
)
VALUES (
    'alessandro',
    '$2y$10$2pEjT0G2k9YzHs1oZ.abcde3Y8GkmHfvhO1/abcxyz', -- Contraseña encriptada (ejemplo realista con bcrypt)
    'alessandro@gmail.cl',
    2,
    1,
	1
);
INSERT INTO usuarios (
    nombre_usuario, password, correo,tipo_usuario_id , created_by, updated_by
)
VALUES (
    'martina',
    '$2y$10$2pEjT0G2k9YzHs1oZ.abcde3Y8GkmHfvhO1/abcxyz', -- Contraseña encriptada (ejemplo realista con bcrypt)
    'martina.lonconao@gmail.cl',
    2,
    1,
	1
);
INSERT INTO productos (
    nombre_producto, precio_producto, stock, created_by, updated_by
)
VALUES (
    'Bebida',
    1000,
    50,
    4, -- usuario de registro
4  

),
(
    'Helado',
    200,
    100,
    4,
4  

),
(
'Chocolate',
    2000,
    80,
    4,
    4
),
(
    'Galleta',
    1000,
    200,
    4,
    4
),
(
    'Mentas',
    500,
    100,
    4,
    4
);
describe ventas;
INSERT INTO ventas (
    usuario_id, Fecha, created_by, updated_by
)
VALUES (
    2,
    NOW(),
    2,
    2
),
(
    2,
    NOW(),
    2,
    2
),
(
    2,
    NOW(),
    2,
    2
),
(
    2,
    NOW(),
    2,
    2
),
(
    2,
    NOW(),
    2,
    2
);
INSERT INTO detalle_ventas (
    id_ventas, id_producto, cantidad, precio_unitario, created_by, updated_by
)
VALUES (
    1,
    2,
    50,
    100,
    2,
    2
),
(
    5,
    4,
    100,
    600,
    2,
    2
),
(
    2,
    1,
    30,
    700,
    2,
    2
),
(
    3,
    3,
    50,
    1100,
    2,
    2
),
(
    4,
    5,
    70,
    300,
    2,
    2
);
select * from detalle_ventas; --
-- tabla detalle ventas --
select * from tipo_usuarios; -- ok
select * from usuarios; -- ok
select * from detalle_ventas; -- ok
select * from productos; -- ok
select * from ventas; -- ok