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

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038648,
        "dEQP-GLES3.functional.attrib",
        "ute_location.mixed_hole.float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038649,
        "dEQP-GLES3.functional.attrib",
        "ute_location.mixed_hole.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038650,
        "dEQP-GLES3.functional.attrib",
        "ute_location.mixed_hole.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038651,
        "dEQP-GLES3.functional.attrib",
        "ute_location.mixed_hole.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038652,
        "dEQP-GLES3.functional.attrib",
        "ute_location.mixed_hole.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038653,
        "dEQP-GLES3.functional.attrib",
        "ute_location.mixed_hole.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038654,
        "dEQP-GLES3.functional.attrib",
        "ute_location.mixed_hole.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038655,
        "dEQP-GLES3.functional.attri",
        "bute_location.mixed_hole.int");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038656,
        "dEQP-GLES3.functional.attrib",
        "ute_location.mixed_hole.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038657,
        "dEQP-GLES3.functional.attrib",
        "ute_location.mixed_hole.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038658,
        "dEQP-GLES3.functional.attrib",
        "ute_location.mixed_hole.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038659,
        "dEQP-GLES3.functional.attrib",
        "ute_location.mixed_hole.uint");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038660,
        "dEQP-GLES3.functional.attrib",
        "ute_location.mixed_hole.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038661,
        "dEQP-GLES3.functional.attrib",
        "ute_location.mixed_hole.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038662,
        "dEQP-GLES3.functional.attrib",
        "ute_location.mixed_hole.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038663,
        "dEQP-GLES3.functional.attribu",
        "te_location.mixed_hole.mat2x2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038664,
        "dEQP-GLES3.functional.attribu",
        "te_location.mixed_hole.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038665,
        "dEQP-GLES3.functional.attribu",
        "te_location.mixed_hole.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038666,
        "dEQP-GLES3.functional.attribu",
        "te_location.mixed_hole.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038667,
        "dEQP-GLES3.functional.attribu",
        "te_location.mixed_hole.mat3x3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038668,
        "dEQP-GLES3.functional.attribu",
        "te_location.mixed_hole.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038669,
        "dEQP-GLES3.functional.attribu",
        "te_location.mixed_hole.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038670,
        "dEQP-GLES3.functional.attribu",
        "te_location.mixed_hole.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038671,
        "dEQP-GLES3.functional.attribu",
        "te_location.mixed_hole.mat4x4");
