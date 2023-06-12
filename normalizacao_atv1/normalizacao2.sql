create table normalizacao2.movimento (
	id serial not null,
	data_movimento date not null,
	tipo_movimento int not null,
	
	constraint movimento_pk primary key (id)
	);
	
alter table normalizacao2.movimento add constraint movimento_fk foreign key (tipo_movimento) references normalizacao2.tipo_movimento(id);

create table normalizacao2.tipo_movimento (
	id serial not null,
	descricao varchar not null,
	constraint tipo_movimento_pk primary key (id)
	);
	
create table normalizacao2.produto (
	id serial not null,
	nome varchar not null,
	valor int not null,
	constraint produto_pk primary key (id)
	);
	
create table normalizacao2.cliente (
	id serial not null,
	nome varchar not null,
	cpf int not null,
	email varchar not null,
	endereço varchar not null,
	
 	constraint cliente_pk primary key (id)
 	);
 
 alter table normalizacao2.cliente add constraint cliente_pk primary key (cpf);


 create table normalizacao2.telefone (
 	cod_cliente int not null,
 	telefone int
 	);
alter table normalizacao2.telefone add constraint telefone_fk foreign key (cod_cliente) references normalizacao2.cliente (cpf);

create table normalizacao2.departamento(
	id serial not null,
	nome varchar not null,
	constraint deparatmento_pk primary key (id)
	);

create table normalizacao2.venda (
	nf_venda serial not null,
	data_venda date not null,
	cpf_cliente int not null,
	cod_produto int not null,
	cod_departamento int not null,
	
	constraint venda_pk primary key (nf_venda)
	);

alter table normalizacao2.venda add constraint venda_fk foreign key (cpf_cliente) references normalizacao2.cliente (cpf);
alter table normalizacao2.venda add constraint venda_fk1 foreign key (cod_produto) references normalizacao2.produto (id);

alter table normalizacao2.venda add constraint venda_fk2 foreign key (cod_Departamento) references normalizacao2.departamento (id);


create table normalizacao2.controle (
	id serial not null,
	tipo_controle int not null,
	
	constraint controle_pk primary key (id),
	constraint controle_fk foreign key (tipo_controle) references normalizacao2.tipo_controle (id)
	);

create table normalizacao2.tipo_controle (
	id serial not null,
	descricao varchar not null,
	
	constraint tipo_controle_pk primary key (id)
	);
	
alter table normalizacao2.movimento add column cod_controle int not null;
 alter table normalizacao2.movimento add constraint movimento_fk1 foreign key (cod_controle) references normalizacao2.controle (id) ;

create table normalizacao2.empregado (
	id serial not null,
	nome varchar not null,
	
	constraint empregado_pk primary key (id)
	);

create table normalizacao2.fornecedor (
	id serial not null,
	razao_social varchar not null,
	
	constraint fornecedor_pk primary key (id)
	);

create table normalizacao2.fornecimento (
	id serial not null,
	cod_fornecedor int not null,
	cod_produto int null,
	cod_departamento int null,
	constraint fornecimento_pk primary key (id)
	);

alter table normalizacao2.fornecimento add constraint fornecimento_fk foreign key (cod_fornecedor) references normalizacao2.fornecedor (id) ;
alter table normalizacao2.fornecimento add constraint fornecimento_fk1 foreign key (cod_produto) references normalizacao2.produto (id) ;
alter table normalizacao2.fornecimento add constraint fornecimento_fk2 foreign key (cod_departamento) references normalizacao2.departamento (id) ;

alter table normalizacao2.venda add column cod_empregado int not null;
alter table normalizacao2.venda add constraint venda_fk3 foreign key (cod_empregado) references normalizacao2.empregado (id) ;

alter table normalizacao2.controle_entrada add column cod_almoxarifado int not null;
alter table normalizacao2.controle_entrada add column cod_movimento int not null;
alter table normalizacao2.controle_entrada add column cod_fornecimento int not null;

create table normalizacao2.controle_saida (
	id serial not null,
	cod_almoxarifado int not null,
	cod_movimento int not null,
	nf_venda int not null,
	constraint saida_pk primary key (id)
	);

alter table normalizacao2.controle_entrada add constraint controle_entrada_fk foreign key (cod_movimento) references normalizacao2.movimento (id) ;
alter table normalizacao2.controle_entrada add constraint controle_entrada_fk2 foreign key (cod_fornecimento) references normalizacao2.fornecimento (id) ;
	
alter table normalizacao2.controle_saida add constraint controle_saida_fk foreign key (cod_movimento) references normalizacao2.movimento (id) ;
alter table normalizacao2.controle_saida add constraint controle_saida_fk2 foreign key (nf_venda) references normalizacao2.venda (nf_venda) ;

alter table normalizacao2.movimento add constraint movimento_fk2 foreign key (cod_controle) references normalizacao2.controle_saida (id) ;

alter table normalizacao2.controle_saida add column tipo_controle int not null;
alter table normalizacao2.controle_saida add constraint controle_saida_fk3 foreign key (tipo_controle) references normalizacao2.tipo_controle (id) ;

alter table normalizacao2.produto add column cod_departamento int not null;
alter table normalizacao2.produto add constraint produto_fk foreign key (cod_departamento) references normalizacao2.departamento (id);

create table almoxarifado (
	id serial not null,
	local varchar not null,
	constraint almoxarifado_pk primary key (id)
	
	);

alter table normalizacao2.movimento add column cod_almoxarifado int not null;

alter table normalizacao2.movimento add constraint movimento_fk3 foreign key (cod_almoxarifado) references normalizacao2.almoxarifado (id);















