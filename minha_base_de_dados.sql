create schema minha_base_de_dados DEFAULT CHARACTER SET utf8mb4;
use minha_base_de_dados;

CREATE TABLE IF NOT EXISTS medicos(
id_medico int primary key,
crm int not null,
nome varchar(100) not null,
cpf varchar(20) not null,
especialidade varchar(50) not null,
data_nascimento date not null,
rua varchar(50) not null,
numero int not null,
bairro varchar(30) not null,
cidade varchar(30) not null,
uf varchar(2) not null,
cep varchar(9) not null,
telefone varchar(20)
);

create table if not exists riscos_operacionais(
id_riscos_operacionais int primary key,
tipo varchar(30) not null
);

create table if not exists cargos(
id_cargo int primary key,
nome varchar(45) not null
);

create table if not exists resultados_exame(
id_tipo_resultado_exame int primary key,
tipo varchar(30) not null
);

create table if not exists tipo_exame(
id_tipo_exame int primary key,
tipo varchar(50) not null
);

create table if not exists empresas(
id_empresa int primary key,
cnpj varchar(20) not null,
nome_fantasia varchar(50) not null,
rua varchar(50) not null,
numero int not null,
bairro varchar(50) not null,
cidade varchar(30) not null,
uf varchar(2) not null,
cep varchar(9) not null,
telefone varchar(20) not null,
foreign key (empresas_id_empresa) references empresas(id_empresas)
);

create table if not exists funcionarios(
id_funcionario int primary key,
nome varchar(100) not null,
cpf varchar(20) not null,
data_nascimento date not null,
rua varchar(50) not null,
numero int not null,
bairro varchar(50) not null,
cidade varchar(30) not null,
uf varchar(2) not null,
cep varchar(9) not null,
telefone varchar(20) not null,
cargos_id_cargo int not null,
empresas_id_empresa int not null,
foreign key (cargos_id_cargo) references cargos(id_cargo),
foreign key (empresas_id_empresa) references empresas(id_empresa)
);

create table if not exists exames(
id_exame int primary key,
especialidade varchar(30) not null,
data_realizacao date not null,
tipo_exame_id_tipo_exame int not null,
resultados_exame_id_tipo_resultado_exame int not null,
foreign key (tipo_exame_id_tipo_exame) references tipo_exame(id_tipo_exame),
foreign key (resultados_exame_id_tipo_resultado_exame) references resultados_exame(id_tipo_resultado_exame)
);

create table if not exists funcionarios_has_exames(
exames_id_exame int primary key,
funcionarios_id_funcionario int primary key,
foreign key (exames_id_exame) references exames(id_exame),
foreign key (funcionarios_id_funcionario) references funcionarios(id_funcionario)
);

create table if not exists empresas_has_exames(
exames_id_exame int primary key,
empresas_id_empresa int primary key,
foreign key(exames_id_exame) references exames(id_exame),
foreign key(empresas_id_empresa) references empresas(id_empresa)
);

create table if not exists atestados(
id_atestado int primary key,
resultados_riscos varchar(100) not null,
resultado varchar(100) not null,
observacoes varchar(300) not null,
medico_id int not null,
foreign key(medico_id) references medicos(medico_id)
);

create table if not exists exames_has_atestados(
exames_id_exame int primary key,
atestados_id_atestado int primary key,
foreign key (exames_id_exame) references exames(id_exame),
foreign key(atestados_id_atestado) references atestados(id_atestado)
);


