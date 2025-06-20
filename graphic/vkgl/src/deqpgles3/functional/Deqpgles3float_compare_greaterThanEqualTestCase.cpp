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

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013444,
        "dEQP-GLES3.functional.shaders.operator.floa",
        "t_compare.greaterThanEqual.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013445,
        "dEQP-GLES3.functional.shaders.operator.float",
        "_compare.greaterThanEqual.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013446,
        "dEQP-GLES3.functional.shaders.operator.float",
        "_compare.greaterThanEqual.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013447,
        "dEQP-GLES3.functional.shaders.operator.float_",
        "compare.greaterThanEqual.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013448,
        "dEQP-GLES3.functional.shaders.operator.floa",
        "t_compare.greaterThanEqual.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013449,
        "dEQP-GLES3.functional.shaders.operator.float",
        "_compare.greaterThanEqual.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013450,
        "dEQP-GLES3.functional.shaders.operator.floa",
        "t_compare.greaterThanEqual.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013451,
        "dEQP-GLES3.functional.shaders.operator.float",
        "_compare.greaterThanEqual.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013452,
        "dEQP-GLES3.functional.shaders.operator.float",
        "_compare.greaterThanEqual.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013453,
        "dEQP-GLES3.functional.shaders.operator.float_",
        "compare.greaterThanEqual.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013454,
        "dEQP-GLES3.functional.shaders.operator.floa",
        "t_compare.greaterThanEqual.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013455,
        "dEQP-GLES3.functional.shaders.operator.float",
        "_compare.greaterThanEqual.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013456,
        "dEQP-GLES3.functional.shaders.operator.floa",
        "t_compare.greaterThanEqual.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013457,
        "dEQP-GLES3.functional.shaders.operator.float",
        "_compare.greaterThanEqual.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013458,
        "dEQP-GLES3.functional.shaders.operator.float",
        "_compare.greaterThanEqual.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013459,
        "dEQP-GLES3.functional.shaders.operator.float_",
        "compare.greaterThanEqual.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013460,
        "dEQP-GLES3.functional.shaders.operator.floa",
        "t_compare.greaterThanEqual.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013461,
        "dEQP-GLES3.functional.shaders.operator.float",
        "_compare.greaterThanEqual.highp_vec4_fragment");
