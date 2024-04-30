USE 	bdex2_passagens_aereas;

INSERT INTO `bdex2_passagens_aereas`.`passageiros`
(`COD_PASSAGEIRO`,
`NOME`,
`SOBRENOME`,
`DATA_NASC`,
`NACIONALIDADE`)
VALUES
(2024558967, 'Roberto Carlos', 'da Silva Pereira', '1987-03-27', 'Brasileiro');


INSERT INTO `bdex2_passagens_aereas`.`aeroportos`
(`ID_AEROPORTO`,
`NOME`,
`CIDADE`,
`ESTADO`,
`PAIS`,
`LATITUDE`,
`LONGITUDE`,
`TAMANHO_PISTA`)
VALUES
(123789583, 'Aeroporto de Guarulhos', 'Guarulhos', 'São Paulo', 'Brasil', '46° 28 10', '23° 25 55', 750);

INSERT INTO `bdex2_passagens_aereas`.`aeroportos`
(`ID_AEROPORTO`,
`NOME`,
`CIDADE`,
`ESTADO`,
`PAIS`,
`LATITUDE`,
`LONGITUDE`,
`TAMANHO_PISTA`)
VALUES
(123765642, 'Aeroporto Internacional Afonso Pena', 'Curitiba', 'Paraná', 'Brasil', '49° 10 34 O', '25° 31 54 S', 911);


INSERT INTO `bdex2_passagens_aereas`.`cia_aereas`
(`ID_CIA`,
`CNPJ`,
`NOME_FANTASIA`)
VALUES
(22045869, '07.575.651/0001-59', 'GOL LINHAS AEREAS S.A.');

INSERT INTO `bdex2_passagens_aereas`.`reservas`
(`ID_RESERVA`,
`DATA_RESERVA`,
`FORMA_PGTO`,
`VALOR_RESERVA`)
VALUES
(558862, '2023-12-24', 'CREDITO', 1198.99);

INSERT INTO `bdex2_passagens_aereas`.`aeronaves`
(`PFX_AERO`,
`MODELO`,
`ANO_FABR`,
`FABRICANTE`,
`POLTRONAS`,
`CIA_AEREA`)
VALUES
('PR-GUO', 'Boeing 737 MAX 9', 2020, 'Boeing', 138, 22045869);

INSERT INTO `bdex2_passagens_aereas`.`voos`
(`ID_VOO`,
`ASSENTO`,
`AERO_PART`,
`DATA_PART`,
`HORA_PART`,
`AERO_CHEG`,
`DATA_CHEG`,
`HORA_CHEG`,
`AERONAVE`,
`CIA_AEREA`)
VALUES
(552, '77B', 123789583, '2024-02-23', '11:30:00', '123765642', '2024-02-23', '15:45:00', 'PR-GUO', 22045869);

INSERT INTO `bdex2_passagens_aereas`.`voos_reservas`
(`ID_VOO`,
`ASSENTO`,
`ID_RESERVA`)
VALUES
(552, '77B', 558862);

INSERT INTO `bdex2_passagens_aereas`.`passageiros_reservas`
(`PASSAGEIRO`,
`ID_RESERVA`)
VALUES
(2024558967, 558862);








