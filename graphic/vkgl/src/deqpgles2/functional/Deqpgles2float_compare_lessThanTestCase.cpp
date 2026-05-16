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

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006528,
        "dEQP-GLES2.functional.shaders.operator.",
        "float_compare.lessThan.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006529,
        "dEQP-GLES2.functional.shaders.operator.f",
        "loat_compare.lessThan.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006530,
        "dEQP-GLES2.functional.shaders.operator.f",
        "loat_compare.lessThan.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006531,
        "dEQP-GLES2.functional.shaders.operator.fl",
        "oat_compare.lessThan.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006532,
        "dEQP-GLES2.functional.shaders.operator.",
        "float_compare.lessThan.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006533,
        "dEQP-GLES2.functional.shaders.operator.f",
        "loat_compare.lessThan.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006534,
        "dEQP-GLES2.functional.shaders.operator.",
        "float_compare.lessThan.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006535,
        "dEQP-GLES2.functional.shaders.operator.f",
        "loat_compare.lessThan.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006536,
        "dEQP-GLES2.functional.shaders.operator.f",
        "loat_compare.lessThan.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006537,
        "dEQP-GLES2.functional.shaders.operator.fl",
        "oat_compare.lessThan.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006538,
        "dEQP-GLES2.functional.shaders.operator.",
        "float_compare.lessThan.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006539,
        "dEQP-GLES2.functional.shaders.operator.f",
        "loat_compare.lessThan.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006540,
        "dEQP-GLES2.functional.shaders.operator.",
        "float_compare.lessThan.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006541,
        "dEQP-GLES2.functional.shaders.operator.f",
        "loat_compare.lessThan.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006542,
        "dEQP-GLES2.functional.shaders.operator.f",
        "loat_compare.lessThan.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006543,
        "dEQP-GLES2.functional.shaders.operator.fl",
        "oat_compare.lessThan.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006544,
        "dEQP-GLES2.functional.shaders.operator.",
        "float_compare.lessThan.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006545,
        "dEQP-GLES2.functional.shaders.operator.f",
        "loat_compare.lessThan.highp_vec4_fragment");
