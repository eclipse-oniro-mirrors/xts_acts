#!/bin/bash

# Copyright (C) 2021 Huawei Device Co., Ltd.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -e
root_libuv_path=$1
mkdir -p  "suites/acts/acts/testcases/libuvdata/test"
cp -rf "$root_libuv_path/test/xts/acts/arkui/libuv/genlocal.py" "suites/acts/acts/testcases/libuvdata"
cp -rf "thirdparty/libuv/libuvruntest" "suites/acts/acts/testcases/libuvdata"
cp -rf "$root_libuv_path/third_party/libuv/test/fixtures" "suites/acts/acts/testcases/libuvdata/test"
