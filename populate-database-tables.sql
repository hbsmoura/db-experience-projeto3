USE `dio-commerce`;

-- Popular tabela estoque

INSERT INTO estoque VALUES (null, 'BA', 'Itabuna', default);
INSERT INTO estoque VALUES (null, 'MG', 'Araxá', default);
INSERT INTO estoque VALUES (null, 'BA', 'Salvador', 2);
INSERT INTO estoque VALUES (null, 'SP', 'Osasco', default);
INSERT INTO estoque VALUES (null, 'MA', 'São Luís', default);
INSERT INTO estoque VALUES (null, 'SP', 'São Paulo', 1);
INSERT INTO estoque VALUES (null, 'SP', 'São Paulo', 2);
INSERT INTO estoque VALUES (null, 'SP', 'São Paulo', 3);
INSERT INTO estoque VALUES (null, 'PA', 'Belém', default);
INSERT INTO estoque VALUES (null, 'SE', 'Aracaju', default);

-- Popular tabela fornecedor

INSERT INTO fornecedor VALUES (null, 'Central Eletrônicos', '40815718000150');
INSERT INTO fornecedor VALUES (null, 'Girassol Toys', '22816843000101');
INSERT INTO fornecedor VALUES (null, 'Trevo Modas', '66356041000123');
INSERT INTO fornecedor VALUES (null, 'Friday Modas', '86017562000163');
INSERT INTO fornecedor VALUES (null, 'Livraria Bandeira', '53087698000190');
INSERT INTO fornecedor VALUES (null, 'Drift Sports', '33961214000183');
INSERT INTO fornecedor VALUES (null, 'Ferramentas Vitória', '78859681000135');
INSERT INTO fornecedor VALUES (null, 'Caçador Games', '49774065000183');
INSERT INTO fornecedor VALUES (null, 'Leão e Família', '00552440000151');
INSERT INTO fornecedor VALUES (null, 'Livraria Dom Quixote', '50316444000109');

-- Popular tabela terceiro vendedor

INSERT INTO terceiro_vendedor VALUES (null, 'B2C Speed', '77086927000110', 'Rua do Canal, 865, Bairro Arlindo Villaschi, Viana-ES');
INSERT INTO terceiro_vendedor VALUES (null, 'Casa das ferragens', '16626207000106', 'Rua Pedro Stefan, 969, Núcleo Industrial, Campo Grande-MS');
INSERT INTO terceiro_vendedor VALUES (null, 'Lolas', '85606727000170', 'Rua Teixeirópolis, 83, Coqueiral, Ariquemes-RO');
INSERT INTO terceiro_vendedor VALUES (null, 'Tem de tudo na internet', '78205044000145', 'Av. Pereira de Abreu, 125, Nova Brasília, Santana-AP');
INSERT INTO terceiro_vendedor VALUES (null, 'Rainha dos importados', '25282358000185', 'Vila Olindina, 503, Bairro Nazaré, Belém-PA');

-- Popular tabela produto

INSERT INTO produto VALUES (null, 'Brinquedos', 'Bicicleta BMX 8 marchas', 1249.90);
INSERT INTO produto VALUES (null, 'Calcados', 'Sandália Glenda 36', 89.99);
INSERT INTO produto VALUES (null, 'Eletronicos', 'Webcam Ashu H800 1080P', 189.99);
INSERT INTO produto VALUES (null, 'Eletronicos', 'Mouse óptico sem fio ZSL', 34.90);
INSERT INTO produto VALUES (null, 'Esportes', 'Bola de Vôlei Tandara', 54.56);
INSERT INTO produto VALUES (null, 'Ferramentas', 'Macaco hidráulico Monster', 637.80);
INSERT INTO produto VALUES (null, 'Games', 'Donkey Kong', 12.20);
INSERT INTO produto VALUES (null, 'Livros', 'Nos braços da poesia', 34.90);
INSERT INTO produto VALUES (null, 'Brinquedos', 'Boneco do fofão', 849.99);
INSERT INTO produto VALUES (null, 'Vestuario', 'Camiseta Rick and Morty', 89.90);
INSERT INTO produto VALUES (null, 'Esportes', 'Par de Rackets Slim', 239.90);
INSERT INTO produto VALUES (null, 'Ferramentas', 'Alicate universal', 48.5);
INSERT INTO produto VALUES (null, 'Games', 'Down Hill', 122.0);
INSERT INTO produto VALUES (null, 'Livros', 'O paradoxo das redes', 44.9);
INSERT INTO produto VALUES (null, 'Vestuário', 'Calça pantalona', 76.9);

-- Popular tabela cliente

