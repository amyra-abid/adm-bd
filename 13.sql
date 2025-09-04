
create database abaid;
use abaid;

-- Creación tabla personas
CREATE TABLE personas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    estado VARCHAR(10) NOT NULL DEFAULT 'activo', -- Campo de auditoría estado con valor por defecto 'activo'
    fecha_creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Fecha de creación automática
    fecha_modificacion DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP, -- Fecha de modificación automática al actualizar
    usuario_creacion VARCHAR(50) NOT NULL, -- Usuario que creó el registro
    -- Restricción CHECK para validar que el estado solo pueda ser 'activo' o 'inactivo'
    CONSTRAINT chk_estado_personas CHECK (estado IN ('activo', 'inactivo'))
);



-- Creación tabla tipo_usuarios
CREATE TABLE tipo_usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(255) NULL,
    estado VARCHAR(10) NOT NULL DEFAULT 'activo', -- Campo auditoría estado
    fecha_creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    usuario_creacion VARCHAR(50) NOT NULL,
    -- Restricción CHECK para validar que el nombre del tipo de usuario tenga entre 3 y 50 caracteres
    CONSTRAINT chk_nombre_tipo_usuario CHECK (CHAR_LENGTH(nombre) BETWEEN 3 AND 50)
);

-- Creación tabla usuarios
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    tipo_usuario_id INT NOT NULL,
    estado VARCHAR(10) NOT NULL DEFAULT 'activo', -- Estado para auditoría
    fecha_creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    usuario_creacion VARCHAR(50) NOT NULL,
    -- Restricción CHECK que garantiza que estado solo pueda ser 'activo' o 'inactivo'
    CONSTRAINT chk_estado_usuarios CHECK (estado IN ('activo', 'inactivo')),
    FOREIGN KEY (tipo_usuario_id) REFERENCES tipo_usuarios(id)
);
