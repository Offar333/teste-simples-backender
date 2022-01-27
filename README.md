# Teste Técnico | MiniHomebroker


* **Nome do Projeto**: MiniHomebroker
* **Autor**: Rafael Vilas Boas de Carvalho
* **Objetivo**: Construir uma API estilo Homebroker usando a linguagem, framework e banco de dados que se sentir mais confortável. A API deve realizar compra, venda e pesquisa de ativos além de listar as ordens de compra/venda com saldo + data. 

* **Tecnologias utilizadas**:
  * AWS EC2: Criação de uma máquina virtual linux para deploy da aplicação;
  * AWS RDS: Banco de dados MySql em nuvem;
  * Linux/UNIX;
  * Elixir + Erlang + Phoenyx framework

**Requisitos:**
- [x] Backend
- [ ] Frontend

***Bônus***:
- Separação de ambientes:
  - [x] AWS EC2: Possui somente a aplicação e seus componentes instalados
  - [x] AWS RDS: Banco de dados em nuvem conectado com a aplicação 


----

### Iniciando o servidor
#### Com todo o ambiente preparado (Elixir + MySQL), faça:
  * 1. Clone o diretório
  * 2. Configura "username" e "password" do banco no arquivo mini_homebroker/config/dev.exs
  * 3. Na raiz do projeto, execute `mix deps.get` para instalar todas as dependências
  * 4. Crie e migre o banco de dados com `mix ecto.setup` (na raiz do projeto)
  * 5. Execute o comando `mix phx.server` para executar o servidor

Se tudo estiver corretamente configurado, o servidor estará pronto para uso.

----

## Deploy

O deploy da aplicação foi realizado utilizando um Servidor Virtual em Nuvem (EC2) da Amazon (Amazon Linux), onde foi configurado todo o ambiente para que a aplicação fique disponível.

---

## Endpoints
#### Consumindo endpoints públicos:

* Retornar todas os ativos registrados no banco:

Request - GET: [http://54.207.241.41:4000/api/ativos](http://54.207.241.41:4000/api/ativos)

Response: 
```json
{
	"data": [
		{
			"codigo": "BBAS3",
			"preco": "31.82"
		},
		{
			"codigo": "EMBR3",
			"preco": "19.21"
		},
		{
			"codigo": "ITUB4",
			"preco": "29.81"
		},
		{
			"codigo": "VALE3",
			"preco": "114.62"
		}
	]
}
```
------------
 * Retornar um ativo específico por ID:

Request - GET: [http://54.207.241.41:4000/api/ativos/idDoAtivo](http://54.207.241.41:4000/api/ativos/BBAS3)

Response:
```json
[
	{
		"codigo": "BBAS3",
		"preco": "31.82"
	}
]
```
------------
  * Cadastrar uma nova ordem no banco:

    

Request - POST: [http://54.207.241.41:4000/api/ordens](http://54.207.241.41:4000/api/ordens) 
```json
{
	"ordem": {
	"codigo_ativo":"EMBR3",
	"quantidade":100,
		"tipo": 1,
		"valor":1921
	}
}
```
Obs.: "codigo_ativo" deve exisitir na tabela ativos. "tipo": 1 - Compra, 2 - Venda

------------
 * Retornar uma ordem específica por ID do ativo:

Request - GET: [http://54.207.241.41:4000/api/ordens/list/idDoAtivo](http://54.207.241.41:4000/api/ordens/list/EMBR3)

Response:
```json
{
	"operacoes": [
		{
			"data": "2022-01-27T17:44:26",
			"tipo": 1,
			"valor": "1921.00"
		}
	],
	"saldo": 1921.0
}
```
