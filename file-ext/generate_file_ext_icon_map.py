#!/usr/bin/env python
import json
from pathlib import Path


def generate_map():
    map = {
        "png": set(),
        "svg": set(),
    }
    for ext in ["png", "svg"]:
        for file in Path().rglob("*."+ext):
            file_name = file.stem
            map[ext].add("."+file_name)
            count = len(map['png']) + len(map['svg'])
            print(f"[{count}][{ext}] {file_name:<5}")

    map["png"] = sorted(list(map["png"]))
    map["svg"] = sorted(list(map["svg"]))
    json.dump(map, open("file_ext_icon_map.json", "w"), indent=2)


def main():
    print("generating file ext icon map...")
    generate_map()


if __name__ == "__main__":
    main()
