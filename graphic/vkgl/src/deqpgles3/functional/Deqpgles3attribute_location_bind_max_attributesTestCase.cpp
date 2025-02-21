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

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038446,
        "dEQP-GLES3.functional.attribute_l",
        "ocation.bind_max_attributes.float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038447,
        "dEQP-GLES3.functional.attribute_",
        "location.bind_max_attributes.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038448,
        "dEQP-GLES3.functional.attribute_",
        "location.bind_max_attributes.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038449,
        "dEQP-GLES3.functional.attribute_",
        "location.bind_max_attributes.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038450,
        "dEQP-GLES3.functional.attribute_",
        "location.bind_max_attributes.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038451,
        "dEQP-GLES3.functional.attribute_",
        "location.bind_max_attributes.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038452,
        "dEQP-GLES3.functional.attribute_",
        "location.bind_max_attributes.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038453,
        "dEQP-GLES3.functional.attribute_",
        "location.bind_max_attributes.int");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038454,
        "dEQP-GLES3.functional.attribute_l",
        "ocation.bind_max_attributes.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038455,
        "dEQP-GLES3.functional.attribute_l",
        "ocation.bind_max_attributes.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038456,
        "dEQP-GLES3.functional.attribute_l",
        "ocation.bind_max_attributes.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038457,
        "dEQP-GLES3.functional.attribute_",
        "location.bind_max_attributes.uint");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038458,
        "dEQP-GLES3.functional.attribute_l",
        "ocation.bind_max_attributes.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038459,
        "dEQP-GLES3.functional.attribute_l",
        "ocation.bind_max_attributes.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038460,
        "dEQP-GLES3.functional.attribute_l",
        "ocation.bind_max_attributes.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038461,
        "dEQP-GLES3.functional.attribute_l",
        "ocation.bind_max_attributes.mat2x2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038462,
        "dEQP-GLES3.functional.attribute_l",
        "ocation.bind_max_attributes.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038463,
        "dEQP-GLES3.functional.attribute_l",
        "ocation.bind_max_attributes.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038464,
        "dEQP-GLES3.functional.attribute_l",
        "ocation.bind_max_attributes.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038465,
        "dEQP-GLES3.functional.attribute_l",
        "ocation.bind_max_attributes.mat3x3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038466,
        "dEQP-GLES3.functional.attribute_l",
        "ocation.bind_max_attributes.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038467,
        "dEQP-GLES3.functional.attribute_l",
        "ocation.bind_max_attributes.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038468,
        "dEQP-GLES3.functional.attribute_l",
        "ocation.bind_max_attributes.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038469,
        "dEQP-GLES3.functional.attribute_l",
        "ocation.bind_max_attributes.mat4x4");
