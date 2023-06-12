create table piloto (
	id serial not null,
	nome varchar not null,
	constraint piloto_pk primary key (id)
	);
	
create table lista_piloto (
	id serial not null,
	cod_pilotos int not null,
	colocacao int not null,
	constraint lista_piloto_pk primary key (id)
	);
	
alter table lista_piloto add constraint lista_piloto_fk foreign key (cod_pilotos) references piloto (id);

alter table corrida add constraint corrida_fk3 foreign key (pilotos) references lista_piloto (id);

create table colocacao (
	id serial not null,
	lista_piloto int not null,
	constraint colocacao_pk primary key (id)
	);

alter table corrida add column colocacao int not null;

alter table corrida add constraint corrida_fk4 foreign key (colocacao) references colocacao (id);

alter table colocacao add constraint colocacao_fk foreign key (lista_piloto) references lista_piloto (id);


