select nome, data_nasc from pacientes;
select count(crm) from medicos;
select avg(timestampdiff(year, data_nasc, curdate())) from pacientes;