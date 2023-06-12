--8
select * from cliente
inner join endereço on endereço.id = cliente.endereço
inner join cidade on cidade.id = endereço.cidade and cidade.nome = 'TUBARÃO';

--9
select venda.id, cliente.nome from venda 
inner join cliente on cliente.id = venda.cliente and cliente.nome = 'LUCAS DUARTE';

--10
select * from produto 
right join categoria_produto cp on cp.id = produto.categoria
order by produto.nome;

--11

--clientes por sexo
select cliente.nome from cliente
inner join sexo on sexo.id = cliente.sexo and sexo.descricao = 'MASCULINO';

--clientes por estado
select cliente.nome, cidade.uf from cliente
inner join endereço on endereço.id = cliente.endereço 
inner join cidade on cidade.id = endereço.cidade

--vendas entre 12/2022 e 01/2023
select venda.id, venda.data_venda, cliente.nome from venda
inner join cliente on cliente.id = venda.cliente 
where venda.data_venda between '2022-12-01' and '2023-01-31'
order by venda.data_venda;

--venda por categoria
select count(*) as vendas, categoria_produto.descricao from venda
inner join venda_produto on venda_produto.venda = venda.id 
inner join produto on produto.id = venda_produto.produto 
inner join categoria_produto on categoria_produto.id = produto.categoria
group by categoria_produto.descricao ;

--produtos mais vendido
select produto.nome, count(*) as vendas from produto
inner join venda_produto on venda_produto.produto = produto.id 
inner join venda on venda_produto.venda = venda.id 
group by produto.nome
order by vendas desc;

--estados com mais pedidos
select count(*) as vendas, cidade.uf from venda
inner join cliente on cliente.id = venda.cliente 
inner join endereço on endereço.id = cliente.endereço 
inner join cidade on cidade.id = endereço.cidade 
group by cidade.uf
order by vendas desc;


