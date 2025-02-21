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

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012318,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.sinh.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012319,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.sinh.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012320,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.sinh.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012321,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.sinh.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012322,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.sinh.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012323,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.sinh.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012324,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.sinh.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012325,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.sinh.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012326,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.sinh.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012327,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.sinh.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012328,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.sinh.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012329,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.sinh.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012330,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.sinh.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012331,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.sinh.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012332,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.sinh.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012333,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.sinh.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012334,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.sinh.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012335,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.sinh.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012336,
        "dEQP-GLES3.functional.shaders.operator.an",
        "gle_and_trigonometry.sinh.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012337,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.sinh.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012338,
        "dEQP-GLES3.functional.shaders.operator.an",
        "gle_and_trigonometry.sinh.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012339,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.sinh.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012340,
        "dEQP-GLES3.functional.shaders.operator.an",
        "gle_and_trigonometry.sinh.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012341,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.sinh.lowp_vec4_fragment");
