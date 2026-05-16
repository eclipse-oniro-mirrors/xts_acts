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
#include "../ActsDeqpgles20007TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006582,
        "dEQP-GLES2.functional.shaders.operator.floa",
        "t_compare.greaterThanEqual.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006583,
        "dEQP-GLES2.functional.shaders.operator.float",
        "_compare.greaterThanEqual.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006584,
        "dEQP-GLES2.functional.shaders.operator.float",
        "_compare.greaterThanEqual.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006585,
        "dEQP-GLES2.functional.shaders.operator.float_",
        "compare.greaterThanEqual.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006586,
        "dEQP-GLES2.functional.shaders.operator.floa",
        "t_compare.greaterThanEqual.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006587,
        "dEQP-GLES2.functional.shaders.operator.float",
        "_compare.greaterThanEqual.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006588,
        "dEQP-GLES2.functional.shaders.operator.floa",
        "t_compare.greaterThanEqual.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006589,
        "dEQP-GLES2.functional.shaders.operator.float",
        "_compare.greaterThanEqual.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006590,
        "dEQP-GLES2.functional.shaders.operator.float",
        "_compare.greaterThanEqual.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006591,
        "dEQP-GLES2.functional.shaders.operator.float_",
        "compare.greaterThanEqual.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006592,
        "dEQP-GLES2.functional.shaders.operator.floa",
        "t_compare.greaterThanEqual.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006593,
        "dEQP-GLES2.functional.shaders.operator.float",
        "_compare.greaterThanEqual.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006594,
        "dEQP-GLES2.functional.shaders.operator.floa",
        "t_compare.greaterThanEqual.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006595,
        "dEQP-GLES2.functional.shaders.operator.float",
        "_compare.greaterThanEqual.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006596,
        "dEQP-GLES2.functional.shaders.operator.float",
        "_compare.greaterThanEqual.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006597,
        "dEQP-GLES2.functional.shaders.operator.float_",
        "compare.greaterThanEqual.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006598,
        "dEQP-GLES2.functional.shaders.operator.floa",
        "t_compare.greaterThanEqual.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006599,
        "dEQP-GLES2.functional.shaders.operator.float",
        "_compare.greaterThanEqual.highp_vec4_fragment");
