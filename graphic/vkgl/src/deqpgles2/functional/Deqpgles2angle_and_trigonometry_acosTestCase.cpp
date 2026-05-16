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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20006TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005852,
        "dEQP-GLES2.functional.shaders.operator.angl",
        "e_and_trigonometry.acos.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005853,
        "dEQP-GLES2.functional.shaders.operator.angle",
        "_and_trigonometry.acos.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005854,
        "dEQP-GLES2.functional.shaders.operator.ang",
        "le_and_trigonometry.acos.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005855,
        "dEQP-GLES2.functional.shaders.operator.angl",
        "e_and_trigonometry.acos.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005856,
        "dEQP-GLES2.functional.shaders.operator.angl",
        "e_and_trigonometry.acos.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005857,
        "dEQP-GLES2.functional.shaders.operator.angle",
        "_and_trigonometry.acos.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005858,
        "dEQP-GLES2.functional.shaders.operator.ang",
        "le_and_trigonometry.acos.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005859,
        "dEQP-GLES2.functional.shaders.operator.angl",
        "e_and_trigonometry.acos.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005860,
        "dEQP-GLES2.functional.shaders.operator.angl",
        "e_and_trigonometry.acos.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005861,
        "dEQP-GLES2.functional.shaders.operator.angle",
        "_and_trigonometry.acos.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005862,
        "dEQP-GLES2.functional.shaders.operator.ang",
        "le_and_trigonometry.acos.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005863,
        "dEQP-GLES2.functional.shaders.operator.angl",
        "e_and_trigonometry.acos.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005864,
        "dEQP-GLES2.functional.shaders.operator.angl",
        "e_and_trigonometry.acos.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005865,
        "dEQP-GLES2.functional.shaders.operator.angle",
        "_and_trigonometry.acos.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005866,
        "dEQP-GLES2.functional.shaders.operator.ang",
        "le_and_trigonometry.acos.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20006TestSuite, TestCase_005867,
        "dEQP-GLES2.functional.shaders.operator.angl",
        "e_and_trigonometry.acos.highp_vec4_fragment");
