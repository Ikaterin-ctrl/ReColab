CREATE TABLE Usuario (
    id_usuario INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(100) NOT NULL,
    cidade VARCHAR(100),
    estado VARCHAR(100)
);

CREATE TABLE Item (
    id_item INT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL, -- ex: roupa, livro, eletrônico
    descricao TEXT,
    peso_kg DECIMAL(5,2),
    data_cadastro DATE NOT NULL,
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

CREATE TABLE Coleta (
    id_coleta INT PRIMARY KEY,
    data_agendada DATE NOT NULL,
    status VARCHAR(50) DEFAULT 'agendada', -- agendada, concluída, cancelada
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

CREATE TABLE Coleta_Item (
    id_coleta INT,
    id_item INT,
    PRIMARY KEY (id_coleta, id_item),
    FOREIGN KEY (id_coleta) REFERENCES Coleta(id_coleta),
    FOREIGN KEY (id_item) REFERENCES Item(id_item)
);

CREATE TABLE Impacto (
    id_impacto INT PRIMARY KEY,
    id_usuario INT,
    total_kg_doados DECIMAL(10,2),
    total_itens INT,
    familias_impactadas INT,
    reciclaveis_redirecionados_kg DECIMAL(10,2),
    data_atualizacao DATE,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

CREATE TABLE Parceiro (
    id_parceiro INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tipo VARCHAR(50), -- ONG, Empresa, Instituição
    contato_email VARCHAR(100),
    descricao TEXT
);

CREATE TABLE Recompensa (
    id_recompensa INT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    tipo VARCHAR(50), -- Cupom, Brinde, Desconto
    valor VARCHAR(50),
    parceiro_id INT,
    FOREIGN KEY (parceiro_id) REFERENCES Parceiro(id_parceiro)
);

CREATE TABLE Usuario_Recompensa (
    id_usuario INT,
    id_recompensa INT,
    data_resgate DATE,
    PRIMARY KEY (id_usuario, id_recompensa),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_recompensa) REFERENCES Recompensa(id_recompensa)
);
