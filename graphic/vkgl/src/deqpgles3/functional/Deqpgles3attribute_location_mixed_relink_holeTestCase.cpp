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

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038696,
        "dEQP-GLES3.functional.attribute_",
        "location.mixed_relink_hole.float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038697,
        "dEQP-GLES3.functional.attribute",
        "_location.mixed_relink_hole.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038698,
        "dEQP-GLES3.functional.attribute",
        "_location.mixed_relink_hole.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038699,
        "dEQP-GLES3.functional.attribute",
        "_location.mixed_relink_hole.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038700,
        "dEQP-GLES3.functional.attribute",
        "_location.mixed_relink_hole.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038701,
        "dEQP-GLES3.functional.attribute",
        "_location.mixed_relink_hole.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038702,
        "dEQP-GLES3.functional.attribute",
        "_location.mixed_relink_hole.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038703,
        "dEQP-GLES3.functional.attribute",
        "_location.mixed_relink_hole.int");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038704,
        "dEQP-GLES3.functional.attribute_",
        "location.mixed_relink_hole.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038705,
        "dEQP-GLES3.functional.attribute_",
        "location.mixed_relink_hole.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038706,
        "dEQP-GLES3.functional.attribute_",
        "location.mixed_relink_hole.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038707,
        "dEQP-GLES3.functional.attribute",
        "_location.mixed_relink_hole.uint");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038708,
        "dEQP-GLES3.functional.attribute_",
        "location.mixed_relink_hole.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038709,
        "dEQP-GLES3.functional.attribute_",
        "location.mixed_relink_hole.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038710,
        "dEQP-GLES3.functional.attribute_",
        "location.mixed_relink_hole.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038711,
        "dEQP-GLES3.functional.attribute_",
        "location.mixed_relink_hole.mat2x2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038712,
        "dEQP-GLES3.functional.attribute_",
        "location.mixed_relink_hole.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038713,
        "dEQP-GLES3.functional.attribute_",
        "location.mixed_relink_hole.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038714,
        "dEQP-GLES3.functional.attribute_",
        "location.mixed_relink_hole.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038715,
        "dEQP-GLES3.functional.attribute_",
        "location.mixed_relink_hole.mat3x3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038716,
        "dEQP-GLES3.functional.attribute_",
        "location.mixed_relink_hole.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038717,
        "dEQP-GLES3.functional.attribute_",
        "location.mixed_relink_hole.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038718,
        "dEQP-GLES3.functional.attribute_",
        "location.mixed_relink_hole.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038719,
        "dEQP-GLES3.functional.attribute_",
        "location.mixed_relink_hole.mat4x4");
