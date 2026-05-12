## Projeto de Organização aplicação de vagas

# Motivação:
Esse projeto surgiu devido a crescente número de pessoas não conseguirem acompanhar o processo de aplicação de vagas de emprego, não tendo mapeado as estratégias que funcionaram ou não durante esse processo. 

# Objetivo:
Desenvolver um sistema analítico para acompanhar minhas aplicações, medir taxa de conversão por etapa, identificar padrões de avanço e ajustar minha estratégia com base em dados.” 

# Fluxo: (SQL -> Python -> Power BI)
Inicialmente será elaborada três tabela denominadas: empresas; vagas; aplicação
Empresas terá as seguintes colunas: id; nome; setor; valores; etapas.
vagas terá as seguntes colunas: id; empresas_id; vaga; hardskills
aplicação terá as seguntes colunas: id; vaga_id; data_aplicacao; etapa; estrategia; observacoes; status
Realizar as consultas utilizando SQL
Automatizar o processo de inserção de novas vagas
Apresentar esses dados utilizando o power BI

# Metodologia 
* 1º criar tabela (verificar relação entre as tabelas criadas )
* 2º inserir dados, atualização e consultas
* 3º consultas analiticas com SQL
* 4º aprensetar dashboards
* 5º registrar insights do processo