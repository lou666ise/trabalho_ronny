INSERT INTO departamento (descricao, dh_registro)
VALUES ('femenino', NOW()),
       ('masculino', NOW()),
       ('kids', NOW());
      
       INSERT INTO marca (descricao, dh_registro)
VALUES ('dakota', NOW()),
       ('nike', NOW()),
       ('vans', NOW());
       
       INSERT INTO calcado_pai (descricao, referencia, dh_registro, departamento_id, marca_id, marca_dh_registro, ativo)
VALUES ('bota tal', 'Ref 001', NOW(), 1, 1, NOW(), 1),
       ('sapato tal', 'Ref 002', NOW(), 2, 2, NOW(), 1),
       ('tenis tal', 'Ref 003', NOW(), 3, 3, NOW(), 1);
       
INSERT INTO calcado_filho (descricao, codigo_barras, dh_atualizacao, calcado_pai_id)
VALUES ('bota(35)', 'CB001', NOW(), 1),
       ('bota(36)', 'CB002', NOW(), 1),
       ('bota(37)', 'CB003', NOW(), 1);
       
INSERT INTO calcado_filho (descricao, codigo_barras, dh_atualizacao, calcado_pai_id)
VALUES ('sapato(35)', '123', NOW(), 2),
       ('sapato(36)', '123', NOW(), 2),
       ('sapato(37)', '123', NOW(), 2);
       
INSERT INTO calcado_filho (descricao, codigo_barras, dh_atualizacao, calcado_pai_id)
VALUES ('tenis(35)', 'aaa', NOW(), 3),
       ('tenis(36)', 'aaa', NOW(), 3),
       ('tenis(37)', 'aaa', NOW(), 3);
       
       
INSERT INTO cor (id, descricao, dh_registro)
VALUES (1, 'Vermelho', NOW()),
       (2, 'Azul', NOW()),
       (3, 'Verde', NOW());
       
       INSERT INTO cor_produto (id, descricao, dh_registro,calcado_filho_id,id_cor)
VALUES (1, 'a', NOW(),1,1) ,
       (2, 'b', NOW(),2,2),
       (3, 'c', NOW(),3,3);
       
INSERT INTO grupo (id, descricao, dh_registro,departamento_id,calcado_pai_id,departamento_id_fk)   
  values(
  3, 'tenis',now(),3,3,3);
 
insert into informacoes(id,info,ativo,calcado_pai_id)
values(3,'info',true,3);

INSERT INTO loja (cnpj, descricao, nome_filial)
VALUES ('123456789', 'Loja A', 'Filial 1'),
       ('987654321', 'Loja B', 'Filial 2'),
       ('567890123', 'Loja C', 'Filial 3');

INSERT INTO armazem (id, dh_registro, descricao, loja_id)
VALUES (1, NOW(), 'Armazém A', 1),
       (2, NOW(), 'Armazém B', 2),
       (3, NOW(), 'Armazém C', 1);
       
INSERT INTO `produto armazem` (id, saldo, dh_atualizacao, calcado_filho_id, armazem_id)
VALUES (1, 100, NOW(), 1, 1),
       (2, 200, NOW(), 2, 2),
       (3, 150, NOW(), 3, 1);

INSERT INTO cor_produto (id, descricao, dh_registro,calcado_filho_id,id_cor)
VALUES (19, 'a', NOW(),7,2),
       (20, 'b', NOW(),8,2),
       (21, 'c', NOW(),9,2);
       
INSERT INTO cor_produto (id, descricao, dh_registro,calcado_filho_id,id_cor)
VALUES (22, 'a', NOW(),7,3),
       (23, 'b', NOW(),8,3),
       (24, 'c', NOW(),9,3);
       
INSERT INTO cor_produto (id, descricao, dh_registro,calcado_filho_id,id_cor)
VALUES (25, 'a', NOW(),7,1),
       (29, 'b', NOW(),8,1),
       (30, 'c', NOW(),9,1);

       