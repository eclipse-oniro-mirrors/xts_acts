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

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012302,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.atan2.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012303,
        "dEQP-GLES3.functional.shaders.operator.angle_",
        "and_trigonometry.atan2.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012304,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.atan2.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012305,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.atan2.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012306,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.atan2.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012307,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.atan2.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012308,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.atan2.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012309,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.atan2.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012310,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.atan2.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012311,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.atan2.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012312,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.atan2.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012313,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.atan2.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012314,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.atan2.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012315,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.atan2.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012316,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.atan2.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012317,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.atan2.highp_vec4_fragment");
