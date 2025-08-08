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

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038494,
        "dEQP-GLES3.functional.attrib",
        "ute_location.bind_hole.float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038495,
        "dEQP-GLES3.functional.attri",
        "bute_location.bind_hole.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038496,
        "dEQP-GLES3.functional.attri",
        "bute_location.bind_hole.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038497,
        "dEQP-GLES3.functional.attri",
        "bute_location.bind_hole.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038498,
        "dEQP-GLES3.functional.attri",
        "bute_location.bind_hole.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038499,
        "dEQP-GLES3.functional.attri",
        "bute_location.bind_hole.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038500,
        "dEQP-GLES3.functional.attri",
        "bute_location.bind_hole.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038501,
        "dEQP-GLES3.functional.attri",
        "bute_location.bind_hole.int");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038502,
        "dEQP-GLES3.functional.attrib",
        "ute_location.bind_hole.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038503,
        "dEQP-GLES3.functional.attrib",
        "ute_location.bind_hole.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038504,
        "dEQP-GLES3.functional.attrib",
        "ute_location.bind_hole.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038505,
        "dEQP-GLES3.functional.attri",
        "bute_location.bind_hole.uint");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038506,
        "dEQP-GLES3.functional.attrib",
        "ute_location.bind_hole.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038507,
        "dEQP-GLES3.functional.attrib",
        "ute_location.bind_hole.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038508,
        "dEQP-GLES3.functional.attrib",
        "ute_location.bind_hole.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038509,
        "dEQP-GLES3.functional.attrib",
        "ute_location.bind_hole.mat2x2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038510,
        "dEQP-GLES3.functional.attrib",
        "ute_location.bind_hole.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038511,
        "dEQP-GLES3.functional.attrib",
        "ute_location.bind_hole.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038512,
        "dEQP-GLES3.functional.attrib",
        "ute_location.bind_hole.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038513,
        "dEQP-GLES3.functional.attrib",
        "ute_location.bind_hole.mat3x3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038514,
        "dEQP-GLES3.functional.attrib",
        "ute_location.bind_hole.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038515,
        "dEQP-GLES3.functional.attrib",
        "ute_location.bind_hole.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038516,
        "dEQP-GLES3.functional.attrib",
        "ute_location.bind_hole.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038517,
        "dEQP-GLES3.functional.attrib",
        "ute_location.bind_hole.mat4x4");
