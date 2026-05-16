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

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006546,
        "dEQP-GLES2.functional.shaders.operator.fl",
        "oat_compare.lessThanEqual.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006547,
        "dEQP-GLES2.functional.shaders.operator.flo",
        "at_compare.lessThanEqual.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006548,
        "dEQP-GLES2.functional.shaders.operator.floa",
        "t_compare.lessThanEqual.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006549,
        "dEQP-GLES2.functional.shaders.operator.float",
        "_compare.lessThanEqual.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006550,
        "dEQP-GLES2.functional.shaders.operator.flo",
        "at_compare.lessThanEqual.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006551,
        "dEQP-GLES2.functional.shaders.operator.floa",
        "t_compare.lessThanEqual.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006552,
        "dEQP-GLES2.functional.shaders.operator.fl",
        "oat_compare.lessThanEqual.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006553,
        "dEQP-GLES2.functional.shaders.operator.flo",
        "at_compare.lessThanEqual.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006554,
        "dEQP-GLES2.functional.shaders.operator.floa",
        "t_compare.lessThanEqual.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006555,
        "dEQP-GLES2.functional.shaders.operator.float",
        "_compare.lessThanEqual.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006556,
        "dEQP-GLES2.functional.shaders.operator.flo",
        "at_compare.lessThanEqual.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006557,
        "dEQP-GLES2.functional.shaders.operator.floa",
        "t_compare.lessThanEqual.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006558,
        "dEQP-GLES2.functional.shaders.operator.fl",
        "oat_compare.lessThanEqual.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006559,
        "dEQP-GLES2.functional.shaders.operator.flo",
        "at_compare.lessThanEqual.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006560,
        "dEQP-GLES2.functional.shaders.operator.floa",
        "t_compare.lessThanEqual.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006561,
        "dEQP-GLES2.functional.shaders.operator.float",
        "_compare.lessThanEqual.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006562,
        "dEQP-GLES2.functional.shaders.operator.flo",
        "at_compare.lessThanEqual.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006563,
        "dEQP-GLES2.functional.shaders.operator.floa",
        "t_compare.lessThanEqual.highp_vec4_fragment");
