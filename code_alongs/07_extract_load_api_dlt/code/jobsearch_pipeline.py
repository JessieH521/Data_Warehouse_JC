# ETL（Extract, Transform, Load）pipeline, extract from JobTech API and load to Snowflake warehouse.

import dlt
import requests
import json
from pathlib import Path
import os

# get API data, return a Python dictionary after JSON parsing. 
# headers，告诉服务器客户端期望接收到的响应格式为JSON。raise：检查 HTTP 响应状态，如果状态码表示请求失败如 404，则会 抛出异常
def _get_ads(url_for_search, params):
    headers = {"accept": "application/json"}
    response = requests.get(url_for_search, headers=headers, params=params)
    response.raise_for_status()  # check for http errors
    return json.loads(response.content.decode("utf8"))

# Generating 生成 job data，
@dlt.resource(write_disposition="replace")     # 每次运行时覆盖表中的数据
def jobsearch_resource(params):

    url = "https://jobsearch.api.jobtechdev.se"
    url_for_search = f"{url}/search"

    for ad in _get_ads(url_for_search, params)["hits"]:
        yield ad
        # yield 逐条返回职位信息（流式处理数据）

# run pipeline, 创建 ETL 管道
def run_pipeline(query, table_name):
    pipeline = dlt.pipeline(
        pipeline_name="jobsearch",
        destination="snowflake",
        dataset_name="staging",      # 数据存入 staging（schema）
    )

    params = {"q": query, "limit": 100}

    # 从 API 获取职位数据, table_name=table_name → 存入 Snowflake 中的 data_field_job_ads 表.
    load_info = pipeline.run(jobsearch_resource(params=params), table_name=table_name)
    print(load_info)


if __name__ == "__main__":
    working_directory = Path(__file__).parent
    os.chdir(working_directory)
    # 将 当前工作目录 设置为 working_directory

    query = "data engineer"
    table_name = "data_field_job_ads"
    # 初始化了一个变量 table_name，并将字符串 "data_field_job_ads" 赋给它。这个变量表示在目标数据仓库中要存储数据的表名.

    run_pipeline(query, table_name)