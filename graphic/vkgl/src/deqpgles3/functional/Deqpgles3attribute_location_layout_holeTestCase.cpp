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
#include "../ActsDeqpgles30039TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038571,
        "dEQP-GLES3.functional.attribu",
        "te_location.layout_hole.float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038572,
        "dEQP-GLES3.functional.attrib",
        "ute_location.layout_hole.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038573,
        "dEQP-GLES3.functional.attrib",
        "ute_location.layout_hole.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038574,
        "dEQP-GLES3.functional.attrib",
        "ute_location.layout_hole.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038575,
        "dEQP-GLES3.functional.attrib",
        "ute_location.layout_hole.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038576,
        "dEQP-GLES3.functional.attrib",
        "ute_location.layout_hole.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038577,
        "dEQP-GLES3.functional.attrib",
        "ute_location.layout_hole.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038578,
        "dEQP-GLES3.functional.attrib",
        "ute_location.layout_hole.int");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038579,
        "dEQP-GLES3.functional.attribu",
        "te_location.layout_hole.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038580,
        "dEQP-GLES3.functional.attribu",
        "te_location.layout_hole.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038581,
        "dEQP-GLES3.functional.attribu",
        "te_location.layout_hole.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038582,
        "dEQP-GLES3.functional.attrib",
        "ute_location.layout_hole.uint");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038583,
        "dEQP-GLES3.functional.attribu",
        "te_location.layout_hole.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038584,
        "dEQP-GLES3.functional.attribu",
        "te_location.layout_hole.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038585,
        "dEQP-GLES3.functional.attribu",
        "te_location.layout_hole.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038586,
        "dEQP-GLES3.functional.attribu",
        "te_location.layout_hole.mat2x2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038587,
        "dEQP-GLES3.functional.attribu",
        "te_location.layout_hole.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038588,
        "dEQP-GLES3.functional.attribu",
        "te_location.layout_hole.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038589,
        "dEQP-GLES3.functional.attribu",
        "te_location.layout_hole.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038590,
        "dEQP-GLES3.functional.attribu",
        "te_location.layout_hole.mat3x3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038591,
        "dEQP-GLES3.functional.attribu",
        "te_location.layout_hole.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038592,
        "dEQP-GLES3.functional.attribu",
        "te_location.layout_hole.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038593,
        "dEQP-GLES3.functional.attribu",
        "te_location.layout_hole.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038594,
        "dEQP-GLES3.functional.attribu",
        "te_location.layout_hole.mat4x4");
