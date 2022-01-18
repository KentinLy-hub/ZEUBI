from argparse import ArgumentParser
from pathlib import Path
from difflib import unified_diff
import subprocess as sp
from subprocess import PIPE
import yaml

def run_shell(args, stdin):
    return sp.run(args, stdout=PIPE, stderr=PIPE, text=True, input=stdin)


def diff(ref, project):
    ref = ref.splitlines(keepends=True)
    project = project.splitlines(keepends=True)

    return ''.join(unified_diff(ref, project, fromfile="ref", tofile="42sh"))


def test(binary, testcase):
    ref = run_shell(["bash", "--posix"], testcase["stdin"])
    project = run_shell([binary], testcase["stdin"])

    for check in testcase.get("checks", ["stdout", "stderr", "returncode"]):
        if check == "stdout":
            assert ref.stdout == project.stdout, f"{testcase['name']}: stdout differs"
        elif check == "stderr":
            assert ref.stderr == project.stderr, f"{testcase['name']}: stderr differs"
        elif check == "returncode":
            assert ref.returncode == project.returncode, f"{testcase['name']}: exit value differs"
        elif check == "no_stderr":
            assert project.stderr == "", f"{testcase['name']}: expected no message on stderr"

if __name__ == "__main__":
    parser = ArgumentParser(description = "42sh Project Testsuite")
    parser.add_argument('bin', metavar='BIN')
    args = parser.parse_args()

    binary = Path(args.bin).absolute()

    with open("tests.yml", "r") as tests_files:
        list_of_tests = yaml.safe_load(tests_files)

    for testcase in list_of_tests:
        try:
            test(binary, testcase)
        except AssertionError as err:
            print(err)
        else:
            print(testcase["name"], ": successfully passed")
