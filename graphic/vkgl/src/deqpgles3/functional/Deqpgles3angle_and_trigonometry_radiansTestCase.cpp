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

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012150,
        "dEQP-GLES3.functional.shaders.operator.angle_",
        "and_trigonometry.radians.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012151,
        "dEQP-GLES3.functional.shaders.operator.angle_a",
        "nd_trigonometry.radians.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012152,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.radians.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012153,
        "dEQP-GLES3.functional.shaders.operator.angle_",
        "and_trigonometry.radians.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012154,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.radians.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012155,
        "dEQP-GLES3.functional.shaders.operator.angle_",
        "and_trigonometry.radians.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012156,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.radians.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012157,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.radians.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012158,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.radians.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012159,
        "dEQP-GLES3.functional.shaders.operator.angle_",
        "and_trigonometry.radians.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012160,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.radians.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012161,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.radians.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012162,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.radians.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012163,
        "dEQP-GLES3.functional.shaders.operator.angle_",
        "and_trigonometry.radians.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012164,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.radians.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012165,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.radians.highp_vec4_fragment");
