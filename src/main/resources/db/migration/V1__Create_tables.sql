CREATE TABLE usuarios (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    cpf VARCHAR(14) NOT NULL UNIQUE,
    email VARCHAR(100),
    senha VARCHAR(255) NOT NULL,
    perfil VARCHAR(20) NOT NULL DEFAULT 'USER'
);

CREATE TABLE motos (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    placa VARCHAR(10) NOT NULL UNIQUE,
    modelo VARCHAR(20) NOT NULL,
    area VARCHAR(20) NOT NULL,
    observacao VARCHAR(500),
    data_entrada DATETIME2,
    usuario_id BIGINT,
    CONSTRAINT fk_moto_usuario
        FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
        ON DELETE SET NULL
);

CREATE INDEX idx_motos_placa ON motos(placa);
CREATE INDEX idx_motos_area ON motos(area);
