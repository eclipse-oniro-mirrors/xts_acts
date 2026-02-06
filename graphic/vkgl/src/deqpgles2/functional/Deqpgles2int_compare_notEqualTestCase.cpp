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

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006726,
        "dEQP-GLES2.functional.shaders.operator",
        ".int_compare.notEqual.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006727,
        "dEQP-GLES2.functional.shaders.operator.",
        "int_compare.notEqual.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006728,
        "dEQP-GLES2.functional.shaders.operator.i",
        "nt_compare.notEqual.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006729,
        "dEQP-GLES2.functional.shaders.operator.in",
        "t_compare.notEqual.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006730,
        "dEQP-GLES2.functional.shaders.operator.",
        "int_compare.notEqual.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006731,
        "dEQP-GLES2.functional.shaders.operator.i",
        "nt_compare.notEqual.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006732,
        "dEQP-GLES2.functional.shaders.operator",
        ".int_compare.notEqual.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006733,
        "dEQP-GLES2.functional.shaders.operator.",
        "int_compare.notEqual.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006734,
        "dEQP-GLES2.functional.shaders.operator.i",
        "nt_compare.notEqual.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006735,
        "dEQP-GLES2.functional.shaders.operator.in",
        "t_compare.notEqual.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006736,
        "dEQP-GLES2.functional.shaders.operator.",
        "int_compare.notEqual.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006737,
        "dEQP-GLES2.functional.shaders.operator.i",
        "nt_compare.notEqual.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006738,
        "dEQP-GLES2.functional.shaders.operator",
        ".int_compare.notEqual.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006739,
        "dEQP-GLES2.functional.shaders.operator.",
        "int_compare.notEqual.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006740,
        "dEQP-GLES2.functional.shaders.operator.i",
        "nt_compare.notEqual.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006741,
        "dEQP-GLES2.functional.shaders.operator.in",
        "t_compare.notEqual.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006742,
        "dEQP-GLES2.functional.shaders.operator.",
        "int_compare.notEqual.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006743,
        "dEQP-GLES2.functional.shaders.operator.i",
        "nt_compare.notEqual.highp_ivec4_fragment");
