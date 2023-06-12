create TABLE normalizacao1.alocacao_projeto (
	cod_projeto int NOT NULL,
	cod_funcionario int NOT NULL,
	data_inicio_alocacao date NOT NULL,
	tempo_alocacao int NOT NULL
);

create table normalizacao1.projeto (
	id serial not null,
	tipo_projeto int not null
);

create table normalizacao1.tipo_projeto (
	id int not null,
	descricao varchar not null
	);

create table normalizacao1.funcionario (
	id serial not null,
	nome varchar not null,
	cargo int not null
	);

create table normalizacao1.cargo (
	id serial not null,
	nome varchar not null,
	salario int not null
	);


ALTER TABLE normalizacao1.alocacao_projeto ADD CONSTRAINT alocacao_projeto_fk FOREIGN KEY (cod_funcionario) REFERENCES normalizacao1.funcionario(id);

ALTER TABLE normalizacao1.alocacao_projeto ADD CONSTRAINT alocacao_projeto_fk_1 FOREIGN KEY (cod_projeto) REFERENCES normalizacao1.projeto(id);

ALTER TABLE normalizacao1.projeto ADD CONSTRAINT projeto_fk FOREIGN KEY (tipo_projeto) REFERENCES normalizacao1.tipo_projeto (id);

ALTER TABLE normalizacao1.funcionario ADD CONSTRAINT funcionario_fk FOREIGN KEY (cargo) REFERENCES normalizacao1.cargo (id);
