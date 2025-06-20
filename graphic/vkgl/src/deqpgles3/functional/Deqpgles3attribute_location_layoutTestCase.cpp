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

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038523,
        "dEQP-GLES3.functional.attr",
        "ibute_location.layout.float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038524,
        "dEQP-GLES3.functional.attr",
        "ibute_location.layout.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038525,
        "dEQP-GLES3.functional.attr",
        "ibute_location.layout.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038526,
        "dEQP-GLES3.functional.attr",
        "ibute_location.layout.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038527,
        "dEQP-GLES3.functional.attr",
        "ibute_location.layout.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038528,
        "dEQP-GLES3.functional.attr",
        "ibute_location.layout.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038529,
        "dEQP-GLES3.functional.attr",
        "ibute_location.layout.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038530,
        "dEQP-GLES3.functional.att",
        "ribute_location.layout.int");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038531,
        "dEQP-GLES3.functional.attr",
        "ibute_location.layout.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038532,
        "dEQP-GLES3.functional.attr",
        "ibute_location.layout.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038533,
        "dEQP-GLES3.functional.attr",
        "ibute_location.layout.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038534,
        "dEQP-GLES3.functional.attr",
        "ibute_location.layout.uint");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038535,
        "dEQP-GLES3.functional.attr",
        "ibute_location.layout.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038536,
        "dEQP-GLES3.functional.attr",
        "ibute_location.layout.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038537,
        "dEQP-GLES3.functional.attr",
        "ibute_location.layout.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038538,
        "dEQP-GLES3.functional.attri",
        "bute_location.layout.mat2x2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038539,
        "dEQP-GLES3.functional.attri",
        "bute_location.layout.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038540,
        "dEQP-GLES3.functional.attri",
        "bute_location.layout.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038541,
        "dEQP-GLES3.functional.attri",
        "bute_location.layout.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038542,
        "dEQP-GLES3.functional.attri",
        "bute_location.layout.mat3x3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038543,
        "dEQP-GLES3.functional.attri",
        "bute_location.layout.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038544,
        "dEQP-GLES3.functional.attri",
        "bute_location.layout.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038545,
        "dEQP-GLES3.functional.attri",
        "bute_location.layout.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038546,
        "dEQP-GLES3.functional.attri",
        "bute_location.layout.mat4x4");
