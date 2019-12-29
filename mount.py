#!/usr/bin/env python
from pathlib import Path
import shutil
import os

wut = __file__
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

        # WhyTF target.exists() doesn't report symlinks?
        if target.exists() or target.is_symlink():
            if not target.is_symlink():
                backup.parent.mkdir(parents=True, exist_ok=True)
                shutil.move(target, backup)
            else:
                # it's just a symlink
                print(f"removing {target}")
                os.remove(target)
        else:
            target.parent.mkdir(parents=True, exist_ok=True)


        os.symlink(source, target)
