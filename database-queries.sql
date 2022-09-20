-- Quais os pedidos registrados e qual domicilio do cliente?
select p.*, concat('CEP: ', c.cep, ' - ', c.logradouro, ', ', c.numero, ', ', c.bairro, ', ', c.municipio, '-', c.uf) as endereco
	from pedido as p inner join cliente as c using(id_cliente);

-- Quais os pedidos registrados para o cliente 1?
select p.*, concat('CEP: ', c.cep, ' - ', c.logradouro, ', ', c.numero, ', ', c.bairro, ', ', c.municipio, '-', c.uf) as endereco
	from pedido as p inner join cliente as c using(id_cliente)
    where id_cliente = 1;

-- Quantos pedidos foram feitos por cada cliente?    
select id_cliente, count(*) as quantidade_de_pedidos from pedido group by id_cliente;

-- Algum vendedor também é fornecedor? Quantos?
select count(*) from terceiro_vendedor inner join fornecedor using (cnpj);

-- Relação de produtos fornecedores e estoques;
select * from (select * from produto
	inner join fornecedor_produto using (id_produto)
    inner join fornecedor using (id_fornecedor)) as forn_prod
inner join
(select * from produto
	inner join produto_no_estoque using (id_produto)
    inner join estoque using (id_estoque)) as prod_est
on forn_prod.id_produto = prod_est.id_produto;

-- Relação de nomes dos fornecedores e nomes dos produtos;

select * from produto
	inner join fornecedor_produto using (id_produto)
    inner join fornecedor using (id_fornecedor);
    
select descricao, categoria, valor, quantidade, razao_social, cnpj from produto p
	inner join fornecedor_produto fp using (id_produto)
    inner join fornecedor f using (id_fornecedor)
    order by valor;

-- Relação dos produtos e suas respectivas quantidades
select id_produto, descricao, categoria, valor, cast(concat_ws('', fp.quantidade, pe.quantidade, pv.quantidade) as signed) as quantidade from produto p
	left join fornecedor_produto fp using (id_produto)
    left join produto_no_estoque pe using (id_produto)
    left join produto_vendedor pv using (id_produto)
    order by quantidade;
    
-- Relação da quantidade de produtos por categoria
select id_produto, categoria, valor, sum(cast(concat_ws('', fp.quantidade, pe.quantidade, pv.quantidade) as signed)) as quantidade from produto p
	left join fornecedor_produto fp using (id_produto)
    left join produto_no_estoque pe using (id_produto)
    left join produto_vendedor pv using (id_produto)
    group by categoria;