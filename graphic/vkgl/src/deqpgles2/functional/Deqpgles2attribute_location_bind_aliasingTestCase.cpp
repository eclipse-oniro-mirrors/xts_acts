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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20014TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013940,
        "dEQP-GLES2.functional.attribute_",
        "location.bind_aliasing.cond_float");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013941,
        "dEQP-GLES2.functional.attribute_loca",
        "tion.bind_aliasing.max_inactive_float");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013942,
        "dEQP-GLES2.functional.attribute_",
        "location.bind_aliasing.cond_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013943,
        "dEQP-GLES2.functional.attribute_loca",
        "tion.bind_aliasing.max_inactive_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013944,
        "dEQP-GLES2.functional.attribute_",
        "location.bind_aliasing.cond_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013945,
        "dEQP-GLES2.functional.attribute_loca",
        "tion.bind_aliasing.max_inactive_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013946,
        "dEQP-GLES2.functional.attribute_",
        "location.bind_aliasing.cond_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013947,
        "dEQP-GLES2.functional.attribute_loca",
        "tion.bind_aliasing.max_inactive_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013948,
        "dEQP-GLES2.functional.attribute_",
        "location.bind_aliasing.cond_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013949,
        "dEQP-GLES2.functional.attribute_loca",
        "tion.bind_aliasing.cond_mat2_offset_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013950,
        "dEQP-GLES2.functional.attribute_loca",
        "tion.bind_aliasing.max_inactive_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013951,
        "dEQP-GLES2.functional.attribute_",
        "location.bind_aliasing.cond_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013952,
        "dEQP-GLES2.functional.attribute_loca",
        "tion.bind_aliasing.cond_mat3_offset_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013953,
        "dEQP-GLES2.functional.attribute_loca",
        "tion.bind_aliasing.max_inactive_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013954,
        "dEQP-GLES2.functional.attribute_",
        "location.bind_aliasing.cond_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013955,
        "dEQP-GLES2.functional.attribute_loca",
        "tion.bind_aliasing.cond_mat4_offset_1");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013956,
        "dEQP-GLES2.functional.attribute_loca",
        "tion.bind_aliasing.max_inactive_mat4");
