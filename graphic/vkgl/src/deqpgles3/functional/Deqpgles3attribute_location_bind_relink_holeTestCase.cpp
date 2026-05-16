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

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038672,
        "dEQP-GLES3.functional.attribute",
        "_location.bind_relink_hole.float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038673,
        "dEQP-GLES3.functional.attribute",
        "_location.bind_relink_hole.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038674,
        "dEQP-GLES3.functional.attribute",
        "_location.bind_relink_hole.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038675,
        "dEQP-GLES3.functional.attribute",
        "_location.bind_relink_hole.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038676,
        "dEQP-GLES3.functional.attribute",
        "_location.bind_relink_hole.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038677,
        "dEQP-GLES3.functional.attribute",
        "_location.bind_relink_hole.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038678,
        "dEQP-GLES3.functional.attribute",
        "_location.bind_relink_hole.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038679,
        "dEQP-GLES3.functional.attribut",
        "e_location.bind_relink_hole.int");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038680,
        "dEQP-GLES3.functional.attribute",
        "_location.bind_relink_hole.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038681,
        "dEQP-GLES3.functional.attribute",
        "_location.bind_relink_hole.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038682,
        "dEQP-GLES3.functional.attribute",
        "_location.bind_relink_hole.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038683,
        "dEQP-GLES3.functional.attribute",
        "_location.bind_relink_hole.uint");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038684,
        "dEQP-GLES3.functional.attribute",
        "_location.bind_relink_hole.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038685,
        "dEQP-GLES3.functional.attribute",
        "_location.bind_relink_hole.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038686,
        "dEQP-GLES3.functional.attribute",
        "_location.bind_relink_hole.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038687,
        "dEQP-GLES3.functional.attribute_",
        "location.bind_relink_hole.mat2x2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038688,
        "dEQP-GLES3.functional.attribute_",
        "location.bind_relink_hole.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038689,
        "dEQP-GLES3.functional.attribute_",
        "location.bind_relink_hole.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038690,
        "dEQP-GLES3.functional.attribute_",
        "location.bind_relink_hole.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038691,
        "dEQP-GLES3.functional.attribute_",
        "location.bind_relink_hole.mat3x3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038692,
        "dEQP-GLES3.functional.attribute_",
        "location.bind_relink_hole.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038693,
        "dEQP-GLES3.functional.attribute_",
        "location.bind_relink_hole.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038694,
        "dEQP-GLES3.functional.attribute_",
        "location.bind_relink_hole.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038695,
        "dEQP-GLES3.functional.attribute_",
        "location.bind_relink_hole.mat4x4");
