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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30020TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019450,
        "dEQP-GLES3.functional.shaders.builtin_function",
        "s.precision.matrixcompmult.mediump_vertex.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019451,
        "dEQP-GLES3.functional.shaders.builtin_functions",
        ".precision.matrixcompmult.mediump_vertex.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019452,
        "dEQP-GLES3.functional.shaders.builtin_functions",
        ".precision.matrixcompmult.mediump_vertex.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019453,
        "dEQP-GLES3.functional.shaders.builtin_functions",
        ".precision.matrixcompmult.mediump_vertex.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019454,
        "dEQP-GLES3.functional.shaders.builtin_function",
        "s.precision.matrixcompmult.mediump_vertex.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019455,
        "dEQP-GLES3.functional.shaders.builtin_functions",
        ".precision.matrixcompmult.mediump_vertex.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019456,
        "dEQP-GLES3.functional.shaders.builtin_functions",
        ".precision.matrixcompmult.mediump_vertex.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019457,
        "dEQP-GLES3.functional.shaders.builtin_functions",
        ".precision.matrixcompmult.mediump_vertex.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019458,
        "dEQP-GLES3.functional.shaders.builtin_function",
        "s.precision.matrixcompmult.mediump_vertex.mat4");
