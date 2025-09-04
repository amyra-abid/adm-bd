DROP TABLE IF EXISTS usuarios;
DROP TABLE IF EXISTS tipo_usuarios;
DROP TABLE IF EXISTS personas;

create database amyra;

use amyra;

-- Tabla de personas
CREATE TABLE personas (
    id_persona INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    fecha_creacion DATE,
    fecha_modificacion DATE,
    estado VARCHAR(20),
    usuario_creacion VARCHAR(50)
);

-- Tabla de tipos de usuarios
CREATE TABLE tipo_usuarios (
    id_tipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_tipo VARCHAR(50),
    fecha_creacion DATE,
    fecha_modificacion DATE,
    estado VARCHAR(20),
    usuario_creacion VARCHAR(50)
);

-- Tabla de usuarios
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(100),
    id_tipo INT,
    fecha_creacion DATE,
    fecha_modificacion DATE,
    estado VARCHAR(20),
    usuario_creacion VARCHAR(50),
    FOREIGN KEY (id_tipo) REFERENCES tipo_usuarios(id_tipo)
);


-- Insertar personas
INSERT INTO personas (nombre, apellido, fecha_creacion, fecha_modificacion, estado, usuario_creacion)
VALUES
('Amyra', 'Pérez', '2025-01-10', '2025-01-10', 'activo', 'admin'),
('Alessandro', 'Gómez', '2025-02-15', '2025-02-20', 'activo', 'admin'),
('Martina', 'Ramírez', '2024-12-30', '2025-01-02', 'inactivo', 'admin');

-- Insertar tipos de usuario
INSERT INTO tipo_usuarios (nombre_tipo, fecha_creacion, fecha_modificacion, estado, usuario_creacion)
VALUES
('Administrador', '2025-01-01', '2025-01-01', 'activo', 'system'),
('Editor', '2025-01-01', '2025-01-01', 'activo', 'system'),
('Lector', '2025-01-01', '2025-01-01', 'activo', 'system');

-- Insertar usuarios
INSERT INTO usuarios (nombre_usuario, id_tipo, fecha_creacion, fecha_modificacion, estado, usuario_creacion)
VALUES
('CarlosAdmin', 1, '2025-01-10', '2025-01-15', 'activo', 'system'),
('AmyraEditor', 2, '2025-02-01', '2025-02-01', 'activo', 'system'),
('AlessandroLector', 3, '2024-12-20', '2025-01-01', 'inactivo', 'system'),
('MartinaMaster', 1, '2025-02-20', '2025-02-25', 'bloqueado', 'system'),
('Arlet', 2, '2025-03-01', '2025-03-01', 'activo', 'system');


-- a. Consulta básica: Usuarios activos
SELECT * 
FROM usuarios 
WHERE estado = 'activo';

-- b. Consulta con condición: Usuarios tipo Administrador
SELECT u.id_usuario, u.nombre_usuario, tu.nombre_tipo 
FROM usuarios u
JOIN tipo_usuarios tu ON u.id_tipo = tu.id_tipo
WHERE tu.nombre_tipo = 'Administrador';

-- c. Consulta con LIKE: Usuarios que comienzan con C
SELECT nombre_usuario 
FROM usuarios 
WHERE nombre_usuario LIKE 'C%';

-- d. Consulta por rango de fechas: Personas creadas entre dos fechas
SELECT * 
FROM personas 
WHERE fecha_creacion BETWEEN '2025-01-01' AND '2025-03-31';

-- Consulta propia 1: Usuarios activos que sean administradores
SELECT u.nombre_usuario, tu.nombre_tipo 
FROM usuarios u
JOIN tipo_usuarios tu ON u.id_tipo = tu.id_tipo
WHERE u.estado = 'activo' 
  AND tu.nombre_tipo = 'Administrador';

-- Consulta propia 2: Usuarios inactivos o bloqueados
SELECT * 
FROM usuarios 
WHERE estado = 'inactivo' OR estado = 'bloqueado';

-- Consulta propia 3: Personas creadas en la última semana
SELECT * 
FROM personas 
WHERE fecha_creacion >= CURDATE() - INTERVAL 7 DAY;

-- Consulta propia 4: Usuarios cuyo nombre contiene "admin"
SELECT * 
FROM usuarios 
WHERE nombre_usuario LIKE '%admin%';

-- Consulta propia 5: Usuarios modificados después de su creación
SELECT * 
FROM usuarios 
WHERE fecha_modificacion > fecha_creacion;