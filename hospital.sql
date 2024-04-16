create schema if not exists hospital;
use hospital;

create table if not exists pacientes(
cpf int primary key,
nome varchar(45) not null,
idade int not null,
telefone int not null,
rua varchar(50) not null,
numero int not null,
bairro varchar(30) not null,
cidade varchar(30) not null,
uf char(2) not null,
cep varchar(9) not null,
email varchar(45) not null
);

create table if not exists departamentos(
id_departamento int primary key,
nome varchar(45) not null,
especialidade varchar(45) not null
);

create table if not exists medicos(
crm int not null,
uf varchar(5) not null,
primary key(crm, uf, id_departamento),
nome varchar(45) not null,
especializacao varchar(45) not null,
email varchar(45) not null,
telefone int not null,
id_departamento int not null,
foreign key (id_departamento) references departamentos(id_departamento)
);

create table if not exists consultas(
id_consulta int not null,
primary key(id_consulta, paciente_cpf, medico_crm, medico_uf, departamento_medico),
horario time not null,
data_consulta date not null,
historico varchar(45) not null,
paciente_cpf int not null,
medico_crm int not null,
medico_uf varchar(5) not null,
departamento_medico int not null,
foreign key (paciente_cpf) references pacientes(cpf),
foreign key (medico_crm) references medicos(crm),
foreign key (medico_uf) references medicos(uf),
foreign key (departamento_medicos) references medicos(id_departamento)
);