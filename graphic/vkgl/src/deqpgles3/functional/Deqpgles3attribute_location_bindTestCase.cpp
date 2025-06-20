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

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038422,
        "dEQP-GLES3.functional.att",
        "ribute_location.bind.float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038423,
        "dEQP-GLES3.functional.att",
        "ribute_location.bind.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038424,
        "dEQP-GLES3.functional.att",
        "ribute_location.bind.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038425,
        "dEQP-GLES3.functional.att",
        "ribute_location.bind.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038426,
        "dEQP-GLES3.functional.att",
        "ribute_location.bind.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038427,
        "dEQP-GLES3.functional.att",
        "ribute_location.bind.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038428,
        "dEQP-GLES3.functional.att",
        "ribute_location.bind.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038429,
        "dEQP-GLES3.functional.at",
        "tribute_location.bind.int");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038430,
        "dEQP-GLES3.functional.att",
        "ribute_location.bind.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038431,
        "dEQP-GLES3.functional.att",
        "ribute_location.bind.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038432,
        "dEQP-GLES3.functional.att",
        "ribute_location.bind.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038433,
        "dEQP-GLES3.functional.att",
        "ribute_location.bind.uint");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038434,
        "dEQP-GLES3.functional.att",
        "ribute_location.bind.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038435,
        "dEQP-GLES3.functional.att",
        "ribute_location.bind.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038436,
        "dEQP-GLES3.functional.att",
        "ribute_location.bind.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038437,
        "dEQP-GLES3.functional.attr",
        "ibute_location.bind.mat2x2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038438,
        "dEQP-GLES3.functional.attr",
        "ibute_location.bind.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038439,
        "dEQP-GLES3.functional.attr",
        "ibute_location.bind.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038440,
        "dEQP-GLES3.functional.attr",
        "ibute_location.bind.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038441,
        "dEQP-GLES3.functional.attr",
        "ibute_location.bind.mat3x3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038442,
        "dEQP-GLES3.functional.attr",
        "ibute_location.bind.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038443,
        "dEQP-GLES3.functional.attr",
        "ibute_location.bind.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038444,
        "dEQP-GLES3.functional.attr",
        "ibute_location.bind.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038445,
        "dEQP-GLES3.functional.attr",
        "ibute_location.bind.mat4x4");
