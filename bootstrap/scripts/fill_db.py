import sys

import pandas as pd 
from sqlalchemy import create_engine

if __name__ == "__main__":

    # Quick approach with sys instead of argparse
    engine = create_engine(sys.argv[1])

    # Export to table
    pd.read_csv("data/Cars93.csv").to_sql('cars', con=engine, index=False)
