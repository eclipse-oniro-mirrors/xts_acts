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

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019504,
        "dEQP-GLES3.functional.shaders.builtin_functio",
        "ns.precision.outerproduct.mediump_vertex.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019505,
        "dEQP-GLES3.functional.shaders.builtin_function",
        "s.precision.outerproduct.mediump_vertex.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019506,
        "dEQP-GLES3.functional.shaders.builtin_function",
        "s.precision.outerproduct.mediump_vertex.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019507,
        "dEQP-GLES3.functional.shaders.builtin_function",
        "s.precision.outerproduct.mediump_vertex.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019508,
        "dEQP-GLES3.functional.shaders.builtin_functio",
        "ns.precision.outerproduct.mediump_vertex.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019509,
        "dEQP-GLES3.functional.shaders.builtin_function",
        "s.precision.outerproduct.mediump_vertex.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019510,
        "dEQP-GLES3.functional.shaders.builtin_function",
        "s.precision.outerproduct.mediump_vertex.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019511,
        "dEQP-GLES3.functional.shaders.builtin_function",
        "s.precision.outerproduct.mediump_vertex.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019512,
        "dEQP-GLES3.functional.shaders.builtin_functio",
        "ns.precision.outerproduct.mediump_vertex.mat4");
