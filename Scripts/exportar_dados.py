import pandas as pd
import sqlite3 as sql
import os


def exportar_tabelas(conn):

    os.makedirs("data", exist_ok=True) # Caso não tenha a pasta com esse nome o programa cria 

    tabelas = [
        'empresas',
        'vagas',
        'aplicacoes'
    ]

    for tabela in tabelas: # Selecionar cada tabela para consulta e exportação 

        consulta = f"""  
        SELECT *
        FROM {tabela}
        """

        df = pd.read_sql_query(
            consulta,
            conn
        )

        caminho_saida = f"data/{tabela}.csv" # Define o local onde será armazenada essas informações

        df.to_csv(
            caminho_saida,
            index=False,
            encoding='utf-8-sig' #não ter problemas com ç ã e acentos do Brasil
        )

        print(f"{tabela}.csv exportado com sucesso!")


def main():

    conn = None

    try: # Caso não de pra fazer isso ele passa para a proxima função
        conn = sql.connect(
            "database/carreira.db"
        )

        exportar_tabelas(conn)

        print("\nExportação finalizada!")

    except Exception as erro: # Deixa evidente qual o erro esta acontecendo auxiliando o ajuste
        print(f"Erro encontrado: {erro}")

    finally: # Caso tudo der errado para que seu sistema nao trave, fechar o banco de dados e finalizar
        if conn:
            conn.close()


if __name__ == "__main__":
    main()