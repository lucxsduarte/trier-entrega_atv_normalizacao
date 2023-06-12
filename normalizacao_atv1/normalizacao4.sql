create table aluno (
	matricula serial not null,
	nome varchar not null,
	situacao_final int not null,
	constraint aluno_pk primary key (matricula)
);
	
create table professor (
	id serial not null,
	nome varchar not null,
	constraint professor_pk primary key (id)
);
	
create table disciplina (
	id serial not null,
	nome varchar not null,
	constraint disciplina_pk primary key (id)
);
	
alter table disciplina add column cod_professor int not null;
alter table disciplina add constraint disciplina_fk foreign key (cod_professor) references professor (id);



create table curso (
	id serial not null,
	nome varchar not null,
	cod_disciplina int not null,
	cod_turno int not null,
	constraint curso_pk primary key (id)
);

alter table curso add column cod_aluno int not null;
alter table curso add constraint curso_fk3 foreign key (cod_aluno) references aluno (matricula);

alter table curso add constraint curso_fk foreign key (cod_disciplina) references disciplina (id);

alter table curso add constraint curso_fk2 foreign key (cod_turno) references turno (id);

create table turno (
	id serial not null,
	descricao varchar not null,
	constraint turno_pk primary key (id)
);

create table nota (
	id serial not null,
	cod_aluno int not null,
	cod_disciplina int not null,
	constraint nota_pk primary key (id)
);

alter table nota add constraint nota_fk foreign key (cod_aluno) references aluno (matricula);
alter table nota add constraint nota_fk2 foreign key (cod_disciplina) references disciplina (id);

create table avaliacao (
	id serial not null,
	cod_aluno int not null,
	cod_professor int not null,
	cod_curso int not null,
	cod_nota int not null,
	constraint avaliacao_escolar primary key (id)
);

alter table avaliacao add constraint avaliacao_fk foreign key (cod_aluno) references aluno (matricula);
alter table avaliacao add constraint avaliacao_fk2 foreign key (cod_professor) references professor (id);
alter table avaliacao add constraint avaliacao_fk3 foreign key (cod_curso) references curso (id);
alter table avaliacao add constraint avaliacao_fk4 foreign key (cod_nota) references nota (id);

