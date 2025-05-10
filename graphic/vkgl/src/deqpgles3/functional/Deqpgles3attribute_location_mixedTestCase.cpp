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

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038595,
        "dEQP-GLES3.functional.attr",
        "ibute_location.mixed.float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038596,
        "dEQP-GLES3.functional.att",
        "ribute_location.mixed.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038597,
        "dEQP-GLES3.functional.att",
        "ribute_location.mixed.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038598,
        "dEQP-GLES3.functional.att",
        "ribute_location.mixed.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038599,
        "dEQP-GLES3.functional.att",
        "ribute_location.mixed.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038600,
        "dEQP-GLES3.functional.att",
        "ribute_location.mixed.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038601,
        "dEQP-GLES3.functional.att",
        "ribute_location.mixed.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038602,
        "dEQP-GLES3.functional.att",
        "ribute_location.mixed.int");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038603,
        "dEQP-GLES3.functional.attr",
        "ibute_location.mixed.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038604,
        "dEQP-GLES3.functional.attr",
        "ibute_location.mixed.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038605,
        "dEQP-GLES3.functional.attr",
        "ibute_location.mixed.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038606,
        "dEQP-GLES3.functional.att",
        "ribute_location.mixed.uint");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038607,
        "dEQP-GLES3.functional.attr",
        "ibute_location.mixed.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038608,
        "dEQP-GLES3.functional.attr",
        "ibute_location.mixed.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038609,
        "dEQP-GLES3.functional.attr",
        "ibute_location.mixed.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038610,
        "dEQP-GLES3.functional.attr",
        "ibute_location.mixed.mat2x2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038611,
        "dEQP-GLES3.functional.attr",
        "ibute_location.mixed.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038612,
        "dEQP-GLES3.functional.attr",
        "ibute_location.mixed.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038613,
        "dEQP-GLES3.functional.attr",
        "ibute_location.mixed.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038614,
        "dEQP-GLES3.functional.attr",
        "ibute_location.mixed.mat3x3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038615,
        "dEQP-GLES3.functional.attr",
        "ibute_location.mixed.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038616,
        "dEQP-GLES3.functional.attr",
        "ibute_location.mixed.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038617,
        "dEQP-GLES3.functional.attr",
        "ibute_location.mixed.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038618,
        "dEQP-GLES3.functional.attr",
        "ibute_location.mixed.mat4x4");
