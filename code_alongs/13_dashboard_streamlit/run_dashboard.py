import subprocess
from pathlib import Path

if __name__ == "__main__":
    dashboard_path = Path(__file__).parent / "dashboard.py"
    subprocess.run(f"streamlit run {dashboard_path}", shell=True)


# 这个文件的目的：是不需要用 streamlit run dashboard 来运行 pydashboard.py ， 直接run 这个现在的这个文档，就是直接在网页中跳出展示板。

















