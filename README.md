# Análise de Transição de Carreira 

Projeto desenvolvido para analisar padrões de avanço em processos seletivos, identificar gargalos nas etapas de candidatura e compreender quais estratégias aumentam as chances de progressão.
O sistema foi desenvolvido utilizando SQL, Python e Power BI para estruturar um pipeline analítico orientado por dados durante o processo de transição de carreira para a área de tecnologia e dados.

## Objetivo:

Criar um sistema capaz de: 
* analisar evolução dos processos seletivos 
* identificar gargalos por etapa 
* Identificar padrões de aprovação e reprovação
* Mapear habilidades técnicas mais exigidas pelas vagas
* Gerar insights para orientar estudos e estratégias de aplicação


## Dashboard

<p align="center">
  <img src="\dashboard\visual_aplicacoes.jpg" width="900">
</p>

* Quantas aplicações foram realizadas ao longo do tempo 
* Em quais etapas ocorre maior concentração de reprovações 
* Como evolui a taxa de avanço nos processos seletivos 
* Quais estratégias parecem estar associadas ao avanço 
* Quais empresas e vagas apresentam melhor aderência 

## Hipótese Analítica

### Pergunta principal do projeto:

O que aumenta minhas chances de avançar nos processos seletivos?

### Subperguntas:

* Em qual etapa ficou travado?
* Quais estratégias funcionam melhor?
* Existe padrão entre empresas e vagas?
* Como evoluir meu pipeline de aplicações?

## Principais Insights
A análise inicial revelou alguns padrões importantes:

* A maior parte das reprovações ocorre nas etapas iniciais dos processos seletivos, especialmente inscrição e testes.
* Isso levantou a hipótese de baixa aderência entre currículo e sistemas ATS ou desalinhamento entre requisitos das vagas e perfil apresentado.
* O projeto também mostrou a importância da padronização das etapas seletivas para permitir comparações consistentes, além de separar as hardskills ao invés de armazenar em texto corrido.

## Estrutura do Banco Relacional

### Explicação da modelagem.

### Tabela empresas

| id | nome | setor | valores |
| -- | ---- | ----- | ------- |

### Tabela vagas

| id | empresas_id | vaga | hardskills |
| -- | ----------- | ---- | ---------- |

### Tabela aplicações

| id | vagas_id | data_aplicacao | etapa | estrategias | observacoes | status |
| -- | -------- | -------------- | ----- | ----------- | ----------- | ------ |


Relacionamento entre tabelas

<p align="center">
  <img src="\dashboard\esquema_relacional.jpg" width="900">
</p>

## Competências técnicas aplicadas
Durante o desenvolvimento do projeto foram aplicados conhecimentos em:
* SQL / SQLite
* Modelagem Relacional
* Python
* Pandas
* Power BI
* DAX
* Engenharia e Tratamento de Dados

## Metodologia
Inicialmente considerei armazenar todas as informações em uma única tabela. Entretanto, percebi que isso geraria repetição excessiva de dados, especialmente na relação entre empresas, vagas e aplicações. 

* 1º. Modelagem do banco: 
Nessa parte precisei analisar a relação que as tabelas iriam ter entre si, além de ter uma visão futura de como acessá-las. Colocando a primeira ideia de tabela única, pois repetiria muitas vezes a empresa em vagas diferentes e aplicações feitas, o que tornaria o banco de dados menos eficiente

* 2º. Inserção e padronização: 
No processo de inserção de dados percebi que a escolha de fazer tudo no SQL demandaria um tempo maior do que utilizar planilhas, além de perceber a necessidade de padronizar dados, como as etapas que tinha nomes diferentes, mas eram a mesma atividade, como fit cultural, fator H entre outros.

* 3º. Criação de views: 
Essa foi uma ferramenta nova que ainda não tinha explorado, mas facilita muito na replicabilidade do programa, fornecendo as consultas que acredito ser mais relevantes na análise.

* 4º. Consultas analíticas: 
Utilizei todos os conhecimentos adquiridos nos jogos SQL island, Murder Mystery, Noir, e o curso W3school, para fazer consultas, filtrar dados, buscando sempre responder as perguntas teses.

* 5º. Exportação dos dados: 
Inicialmente busquei integrar diretamente o banco SQLite ao Power BI via ODBC. Entretanto, limitações na configuração do ambiente levaram à adoção de uma estratégia alternativa utilizando Python e Pandas para exportação automatizada dos dados.

* 6º. Construção do dashboard: 
Na construção do dashboard utilizei os conhecimentos aprendidos no curso da DSA, valorizando as informações que foram mais importantes na análise da aplicações. 


## Principais aprendizados

Durante o desenvolvimento, alguns aprendizados importantes surgiram:
* A importância de modelar os dados pensando nas perguntas futuras que precisarão ser respondidas
* Nem toda informação deve ser armazenada como texto corrido, especialmente quando há necessidade de agrupamento e análise
* A padronização dos dados impacta diretamente a qualidade dos insights
* Em alguns cenários, combinar planilhas e banco de dados pode ser mais eficiente do que centralizar tudo em SQL

## Evoluções Futuras
### Curto prazo
* Padronização das hard skills 
* Estruturação das etapas em níveis ordenados 
* Refinamento das estratégias de candidatura 

### Médio prazo
* Automatização da entrada de dados 
* Integração com planilhas externas 
* Comparação entre tipos de vagas 

### Longo prazo
* Sistema preditivo de aderência às vagas  
* Recomendação de estratégias por empresa 
* Automação parcial do pipeline de candidatura 


## Tecnologias utilizadas:


* [Python](https://www.python.org/): linguagem de programação
* [Pandas](https://pandas.pydata.org/docs/): exportar dados para analise em Power BI
* [SQLite](https://sqlite.org/): consultar banco de dados
*[PowerBI](https://www.microsoft.com/pt-br/power-platform/products/power-bi/desktop): Apresentação de Dashboard com indicadores
 
## Como executar:


### **1. Instale `Python` na sua máquina, por meio [deste link](https://www.python.org/)**


### **2. Faça um clone [desse repositório](https://github.com/Luizcomzz/Analise_transicao_carreira.git) na sua máquina:**


* Crie uma pasta no seu computador para esse programa, recomendo colocar o nome **Analise_transicao_carreira**
* Abra o `git bash` ou `terminal` dentro dessa pasta
* Copie a [URL]https://github.com/Luizcomzz/Analise_transicao_carreira.git) do repositório
* Digite `git clone <URL copiada>` e pressione `enter`


### **3. Importe as bibliotecas necessárias pelo terminal, dentro dessa pasta criada:**


* Pandas: `pip install pandas`
* SQLite3: `import sqlite3 as sql`
* Os: `pip install os-sys`
