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
#include "../ActsDeqpgles30002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001503,
        "dEQP-GLES3.functional.shaders.l",
        "inkage.varying.basic_types.float");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001504,
        "dEQP-GLES3.functional.shaders.l",
        "inkage.varying.basic_types.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001505,
        "dEQP-GLES3.functional.shaders.l",
        "inkage.varying.basic_types.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001506,
        "dEQP-GLES3.functional.shaders.l",
        "inkage.varying.basic_types.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001507,
        "dEQP-GLES3.functional.shaders.l",
        "inkage.varying.basic_types.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001508,
        "dEQP-GLES3.functional.shaders.li",
        "nkage.varying.basic_types.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001509,
        "dEQP-GLES3.functional.shaders.li",
        "nkage.varying.basic_types.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001510,
        "dEQP-GLES3.functional.shaders.li",
        "nkage.varying.basic_types.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001511,
        "dEQP-GLES3.functional.shaders.l",
        "inkage.varying.basic_types.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001512,
        "dEQP-GLES3.functional.shaders.li",
        "nkage.varying.basic_types.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001513,
        "dEQP-GLES3.functional.shaders.li",
        "nkage.varying.basic_types.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001514,
        "dEQP-GLES3.functional.shaders.li",
        "nkage.varying.basic_types.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001515,
        "dEQP-GLES3.functional.shaders.l",
        "inkage.varying.basic_types.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001516,
        "dEQP-GLES3.functional.shaders.",
        "linkage.varying.basic_types.int");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001517,
        "dEQP-GLES3.functional.shaders.l",
        "inkage.varying.basic_types.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001518,
        "dEQP-GLES3.functional.shaders.l",
        "inkage.varying.basic_types.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001519,
        "dEQP-GLES3.functional.shaders.l",
        "inkage.varying.basic_types.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001520,
        "dEQP-GLES3.functional.shaders.l",
        "inkage.varying.basic_types.uint");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001521,
        "dEQP-GLES3.functional.shaders.l",
        "inkage.varying.basic_types.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001522,
        "dEQP-GLES3.functional.shaders.l",
        "inkage.varying.basic_types.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001523,
        "dEQP-GLES3.functional.shaders.l",
        "inkage.varying.basic_types.uvec4");
