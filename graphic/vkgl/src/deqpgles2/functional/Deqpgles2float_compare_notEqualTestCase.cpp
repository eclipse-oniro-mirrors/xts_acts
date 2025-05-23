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

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006618,
        "dEQP-GLES2.functional.shaders.operator.",
        "float_compare.notEqual.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006619,
        "dEQP-GLES2.functional.shaders.operator.f",
        "loat_compare.notEqual.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006620,
        "dEQP-GLES2.functional.shaders.operator.f",
        "loat_compare.notEqual.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006621,
        "dEQP-GLES2.functional.shaders.operator.fl",
        "oat_compare.notEqual.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006622,
        "dEQP-GLES2.functional.shaders.operator.",
        "float_compare.notEqual.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006623,
        "dEQP-GLES2.functional.shaders.operator.f",
        "loat_compare.notEqual.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006624,
        "dEQP-GLES2.functional.shaders.operator.",
        "float_compare.notEqual.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006625,
        "dEQP-GLES2.functional.shaders.operator.f",
        "loat_compare.notEqual.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006626,
        "dEQP-GLES2.functional.shaders.operator.f",
        "loat_compare.notEqual.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006627,
        "dEQP-GLES2.functional.shaders.operator.fl",
        "oat_compare.notEqual.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006628,
        "dEQP-GLES2.functional.shaders.operator.",
        "float_compare.notEqual.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006629,
        "dEQP-GLES2.functional.shaders.operator.f",
        "loat_compare.notEqual.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006630,
        "dEQP-GLES2.functional.shaders.operator.",
        "float_compare.notEqual.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006631,
        "dEQP-GLES2.functional.shaders.operator.f",
        "loat_compare.notEqual.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006632,
        "dEQP-GLES2.functional.shaders.operator.f",
        "loat_compare.notEqual.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006633,
        "dEQP-GLES2.functional.shaders.operator.fl",
        "oat_compare.notEqual.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006634,
        "dEQP-GLES2.functional.shaders.operator.",
        "float_compare.notEqual.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006635,
        "dEQP-GLES2.functional.shaders.operator.f",
        "loat_compare.notEqual.highp_vec4_fragment");