INSERT INTO cliente VALUES (null, 'pf', '40335050', 'Avenida Benedito', 825, null, 'Pero Vaz', 'Salvador', 'BA');
INSERT INTO cliente VALUES (null, 'pj', '59616691', 'Rua Sebastião Sales de Oliveira', 284, '1º Andar', 'Santa Delmira', 'Mossoró', 'RN');
INSERT INTO cliente VALUES (null, 'pf', '69097782', 'Travessa Itiuba', 72, null, 'Cidade Nova', 'Manaus', 'AM');
INSERT INTO cliente VALUES (null, 'pj', '03656020', 'Rua Eunice Oliveira', 8, null, 'Vila Ré', 'São Paulo', 'SP');
INSERT INTO cliente VALUES (null, 'pf', '59073126', 'Travessa Anápolis', 676, null, 'Planalto', 'Natal', 'RN');
INSERT INTO cliente VALUES (null, 'pf', '24801084', 'Rua 15', 825, 'Quadra C', 'Condomínio Garden', 'Vitória', 'ES');
INSERT INTO cliente VALUES (null, 'pj', '74660010', 'Rua Antônio Cupertino Barros', 413, null, 'Setor Criméria Leste', 'Goiânia', 'GO');
INSERT INTO cliente VALUES (null, 'pj', '40368085', 'Avenida Furtado', 480, '4º Andar', 'Liberdade', 'Salvador', 'BA');
INSERT INTO cliente VALUES (null, 'pf', '59115558', 'Rua Umarizal', 5, null, 'Nossa Senhora da Apresentação', 'Natal', 'RN');
INSERT INTO cliente VALUES (null, 'pj', '80410260', 'Rua do Comércio 24 Horas', 934, null, 'Centro', 'Curitiba', 'PR');

-- Popular tabela de cliente pessoa jurídica

INSERT INTO cliente_pf VALUES ('Julio Bernardo Felipe Moraes', '81366016076', 1);
INSERT INTO cliente_pf VALUES ('Joana Marlene Oliveira', '05193073050', 3);
INSERT INTO cliente_pf VALUES ('Bruna Nicole Aparício', '86755050512', 5);
INSERT INTO cliente_pf VALUES ('Murilo Martin Caio Moura', '80114545871', 6);
INSERT INTO cliente_pf VALUES ('Filipe Diogo Cláudio da Silva', '46704255877', 9);

-- Popular tabela de cliente pessoa jurídica

INSERT INTO cliente_pj VALUES ('Interativo Fontes', '33595202000182', 2);
INSERT INTO cliente_pj VALUES ('Reino Animal', '91252202000186', 4);
INSERT INTO cliente_pj VALUES ('Mundo Carinho', '27958336000118', 7);
INSERT INTO cliente_pj VALUES ('Líder Contabilidade', '28591528000100', 8);
INSERT INTO cliente_pj VALUES ('Santana Variedades', '11759449000154', 10);

-- Popular tabela forma de pagamento salva

INSERT INTO forma_pagamento_salva VALUES (null, 1, 'TRANSFERENCIA_BANCARIA');
INSERT INTO forma_pagamento_salva VALUES (null, 1, 'CARTAO_CREDITO');
INSERT INTO forma_pagamento_salva VALUES (null, 4, 'TRANSFERENCIA_BANCARIA');
INSERT INTO forma_pagamento_salva VALUES (null, 4, 'CARTAO_CREDITO');
INSERT INTO forma_pagamento_salva VALUES (null, 5, 'TRANSFERENCIA_BANCARIA');
INSERT INTO forma_pagamento_salva VALUES (null, 5, 'CARTAO_CREDITO');
INSERT INTO forma_pagamento_salva VALUES (null, 10, 'TRANSFERENCIA_BANCARIA');
INSERT INTO forma_pagamento_salva VALUES (null, 10, 'CARTAO_CREDITO');

-- Popular tabela de transferência bancária

INSERT INTO transferencia_bancaria VALUES (341, '8724', '24588-4', 1);
INSERT INTO transferencia_bancaria VALUES (33, '3906', '43431913-6', 3);
INSERT INTO transferencia_bancaria VALUES (1, '2270', '1286583-4', 5);
INSERT INTO transferencia_bancaria VALUES (237, '0123', '0090913-0', 7);

-- Popular tabela de catão de crédito

INSERT INTO cartao_credito VALUES ('5102 2895 4473 6155', '2024-02-20', 2);
INSERT INTO cartao_credito VALUES ('3785 086529 90801', '2023-07-15', 4);
INSERT INTO cartao_credito VALUES ('6011 4060 8167 3249', '2024-08-25', 6);
INSERT INTO cartao_credito VALUES ('5385 9052 1870 2359', '2026-04-20', 8);

