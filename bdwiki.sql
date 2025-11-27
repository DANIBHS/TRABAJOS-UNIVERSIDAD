-- Crear base de datos
CREATE DATABASE IF NOT EXISTS anime_wiki_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE anime_wiki_db;

-- Tabla de usuarios
CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de animes/mangas
CREATE TABLE IF NOT EXISTS contenido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    tipo ENUM('anime', 'manga') NOT NULL,
    estado ENUM('en_emision', 'finalizado', 'proximo') NOT NULL,
    sinopsis TEXT,
    imagen_url VARCHAR(500),
    calificacion DECIMAL(3,1) DEFAULT 0.0,
    episodios INT,
    capitulos INT,
    fecha_estreno DATE,
    generos VARCHAR(200),
    popularidad INT DEFAULT 0,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de comentarios
CREATE TABLE IF NOT EXISTS comentarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    contenido_id INT NOT NULL,
    usuario_id INT NOT NULL,
    comentario TEXT NOT NULL,
    fecha_comentario TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (contenido_id) REFERENCES contenido(id) ON DELETE CASCADE,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
);

-- Índices para mejor rendimiento
CREATE INDEX idx_contenido_tipo ON contenido(tipo);
CREATE INDEX idx_contenido_estado ON contenido(estado);
CREATE INDEX idx_contenido_popularidad ON contenido(popularidad DESC);
CREATE INDEX idx_comentarios_contenido ON comentarios(contenido_id);

-- Datos de ejemplo
INSERT INTO contenido VALUES (
    NULL,
    'Gantz',
    'manga',
    'finalizado',
    'Personas recién fallecidas son obligadas a luchar contra alienígenas en misiones letales.',
    'https://images.cdn2.buscalibre.com/fit-in/360x360/f6/b7/f6b7b69226ae0fe528f3e9e82788caba.jpg',
    8.0,
    NULL,
    383,
    '2000-07-13',
    'Acción, Ciencia Ficción, Terror',
    820,
    DEFAULT
);









