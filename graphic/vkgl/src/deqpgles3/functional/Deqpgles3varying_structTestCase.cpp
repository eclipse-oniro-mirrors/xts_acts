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

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001524,
        "dEQP-GLES3.functional.shaders",
        ".linkage.varying.struct.float");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001525,
        "dEQP-GLES3.functional.shader",
        "s.linkage.varying.struct.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001526,
        "dEQP-GLES3.functional.shader",
        "s.linkage.varying.struct.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001527,
        "dEQP-GLES3.functional.shader",
        "s.linkage.varying.struct.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001528,
        "dEQP-GLES3.functional.shader",
        "s.linkage.varying.struct.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001529,
        "dEQP-GLES3.functional.shaders",
        ".linkage.varying.struct.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001530,
        "dEQP-GLES3.functional.shaders",
        ".linkage.varying.struct.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001531,
        "dEQP-GLES3.functional.shaders",
        ".linkage.varying.struct.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001532,
        "dEQP-GLES3.functional.shader",
        "s.linkage.varying.struct.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001533,
        "dEQP-GLES3.functional.shaders",
        ".linkage.varying.struct.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001534,
        "dEQP-GLES3.functional.shaders",
        ".linkage.varying.struct.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001535,
        "dEQP-GLES3.functional.shaders",
        ".linkage.varying.struct.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001536,
        "dEQP-GLES3.functional.shader",
        "s.linkage.varying.struct.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001537,
        "dEQP-GLES3.functional.shader",
        "s.linkage.varying.struct.int");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001538,
        "dEQP-GLES3.functional.shaders",
        ".linkage.varying.struct.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001539,
        "dEQP-GLES3.functional.shaders",
        ".linkage.varying.struct.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001540,
        "dEQP-GLES3.functional.shaders",
        ".linkage.varying.struct.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001541,
        "dEQP-GLES3.functional.shader",
        "s.linkage.varying.struct.uint");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001542,
        "dEQP-GLES3.functional.shaders",
        ".linkage.varying.struct.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001543,
        "dEQP-GLES3.functional.shaders",
        ".linkage.varying.struct.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001544,
        "dEQP-GLES3.functional.shaders",
        ".linkage.varying.struct.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001545,
        "dEQP-GLES3.functional.shaders.l",
        "inkage.varying.struct.float_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001546,
        "dEQP-GLES3.functional.shaders.link",
        "age.varying.struct.float_uvec2_vec3");
