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

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006564,
        "dEQP-GLES2.functional.shaders.operator.f",
        "loat_compare.greaterThan.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006565,
        "dEQP-GLES2.functional.shaders.operator.fl",
        "oat_compare.greaterThan.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006566,
        "dEQP-GLES2.functional.shaders.operator.flo",
        "at_compare.greaterThan.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006567,
        "dEQP-GLES2.functional.shaders.operator.floa",
        "t_compare.greaterThan.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006568,
        "dEQP-GLES2.functional.shaders.operator.fl",
        "oat_compare.greaterThan.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006569,
        "dEQP-GLES2.functional.shaders.operator.flo",
        "at_compare.greaterThan.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006570,
        "dEQP-GLES2.functional.shaders.operator.f",
        "loat_compare.greaterThan.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006571,
        "dEQP-GLES2.functional.shaders.operator.fl",
        "oat_compare.greaterThan.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006572,
        "dEQP-GLES2.functional.shaders.operator.flo",
        "at_compare.greaterThan.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006573,
        "dEQP-GLES2.functional.shaders.operator.floa",
        "t_compare.greaterThan.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006574,
        "dEQP-GLES2.functional.shaders.operator.fl",
        "oat_compare.greaterThan.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006575,
        "dEQP-GLES2.functional.shaders.operator.flo",
        "at_compare.greaterThan.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006576,
        "dEQP-GLES2.functional.shaders.operator.f",
        "loat_compare.greaterThan.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006577,
        "dEQP-GLES2.functional.shaders.operator.fl",
        "oat_compare.greaterThan.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006578,
        "dEQP-GLES2.functional.shaders.operator.flo",
        "at_compare.greaterThan.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006579,
        "dEQP-GLES2.functional.shaders.operator.floa",
        "t_compare.greaterThan.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006580,
        "dEQP-GLES2.functional.shaders.operator.fl",
        "oat_compare.greaterThan.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006581,
        "dEQP-GLES2.functional.shaders.operator.flo",
        "at_compare.greaterThan.highp_vec4_fragment");
