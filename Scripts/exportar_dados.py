import pandas as pd
import sqlite3 as sql
import os


def exportar_tabelas(conn):

    os.makedirs("data", exist_ok=True)

    tabelas = [
        'empresas',
        'vagas',
        'aplicacoes'
    ]

    for tabela in tabelas:

        consulta = f"""
        SELECT *
        FROM {tabela}
        """

        df = pd.read_sql_query(
            consulta,
            conn
        )

        caminho_saida = f"data/{tabela}.csv"

        df.to_csv(
            caminho_saida,
            index=False,
            encoding='utf-8-sig'
        )

        print(f"{tabela}.csv exportado com sucesso!")


def main():

    conn = None

    try:
        conn = sql.connect(
            "database/carreira.db"
        )

        exportar_tabelas(conn)

        print("\nExportação finalizada!")

    except Exception as erro:
        print(f"Erro encontrado: {erro}")

    finally:
        if conn:
            conn.close()


if __name__ == "__main__":
    main()