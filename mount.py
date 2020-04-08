#!/usr/bin/env python3
from pathlib import Path
import shutil
import os

os.chdir(Path(__file__).parent)
CWD = Path(os.getcwd())
HOME = CWD / "HOME"
ROOT = CWD / "ROOT"

BACKUP = CWD / "BACKUP"

HOST_HOME = Path.home()
HOST_ROOT = Path("/")

def iter_files(root: Path):
    for path in root.rglob("*"):
        if path.is_file():
            yield path

def iter_files_relative_to(root: Path):
    for file in iter_files(root):
        yield file.relative_to(root)

if __name__ == '__main__':
    BACKUP.mkdir(parents=True, exist_ok=True)

    for file_path in iter_files_relative_to(HOME):
        source = HOME / file_path
        target = HOST_HOME / file_path
        backup = BACKUP / file_path

        # target.exists() doesn't report symlinks
        if target.exists() or target.is_symlink():
            if target.is_symlink():
                print(f"REMOVE {target}")
                os.remove(target)
            else:
                print(f"BACKUP {target} -> {backup}")
                backup.parent.mkdir(parents=True, exist_ok=True)
                shutil.move(target, backup)
        else:
            target.parent.mkdir(parents=True, exist_ok=True)


        print(f"LINK {source} -> {target}")
        os.symlink(source, target)
