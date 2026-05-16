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

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038470,
        "dEQP-GLES3.functional.attribute_",
        "location.bind_aliasing.cond_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038471,
        "dEQP-GLES3.functional.attribute_lo",
        "cation.bind_aliasing.max_cond_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038472,
        "dEQP-GLES3.functional.attribute_loca",
        "tion.bind_aliasing.max_inactive_float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038473,
        "dEQP-GLES3.functional.attribute_",
        "location.bind_aliasing.cond_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038474,
        "dEQP-GLES3.functional.attribute_lo",
        "cation.bind_aliasing.max_cond_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038475,
        "dEQP-GLES3.functional.attribute_loca",
        "tion.bind_aliasing.max_inactive_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038476,
        "dEQP-GLES3.functional.attribute_",
        "location.bind_aliasing.cond_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038477,
        "dEQP-GLES3.functional.attribute_lo",
        "cation.bind_aliasing.max_cond_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038478,
        "dEQP-GLES3.functional.attribute_loca",
        "tion.bind_aliasing.max_inactive_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038479,
        "dEQP-GLES3.functional.attribute_",
        "location.bind_aliasing.cond_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038480,
        "dEQP-GLES3.functional.attribute_lo",
        "cation.bind_aliasing.max_cond_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038481,
        "dEQP-GLES3.functional.attribute_loca",
        "tion.bind_aliasing.max_inactive_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038482,
        "dEQP-GLES3.functional.attribute_",
        "location.bind_aliasing.cond_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038483,
        "dEQP-GLES3.functional.attribute_loca",
        "tion.bind_aliasing.cond_mat2_offset_1");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038484,
        "dEQP-GLES3.functional.attribute_lo",
        "cation.bind_aliasing.max_cond_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038485,
        "dEQP-GLES3.functional.attribute_loca",
        "tion.bind_aliasing.max_inactive_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038486,
        "dEQP-GLES3.functional.attribute_",
        "location.bind_aliasing.cond_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038487,
        "dEQP-GLES3.functional.attribute_loca",
        "tion.bind_aliasing.cond_mat3_offset_1");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038488,
        "dEQP-GLES3.functional.attribute_lo",
        "cation.bind_aliasing.max_cond_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038489,
        "dEQP-GLES3.functional.attribute_loca",
        "tion.bind_aliasing.max_inactive_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038490,
        "dEQP-GLES3.functional.attribute_",
        "location.bind_aliasing.cond_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038491,
        "dEQP-GLES3.functional.attribute_loca",
        "tion.bind_aliasing.cond_mat4_offset_1");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038492,
        "dEQP-GLES3.functional.attribute_lo",
        "cation.bind_aliasing.max_cond_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038493,
        "dEQP-GLES3.functional.attribute_loca",
        "tion.bind_aliasing.max_inactive_mat4");
