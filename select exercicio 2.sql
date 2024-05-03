select nome, cidade from aeroportos;
select cia_aerea, count(id_voo) as quant_voo from voos group by CIA_AEREA;
select avg(poltronas) from aeronaves;
