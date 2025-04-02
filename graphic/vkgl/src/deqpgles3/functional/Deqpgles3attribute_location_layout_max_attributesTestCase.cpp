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

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038547,
        "dEQP-GLES3.functional.attribute_lo",
        "cation.layout_max_attributes.float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038548,
        "dEQP-GLES3.functional.attribute_l",
        "ocation.layout_max_attributes.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038549,
        "dEQP-GLES3.functional.attribute_l",
        "ocation.layout_max_attributes.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038550,
        "dEQP-GLES3.functional.attribute_l",
        "ocation.layout_max_attributes.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038551,
        "dEQP-GLES3.functional.attribute_l",
        "ocation.layout_max_attributes.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038552,
        "dEQP-GLES3.functional.attribute_l",
        "ocation.layout_max_attributes.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038553,
        "dEQP-GLES3.functional.attribute_l",
        "ocation.layout_max_attributes.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038554,
        "dEQP-GLES3.functional.attribute_l",
        "ocation.layout_max_attributes.int");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038555,
        "dEQP-GLES3.functional.attribute_lo",
        "cation.layout_max_attributes.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038556,
        "dEQP-GLES3.functional.attribute_lo",
        "cation.layout_max_attributes.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038557,
        "dEQP-GLES3.functional.attribute_lo",
        "cation.layout_max_attributes.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038558,
        "dEQP-GLES3.functional.attribute_l",
        "ocation.layout_max_attributes.uint");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038559,
        "dEQP-GLES3.functional.attribute_lo",
        "cation.layout_max_attributes.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038560,
        "dEQP-GLES3.functional.attribute_lo",
        "cation.layout_max_attributes.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038561,
        "dEQP-GLES3.functional.attribute_lo",
        "cation.layout_max_attributes.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038562,
        "dEQP-GLES3.functional.attribute_lo",
        "cation.layout_max_attributes.mat2x2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038563,
        "dEQP-GLES3.functional.attribute_lo",
        "cation.layout_max_attributes.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038564,
        "dEQP-GLES3.functional.attribute_lo",
        "cation.layout_max_attributes.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038565,
        "dEQP-GLES3.functional.attribute_lo",
        "cation.layout_max_attributes.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038566,
        "dEQP-GLES3.functional.attribute_lo",
        "cation.layout_max_attributes.mat3x3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038567,
        "dEQP-GLES3.functional.attribute_lo",
        "cation.layout_max_attributes.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038568,
        "dEQP-GLES3.functional.attribute_lo",
        "cation.layout_max_attributes.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038569,
        "dEQP-GLES3.functional.attribute_lo",
        "cation.layout_max_attributes.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038570,
        "dEQP-GLES3.functional.attribute_lo",
        "cation.layout_max_attributes.mat4x4");
