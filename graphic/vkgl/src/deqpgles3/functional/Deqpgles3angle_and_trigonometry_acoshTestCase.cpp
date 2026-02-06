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

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012406,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.acosh.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012407,
        "dEQP-GLES3.functional.shaders.operator.angle_",
        "and_trigonometry.acosh.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012408,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.acosh.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012409,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.acosh.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012410,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.acosh.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012411,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.acosh.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012412,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.acosh.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012413,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.acosh.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012414,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.acosh.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012415,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.acosh.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012416,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.acosh.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012417,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.acosh.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012418,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.acosh.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012419,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.acosh.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012420,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.acosh.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012421,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.acosh.highp_vec4_fragment");
