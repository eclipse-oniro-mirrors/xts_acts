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

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013426,
        "dEQP-GLES3.functional.shaders.operator.f",
        "loat_compare.greaterThan.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013427,
        "dEQP-GLES3.functional.shaders.operator.fl",
        "oat_compare.greaterThan.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013428,
        "dEQP-GLES3.functional.shaders.operator.flo",
        "at_compare.greaterThan.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013429,
        "dEQP-GLES3.functional.shaders.operator.floa",
        "t_compare.greaterThan.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013430,
        "dEQP-GLES3.functional.shaders.operator.fl",
        "oat_compare.greaterThan.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013431,
        "dEQP-GLES3.functional.shaders.operator.flo",
        "at_compare.greaterThan.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013432,
        "dEQP-GLES3.functional.shaders.operator.f",
        "loat_compare.greaterThan.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013433,
        "dEQP-GLES3.functional.shaders.operator.fl",
        "oat_compare.greaterThan.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013434,
        "dEQP-GLES3.functional.shaders.operator.flo",
        "at_compare.greaterThan.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013435,
        "dEQP-GLES3.functional.shaders.operator.floa",
        "t_compare.greaterThan.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013436,
        "dEQP-GLES3.functional.shaders.operator.fl",
        "oat_compare.greaterThan.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013437,
        "dEQP-GLES3.functional.shaders.operator.flo",
        "at_compare.greaterThan.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013438,
        "dEQP-GLES3.functional.shaders.operator.f",
        "loat_compare.greaterThan.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013439,
        "dEQP-GLES3.functional.shaders.operator.fl",
        "oat_compare.greaterThan.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013440,
        "dEQP-GLES3.functional.shaders.operator.flo",
        "at_compare.greaterThan.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013441,
        "dEQP-GLES3.functional.shaders.operator.floa",
        "t_compare.greaterThan.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013442,
        "dEQP-GLES3.functional.shaders.operator.fl",
        "oat_compare.greaterThan.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013443,
        "dEQP-GLES3.functional.shaders.operator.flo",
        "at_compare.greaterThan.highp_vec4_fragment");
