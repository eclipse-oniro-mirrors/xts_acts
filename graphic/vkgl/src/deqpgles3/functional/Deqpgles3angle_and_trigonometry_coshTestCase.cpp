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
#include "../ActsDeqpgles30013TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012342,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.cosh.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012343,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.cosh.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012344,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.cosh.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012345,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.cosh.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012346,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.cosh.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012347,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.cosh.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012348,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.cosh.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012349,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.cosh.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012350,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.cosh.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012351,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.cosh.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012352,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.cosh.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012353,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.cosh.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012354,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.cosh.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012355,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.cosh.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012356,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.cosh.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012357,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.cosh.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012358,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.cosh.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012359,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.cosh.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012360,
        "dEQP-GLES3.functional.shaders.operator.an",
        "gle_and_trigonometry.cosh.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012361,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.cosh.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012362,
        "dEQP-GLES3.functional.shaders.operator.an",
        "gle_and_trigonometry.cosh.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012363,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.cosh.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012364,
        "dEQP-GLES3.functional.shaders.operator.an",
        "gle_and_trigonometry.cosh.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012365,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.cosh.lowp_vec4_fragment");
