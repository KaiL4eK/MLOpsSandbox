import argparse
import os
import shutil

from clearml import Task

import logging

logging.basicConfig(
    level=logging.INFO, format="%(asctime)s - %(name)s - %(levelname)s - %(message)s"
)
logger = logging.getLogger(__name__)


def get_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("--project", help="Project name", required=True)
    parser.add_argument("--root", help="Filestorage root", required=True)
    parser.add_argument("--dry", help="Dry tun", required=False, action="store_true")

    args = parser.parse_args()
    return args


def get_filestorage_data(root_path: str, project_name: str):
    """Get info from filestorage about tasks

    Parameters
    ----------
    root_path : str
        ClearML fileserver root

    project_name : str
        ClearML project name
    """

    project_path = os.path.join(root_path, project_name)
    raw_task_names = os.listdir(project_path)
    found_tasks = []

    for raw_task_name in raw_task_names:
        parts = raw_task_name.split(".")
        task_id = parts[-1]

        found_tasks.append((task_id, os.path.join(project_path, raw_task_name)))

    return found_tasks


def main():
    args = get_args()

    task_list = Task.get_tasks(project_name=args.project)

    clearml_task_ids = [t.id for t in task_list]
    fs_tasks = get_filestorage_data(root_path=args.root, project_name=args.project)

    for fs_tid, fs_task_path in fs_tasks:
        if fs_tid not in clearml_task_ids:
            logger.info(f"Remove path {fs_task_path}")

            if not args.dry:
                shutil.rmtree(fs_task_path)


if __name__ == "__main__":
    main()
