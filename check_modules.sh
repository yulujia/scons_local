#!/bin/sh
# Copyright (c) 2016-2018 Intel Corporation
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

if [ $# -ne 0 ]; then
  ./check_python.sh "$@"
  exit $?
fi

./check_python.sh -c -s "SConstruct" \
                  -s "test/SConstruct.utest" \
                  -s "test/SConstruct" \
                  -s "test/sl_test/SConscript" \
                  -s "test/utest/SConscript" \
                  -s "test_runner/SConscript" \
                  -P3 "test_runner/__main__.py" \
                  -P3 "test_runner/TestRunner.py" \
                  -P3 "test_runner/UnitTestRunner.py" \
                  -P3 "test_runner/ScriptsRunner.py" \
                  -P3 "test_runner/PythonRunner.py" \
                  -P3 "test_runner/PreRunner.py" \
                  -P3 "test_runner/PostRunner.py" \
                  -P3 "test_runner/GrindRunner.py" \
                  -P3 "test_runner/InfoRunner.py" \
                  -P3 "test_runner/TestInfoRunner.py" \
                  -P3 "test_runner/DvmRunner.py" \
                  -P3 "test_runner/MultiRunner.py" \
                  -P3 "test_runner/ResultsRunner.py" \
                  -P3 "test_runner/RemoteTestRunner.py" \
                  -P3 "test_runner/ControlTestRunner.py" \
                  -P3 "test_runner/NodeControlRunner.py" \
                  -P3 "test_runner/OrteRunner.py" \
                  -P3 "test_runner/CmdRunner.py" \
                  -P3 "test_runner/NodeRunner.py" \
                  -P3 "test_runner/findTestLogs.py"\
                  -s "utils/SConstruct_info"\
                  -s "utils/docker/SConstruct_info"\
                  -s "test/tool/SConstruct"\
                  -s "test/tool/src/SConscript"\
                  site_tools/extra/extra.py

exit $?
