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

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013516,
        "dEQP-GLES3.functional.shaders.operator.in",
        "t_compare.lessThanEqual.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013517,
        "dEQP-GLES3.functional.shaders.operator.int",
        "_compare.lessThanEqual.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013518,
        "dEQP-GLES3.functional.shaders.operator.int",
        "_compare.lessThanEqual.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013519,
        "dEQP-GLES3.functional.shaders.operator.int_",
        "compare.lessThanEqual.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013520,
        "dEQP-GLES3.functional.shaders.operator.in",
        "t_compare.lessThanEqual.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013521,
        "dEQP-GLES3.functional.shaders.operator.int",
        "_compare.lessThanEqual.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013522,
        "dEQP-GLES3.functional.shaders.operator.in",
        "t_compare.lessThanEqual.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013523,
        "dEQP-GLES3.functional.shaders.operator.int",
        "_compare.lessThanEqual.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013524,
        "dEQP-GLES3.functional.shaders.operator.int",
        "_compare.lessThanEqual.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013525,
        "dEQP-GLES3.functional.shaders.operator.int_",
        "compare.lessThanEqual.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013526,
        "dEQP-GLES3.functional.shaders.operator.in",
        "t_compare.lessThanEqual.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013527,
        "dEQP-GLES3.functional.shaders.operator.int",
        "_compare.lessThanEqual.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013528,
        "dEQP-GLES3.functional.shaders.operator.in",
        "t_compare.lessThanEqual.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013529,
        "dEQP-GLES3.functional.shaders.operator.int",
        "_compare.lessThanEqual.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013530,
        "dEQP-GLES3.functional.shaders.operator.int",
        "_compare.lessThanEqual.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013531,
        "dEQP-GLES3.functional.shaders.operator.int_",
        "compare.lessThanEqual.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013532,
        "dEQP-GLES3.functional.shaders.operator.in",
        "t_compare.lessThanEqual.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013533,
        "dEQP-GLES3.functional.shaders.operator.int",
        "_compare.lessThanEqual.highp_ivec4_fragment");
