# connect to the warehouse, mart_job_listings 
import os
from dotenv import load_dotenv
from snowflake.connector import connect
import pandas as pd

# connect to the mark layer ,读取表中数据 from snowflake
def query_job_listings(query = 'select * from mart_job_listings'):
    load_dotenv()

    with connect(
        user=os.getenv("SNOWFLAKE_USER"),
        password=os.getenv("SNOWFLAKE_PASSWORD"),
        account=os.getenv("SNOWFLAKE_ACCOUNT"),
        warehouse=os.getenv("SNOWFLAKE_WAREHOUSE"),
        database=os.getenv("SNOWFLAKE_DATABASE"),
        schema=os.getenv("SNOWFLAKE_SCHEMA"),
        role=os.getenv("SNOWFLAKE_ROLE"),
    ) as conn:
        
        # Execute the query
        df = pd.read_sql(query, conn)
        return df




