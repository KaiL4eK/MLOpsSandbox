import time
import os
import clearml as cml

CURRENT_DIRAPTH = os.path.abspath(os.path.dirname(__file__))

def main():
    cml_task = cml.Task.init(project_name="new_user_project", task_name="hello world")

    for i in range(100):
        cml.Logger.current_logger().report_scalar(title='title_name', series='series_name', value=i**2, iteration=i)
        time.sleep(1)

if __name__ == "__main__":
    main()