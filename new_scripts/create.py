import os
import sys
import shutil

if len(sys.argv) < 2:
    print("no argument")
    exit(1)

appname = sys.argv[1]

# create.py の場所 → new_scripts/
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))

# spike-rt/
BASE_DIR = os.path.dirname(SCRIPT_DIR)

# workspace/template/
TEMPLATE_DIR = os.path.join(BASE_DIR, "workspace", "template")

# workspace/appname/
OUTPUT_DIR = os.path.join(BASE_DIR, "workspace", appname)

# 出力先作成
os.makedirs(OUTPUT_DIR, exist_ok=True)

# 拡張子リスト
extenders = ['h', 'c', 'cdl', 'cfg']

# 各ファイル生成
for extender in extenders:
    src = os.path.join(TEMPLATE_DIR, f"template.{extender}")
    dst = os.path.join(OUTPUT_DIR, f"{appname}.{extender}")

    with open(src, "r", encoding="utf-8") as f:
        s = f.read().replace("template.h", f"{appname}.h")

    with open(dst, "w", encoding="utf-8") as f:
        f.write(s)

# Makefile.inc のコピー
src = os.path.join(TEMPLATE_DIR, "Makefile.inc")
dst = os.path.join(OUTPUT_DIR, "Makefile.inc")
shutil.copy(src, dst)
