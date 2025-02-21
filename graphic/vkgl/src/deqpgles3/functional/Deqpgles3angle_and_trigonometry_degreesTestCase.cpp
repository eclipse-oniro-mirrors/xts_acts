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

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012166,
        "dEQP-GLES3.functional.shaders.operator.angle_",
        "and_trigonometry.degrees.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012167,
        "dEQP-GLES3.functional.shaders.operator.angle_a",
        "nd_trigonometry.degrees.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012168,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.degrees.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012169,
        "dEQP-GLES3.functional.shaders.operator.angle_",
        "and_trigonometry.degrees.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012170,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.degrees.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012171,
        "dEQP-GLES3.functional.shaders.operator.angle_",
        "and_trigonometry.degrees.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012172,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.degrees.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012173,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.degrees.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012174,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.degrees.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012175,
        "dEQP-GLES3.functional.shaders.operator.angle_",
        "and_trigonometry.degrees.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012176,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.degrees.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012177,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.degrees.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012178,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.degrees.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012179,
        "dEQP-GLES3.functional.shaders.operator.angle_",
        "and_trigonometry.degrees.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012180,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.degrees.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012181,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.degrees.highp_vec4_fragment");
