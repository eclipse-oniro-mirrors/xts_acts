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
#include "../ActsDeqpgles30014TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013498,
        "dEQP-GLES3.functional.shaders.operator",
        ".int_compare.lessThan.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013499,
        "dEQP-GLES3.functional.shaders.operator.",
        "int_compare.lessThan.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013500,
        "dEQP-GLES3.functional.shaders.operator.i",
        "nt_compare.lessThan.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013501,
        "dEQP-GLES3.functional.shaders.operator.in",
        "t_compare.lessThan.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013502,
        "dEQP-GLES3.functional.shaders.operator.",
        "int_compare.lessThan.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013503,
        "dEQP-GLES3.functional.shaders.operator.i",
        "nt_compare.lessThan.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013504,
        "dEQP-GLES3.functional.shaders.operator",
        ".int_compare.lessThan.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013505,
        "dEQP-GLES3.functional.shaders.operator.",
        "int_compare.lessThan.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013506,
        "dEQP-GLES3.functional.shaders.operator.i",
        "nt_compare.lessThan.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013507,
        "dEQP-GLES3.functional.shaders.operator.in",
        "t_compare.lessThan.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013508,
        "dEQP-GLES3.functional.shaders.operator.",
        "int_compare.lessThan.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013509,
        "dEQP-GLES3.functional.shaders.operator.i",
        "nt_compare.lessThan.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013510,
        "dEQP-GLES3.functional.shaders.operator",
        ".int_compare.lessThan.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013511,
        "dEQP-GLES3.functional.shaders.operator.",
        "int_compare.lessThan.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013512,
        "dEQP-GLES3.functional.shaders.operator.i",
        "nt_compare.lessThan.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013513,
        "dEQP-GLES3.functional.shaders.operator.in",
        "t_compare.lessThan.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013514,
        "dEQP-GLES3.functional.shaders.operator.",
        "int_compare.lessThan.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013515,
        "dEQP-GLES3.functional.shaders.operator.i",
        "nt_compare.lessThan.highp_ivec4_fragment");
