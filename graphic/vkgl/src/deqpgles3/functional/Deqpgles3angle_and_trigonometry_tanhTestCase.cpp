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

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012366,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.tanh.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012367,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.tanh.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012368,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.tanh.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012369,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.tanh.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012370,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.tanh.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012371,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.tanh.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012372,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.tanh.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012373,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.tanh.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012374,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.tanh.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012375,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.tanh.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012376,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.tanh.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012377,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.tanh.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012378,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.tanh.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012379,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.tanh.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012380,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.tanh.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012381,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.tanh.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012382,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.tanh.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012383,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.tanh.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012384,
        "dEQP-GLES3.functional.shaders.operator.an",
        "gle_and_trigonometry.tanh.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012385,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.tanh.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012386,
        "dEQP-GLES3.functional.shaders.operator.an",
        "gle_and_trigonometry.tanh.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012387,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.tanh.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012388,
        "dEQP-GLES3.functional.shaders.operator.an",
        "gle_and_trigonometry.tanh.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012389,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.tanh.lowp_vec4_fragment");