-- Popular tabela de pedido

INSERT INTO pedido VALUES (null, 'RECEBIDO', 'Descrição 1', 'QL509318228BR', 1);
INSERT INTO pedido VALUES (null, 'PAGAMENTO_APROVADO', 'Descrição 2', 'QL582447359BR', 2);
INSERT INTO pedido VALUES (null, 'PAGAMENTO_REPROVADO', 'Descrição 3', 'QL996823471BR', 3);
INSERT INTO pedido VALUES (null, 'PROCESSADO', 'Descrição 4', 'QL128749284BR', 4);
INSERT INTO pedido VALUES (null, 'EXPEDIDO', 'Descrição 5', 'QL489221544BR', 5);
INSERT INTO pedido VALUES (null, 'ENTREGUE', 'Descrição 6', 'QL182287823BR', 6);
INSERT INTO pedido VALUES (null, 'RECEBIDO', 'Descrição 7', 'QL875621455BR', 1);

-- Popular tabela pagamento

INSERT INTO pagamento VALUES (1, 0, 1, null, 'AGUARDANDO_PAGAMENTO', 1);
INSERT INTO pagamento VALUES (2, 0, 3, null, 'PROCESSANDO', 2);
INSERT INTO pagamento VALUES (3, 0, 1, null, 'PAGO', 3);
INSERT INTO pagamento VALUES (4, 0, 1, null, 'CANCELADO', 4);
INSERT INTO pagamento VALUES (5, 0, 1, null, 'VENCIDO', 5);
INSERT INTO pagamento VALUES (6, 0, 12, null, default, 6);
INSERT INTO pagamento VALUES (7, 0, 1, '1231651616518115181651869348131688168', default, null);

-- Popular tabela produto no estoque

INSERT INTO produto_no_estoque VALUES (1, 1, 4);
INSERT INTO produto_no_estoque VALUES (2, 2, 35);
INSERT INTO produto_no_estoque VALUES (3, 3, 12);
INSERT INTO produto_no_estoque VALUES (4, 4, 18);
INSERT INTO produto_no_estoque VALUES (5, 5, 20);

-- Popular tabela fornecedor_produto

INSERT INTO fornecedor_produto VALUES (7, 6, 8);
INSERT INTO fornecedor_produto VALUES (8, 7, 130);
INSERT INTO fornecedor_produto VALUES (5, 8, 25);
INSERT INTO fornecedor_produto VALUES (2, 9, 15);
INSERT INTO fornecedor_produto VALUES (3, 10, 8);

-- Popular tabela produto_vendedor

INSERT INTO produto_vendedor VALUES (11, 5, 23);
INSERT INTO produto_vendedor VALUES (12, 2, 7);
INSERT INTO produto_vendedor VALUES (13, 4, 80);
INSERT INTO produto_vendedor VALUES (14, 4, 20);
INSERT INTO produto_vendedor VALUES (15, 3, 15);

-- Popular tabela produto_no_pedido

INSERT INTO produto_no_pedido VALUES (1, 1, 1);
INSERT INTO produto_no_pedido VALUES (2, 2, 1);
INSERT INTO produto_no_pedido VALUES (15, 2, 1);
INSERT INTO produto_no_pedido VALUES (3, 3, 1);
INSERT INTO produto_no_pedido VALUES (4, 3, 1);
INSERT INTO produto_no_pedido VALUES (5, 4, 5);
INSERT INTO produto_no_pedido VALUES (6, 5, 1);
INSERT INTO produto_no_pedido VALUES (7, 6, 1);
INSERT INTO produto_no_pedido VALUES (13, 6, 1);
INSERT INTO produto_no_pedido VALUES (8, 7, 1);
INSERT INTO produto_no_pedido VALUES (14, 7, 3);

-- Procedimento para atualizar valores de pagamento de acordo com os valores e quantidades dos produtos nos pedidos     

DROP PROCEDURE IF EXISTS update_pagamento;

delimiter //
CREATE PROCEDURE update_pagamento (c int)
       BEGIN
			declare i int default 1;
			while i < c do
				with consulta1 as (
					select id_pedido, id_produto, descricao, valor, quantidade, round(valor * quantidade, 2) as total_produto
					from produto inner join produto_no_pedido using (id_produto)
				), consulta2 as (select id_pedido, round(sum(total_produto), 2) as total from consulta1 group by id_pedido)
                -- select * from consulta2 where id_pedido = i;
                update pagamento set valor = (select total from consulta2 where id_pedido = i) where id_pedido = i;
                set i = i + 1;
			end while;
       END//

delimiter ;

call update_pagamento(8);