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

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013534,
        "dEQP-GLES3.functional.shaders.operator.i",
        "nt_compare.greaterThan.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013535,
        "dEQP-GLES3.functional.shaders.operator.in",
        "t_compare.greaterThan.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013536,
        "dEQP-GLES3.functional.shaders.operator.in",
        "t_compare.greaterThan.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013537,
        "dEQP-GLES3.functional.shaders.operator.int",
        "_compare.greaterThan.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013538,
        "dEQP-GLES3.functional.shaders.operator.i",
        "nt_compare.greaterThan.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013539,
        "dEQP-GLES3.functional.shaders.operator.in",
        "t_compare.greaterThan.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013540,
        "dEQP-GLES3.functional.shaders.operator.i",
        "nt_compare.greaterThan.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013541,
        "dEQP-GLES3.functional.shaders.operator.in",
        "t_compare.greaterThan.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013542,
        "dEQP-GLES3.functional.shaders.operator.in",
        "t_compare.greaterThan.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013543,
        "dEQP-GLES3.functional.shaders.operator.int",
        "_compare.greaterThan.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013544,
        "dEQP-GLES3.functional.shaders.operator.i",
        "nt_compare.greaterThan.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013545,
        "dEQP-GLES3.functional.shaders.operator.in",
        "t_compare.greaterThan.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013546,
        "dEQP-GLES3.functional.shaders.operator.i",
        "nt_compare.greaterThan.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013547,
        "dEQP-GLES3.functional.shaders.operator.in",
        "t_compare.greaterThan.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013548,
        "dEQP-GLES3.functional.shaders.operator.in",
        "t_compare.greaterThan.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013549,
        "dEQP-GLES3.functional.shaders.operator.int",
        "_compare.greaterThan.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013550,
        "dEQP-GLES3.functional.shaders.operator.i",
        "nt_compare.greaterThan.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013551,
        "dEQP-GLES3.functional.shaders.operator.in",
        "t_compare.greaterThan.highp_ivec4_fragment");
