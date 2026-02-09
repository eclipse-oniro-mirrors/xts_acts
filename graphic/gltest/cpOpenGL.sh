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
root_opengl_path=$1
mkdir -p  "suites/acts/acts/testcases/opengldata"
cp -rf "$root_opengl_path/third_party/vk-gl-cts/external/openglcts/data" "suites/acts/acts/testcases/opengldata"
cp -rf "$root_opengl_path/third_party/vk-gl-cts/external/openglcts/data/mustpass" "suites/acts/acts/testcases/opengldata"

cp -rf "graphic/graphic_2d/glcts" "suites/acts/acts/testcases/opengldata/mustpass"

mv "suites/acts/acts/testcases/opengldata/mustpass/gl/aosp_mustpass" "suites/acts/acts/testcases/opengldata/mustpass/gl/a_mustpass"
mv "suites/acts/acts/testcases/opengldata/mustpass/egl/aosp_mustpass" "suites/acts/acts/testcases/opengldata/mustpass/egl/a_mustpass"
mv "suites/acts/acts/testcases/opengldata/mustpass/gles/aosp_mustpass" "suites/acts/acts/testcases/opengldata/mustpass/gles/a_mustpass"

tar czvf "opengldata.tar.gz" -C "suites/acts/acts/testcases/opengldata" "."
mv "opengldata.tar.gz" "suites/acts/acts/testcases/opengldata"

cp -rf "$root_opengl_path/test/xts/acts/graphic/gltest/genlocal.py" "suites/acts/acts/testcases/opengldata"
cp -rf "graphic/graphic_2d/libdeqp_ohos_platform.z.so" "suites/acts/acts/testcases/opengldata"
cp -rf "graphic/graphic_2d/librosen_context.z.so" "suites/acts/acts/testcases/opengldata"
cp -rf "xts/acts/libdeqp_amber.z.so" "suites/acts/acts/testcases/opengldata"
cp -rf "thirdparty/glslang/libdeqp_spirv.z.so" "suites/acts/acts/testcases/opengldata"
cp -rf "thirdparty/glslang/libdeqp_spvremapper.z.so" "suites/acts/acts/testcases/opengldata" 