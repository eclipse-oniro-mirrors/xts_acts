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
#include "../ActsDeqpgles30041TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040464,
        "dEQP-GLES3.functional",
        ".instanced.types.float");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040465,
        "dEQP-GLES3.functional",
        ".instanced.types.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040466,
        "dEQP-GLES3.functional",
        ".instanced.types.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040467,
        "dEQP-GLES3.functional",
        ".instanced.types.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040468,
        "dEQP-GLES3.functional",
        ".instanced.types.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040469,
        "dEQP-GLES3.functional.",
        "instanced.types.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040470,
        "dEQP-GLES3.functional.",
        "instanced.types.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040471,
        "dEQP-GLES3.functional.",
        "instanced.types.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040472,
        "dEQP-GLES3.functional",
        ".instanced.types.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040473,
        "dEQP-GLES3.functional.",
        "instanced.types.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040474,
        "dEQP-GLES3.functional.",
        "instanced.types.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040475,
        "dEQP-GLES3.functional.",
        "instanced.types.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040476,
        "dEQP-GLES3.functional",
        ".instanced.types.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040477,
        "dEQP-GLES3.functiona",
        "l.instanced.types.int");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040478,
        "dEQP-GLES3.functional",
        ".instanced.types.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040479,
        "dEQP-GLES3.functional",
        ".instanced.types.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040480,
        "dEQP-GLES3.functional",
        ".instanced.types.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040481,
        "dEQP-GLES3.functional",
        ".instanced.types.uint");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040482,
        "dEQP-GLES3.functional",
        ".instanced.types.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040483,
        "dEQP-GLES3.functional",
        ".instanced.types.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30041TestSuite, TestCase_040484,
        "dEQP-GLES3.functional",
        ".instanced.types.uvec4");
