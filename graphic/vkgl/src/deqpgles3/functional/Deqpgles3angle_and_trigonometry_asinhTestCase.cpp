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

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012390,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.asinh.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012391,
        "dEQP-GLES3.functional.shaders.operator.angle_",
        "and_trigonometry.asinh.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012392,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.asinh.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012393,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.asinh.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012394,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.asinh.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012395,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.asinh.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012396,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.asinh.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012397,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.asinh.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012398,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.asinh.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012399,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.asinh.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012400,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.asinh.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012401,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.asinh.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012402,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.asinh.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012403,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.asinh.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012404,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.asinh.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012405,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.asinh.highp_vec4_fragment");
