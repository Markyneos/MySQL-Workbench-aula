use BDEX6_CINEMA;
#1. Criar uma consulta para exibir todas as informações da tabela ESPECTADORES.
SELECT * FROM ESPECTADORES;
#2. Escrever uma consulta para mostrar os nomes e e-mails dos espectadores que nasceram antes de 1995.
SELECT NOME_ESPEC, EMAIL_ESPEC FROM ESPECTADORES WHERE YEAR(DATA_NASC) < 1995;
#3. Listar os nomes das salas de cinema e suas capacidades.

#4. Exibir os detalhes das sessões de cinema: ID da sessão, nome do filme, nome da sala.

#5. Listar o nome e o distribuidor dos filmes com tempo de exibição superior a 120 minutos.
DESC FILMES;
SELECT NOME_FILME, DISTRIBUIDOR_FILME FROM FILMES WHERE TEMPO_FILME > 120;
#6. Mostrar as informações das sessões que exibiram filmes do diretor "Christopher Nolan".
DESC SESSOES;
DESC FILMES;
SELECT SS.ID_SESSAO, SS.FILME, SS.SALA FROM SESSOES AS SS
JOIN FILMES AS FIL ON FIL.ID_FILME = SS.FILME
WHERE DIRETOR = 'Christopher Nolan';
#7. Listar os nomes e as capacidades das salas de cinema ordenadas pela capacidade de forma decrescente.

#8. Exibir os detalhes dos ingressos: ID do ingresso, data, hora, nome do filme e nome do espectador.
DESC INGRESSOS;
DESC ESPECTADORES;
DESC FILMES;
DESC SESSOES;
SELECT ING.ID_INGRESSO, ING.DATA_ING, ING.HORA_ING, FIL.NOME_FILME, ESP.NOME_ESPEC FROM INGRESSOS AS ING
JOIN ESPECTADORES AS ESP ON ESP.ID_ESPEC = ING.ESPECTADOR
JOIN SESSOES AS SS ON SS.ID_SESSAO = ING.SESSAO
JOIN FILMES AS FIL ON FIL.ID_FILME = SS.FILME;
#9. Mostrar os nomes e as idades dos espectadores que têm telefone cadastrado.
DESC ESPECTADORES;
SELECT NOME_ESPEC, TIMESTAMPDIFF(YEAR,DATA_NASC,CURDATE()) AS IDADE FROM ESPECTADORES
WHERE TEL_ESPEC IS NOT NULL OR ' ';
#10. Listar os nomes dos filmes que foram exibidos em mais de uma sessão.
DESC FILMES;
DESC SESSOES;
SELECT FIL.NOME_FILME, COUNT(SS.ID_SESSAO) AS CONTAGEM
FROM FILMES AS FIL
JOIN SESSOES AS SS ON SS.FILME = FIL.ID_FILME
GROUP BY FIL.NOME_FILME
HAVING CONTAGEM > 1;
#11. Para cada sala de cinema, mostrar o nome da sala e a quantidade total de ingressos vendidos.
DESC SALAS;
DESC INGRESSOS;
DESC SESSOES;
SELECT SAL.NOME, COUNT(ING.ID_INGRESSO) AS QUANTIDADE FROM SALAS AS SAL
RIGHT JOIN SESSOES AS SS ON SS.SALA = SAL.ID_SALA
LEFT JOIN INGRESSOS AS ING ON ING.SESSAO = SS.ID_SESSAO
GROUP BY SAL.NOME;
#12. Contar quantos espectadores têm um e-mail cadastrado.
DESC ESPECTADORES;
SELECT COUNT(EMAIL_ESPEC) AS CADASTRADOS FROM ESPECTADORES;
#OU
SELECT COUNT(ID_ESPEC) AS CADASTRADOS FROM ESPECTADORES
WHERE EMAIL_ESPEC IS NOT NULL OR ' ';
#13. Listar os nomes dos filmes que foram exibidos em sessões agendadas para o dia de hoje.
SELECT FIL.NOME_FILME
FROM FILMES AS FIL
JOIN SESSOES AS SS ON SS.FILME = FIL.ID_FILME
JOIN INGRESSOS AS ING ON ING.SESSAO = SS.ID_SESSAO
WHERE ING.DATA_ING = CURDATE();
#14. Exibir os detalhes das sessões que exibiram filmes com tempo de exibição inferior a 90 minutos.
DESC FILMES;
DESC SESSOES;
DESC INGRESSOS;
SELECT SS.ID_SESSAO, SS.FILME, SS.SALA FROM SESSOES AS SS
JOIN FILMES AS FIL ON FIL.ID_FILME = SS.FILME
WHERE FIL.TEMPO_FILME < 90;
#15. Mostrar o nome do filme e a data da sessão para todas as sessões agendadas para o próximo sábado.
DESC SESSOES;
DESC INGRESSOS;
DESC FILMES;
SELECT FIL.NOME_FILME, ING.DATA_ING FROM INGRESSOS AS ING
JOIN SESSOES AS SS ON SS.ID_SESSAO = ING.SESSAO
JOIN FILMES AS FIL ON FIL.ID_FILME = SS.FILME
WHERE DAYOFWEEK(ING.DATA_ING) = 7 AND ING.DATA_ING < CURDATE() + 7;