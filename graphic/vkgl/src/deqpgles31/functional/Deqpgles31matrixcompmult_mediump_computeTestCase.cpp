/*
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <climits>
#include <gtest/gtest.h>
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002732,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.precision.matrixcompmult.mediump_compute.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002733,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".precision.matrixcompmult.mediump_compute.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002734,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".precision.matrixcompmult.mediump_compute.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002735,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".precision.matrixcompmult.mediump_compute.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002736,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.precision.matrixcompmult.mediump_compute.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002737,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".precision.matrixcompmult.mediump_compute.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002738,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".precision.matrixcompmult.mediump_compute.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002739,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".precision.matrixcompmult.mediump_compute.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002740,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.precision.matrixcompmult.mediump_compute.mat4");
