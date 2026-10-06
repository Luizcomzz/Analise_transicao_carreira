import os
import sqlite3
import pandas as pd


# ================================================================
# Constantes
# ================================================================
DB_PATH    = "database/carreira.db"
OUTPUT_DIR = "data"
TABELAS    = ["empresas", "vagas", "aplicacoes"]


# ================================================================
# EXPORTAÇÃO
# ================================================================

def exportar_tabelas(caminho_banco: str, diretorio_saida: str) -> None:
    """
    Exporta todas as tabelas do banco SQLite para arquivos CSV individuais.
    Usa context manager para garantir fechamento seguro da conexão.

    Parâmetros:
        caminho_banco (str): Caminho para o arquivo .db do SQLite.
        diretorio_saida (str): Pasta onde os CSVs serão salvos.
    """
    os.makedirs(diretorio_saida, exist_ok=True)

    with sqlite3.connect(caminho_banco) as conn:
        for tabela in TABELAS:
            df = pd.read_sql_query(f"SELECT * FROM {tabela}", conn)

            caminho_saida = os.path.join(diretorio_saida, f"{tabela}.csv")

            df.to_csv(
                caminho_saida,
                index=False,
                encoding="utf-8-sig"   # evita problemas com acentos no Excel/Power BI
            )

            print(f"  [OK] {tabela}.csv exportado ({len(df)} registros)")


# ================================================================
# MAIN
# ================================================================

def main() -> None:
    """Orquestra a exportação do banco de dados para CSV."""
    print("Exportação iniciada.\n")

    try:
        if not os.path.exists(DB_PATH):
            raise FileNotFoundError(f"Banco não encontrado: {DB_PATH}")

        exportar_tabelas(DB_PATH, OUTPUT_DIR)
        print(f"\nExportação finalizada! Arquivos salvos em: {OUTPUT_DIR}/")

    except FileNotFoundError as e:
        print(f"\n[ERRO] {e}")
        print("Verifique se o banco carreira.db está na pasta database/")

    except Exception as e:
        print(f"\n[ERRO inesperado] {e}")


if __name__ == "__main__":
    main()