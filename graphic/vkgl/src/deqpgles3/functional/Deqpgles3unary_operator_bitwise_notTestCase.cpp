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
#include "../ActsDeqpgles30008TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007432,
        "dEQP-GLES3.functional.shaders.operator.un",
        "ary_operator.bitwise_not.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007433,
        "dEQP-GLES3.functional.shaders.operator.una",
        "ry_operator.bitwise_not.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007434,
        "dEQP-GLES3.functional.shaders.operator.una",
        "ry_operator.bitwise_not.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007435,
        "dEQP-GLES3.functional.shaders.operator.unar",
        "y_operator.bitwise_not.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007436,
        "dEQP-GLES3.functional.shaders.operator.una",
        "ry_operator.bitwise_not.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007437,
        "dEQP-GLES3.functional.shaders.operator.unar",
        "y_operator.bitwise_not.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007438,
        "dEQP-GLES3.functional.shaders.operator.una",
        "ry_operator.bitwise_not.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007439,
        "dEQP-GLES3.functional.shaders.operator.unar",
        "y_operator.bitwise_not.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007440,
        "dEQP-GLES3.functional.shaders.operator.un",
        "ary_operator.bitwise_not.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007441,
        "dEQP-GLES3.functional.shaders.operator.una",
        "ry_operator.bitwise_not.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007442,
        "dEQP-GLES3.functional.shaders.operator.una",
        "ry_operator.bitwise_not.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007443,
        "dEQP-GLES3.functional.shaders.operator.unar",
        "y_operator.bitwise_not.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007444,
        "dEQP-GLES3.functional.shaders.operator.una",
        "ry_operator.bitwise_not.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007445,
        "dEQP-GLES3.functional.shaders.operator.unar",
        "y_operator.bitwise_not.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007446,
        "dEQP-GLES3.functional.shaders.operator.una",
        "ry_operator.bitwise_not.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30008TestSuite, TestCase_007447,
        "dEQP-GLES3.functional.shaders.operator.unar",
        "y_operator.bitwise_not.highp_uvec4_fragment");
