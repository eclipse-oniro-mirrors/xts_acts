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

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006708,
        "dEQP-GLES2.functional.shaders.operato",
        "r.int_compare.equal.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006709,
        "dEQP-GLES2.functional.shaders.operator",
        ".int_compare.equal.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006710,
        "dEQP-GLES2.functional.shaders.operator",
        ".int_compare.equal.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006711,
        "dEQP-GLES2.functional.shaders.operator.",
        "int_compare.equal.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006712,
        "dEQP-GLES2.functional.shaders.operato",
        "r.int_compare.equal.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006713,
        "dEQP-GLES2.functional.shaders.operator",
        ".int_compare.equal.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006714,
        "dEQP-GLES2.functional.shaders.operato",
        "r.int_compare.equal.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006715,
        "dEQP-GLES2.functional.shaders.operator",
        ".int_compare.equal.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006716,
        "dEQP-GLES2.functional.shaders.operator",
        ".int_compare.equal.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006717,
        "dEQP-GLES2.functional.shaders.operator.",
        "int_compare.equal.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006718,
        "dEQP-GLES2.functional.shaders.operato",
        "r.int_compare.equal.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006719,
        "dEQP-GLES2.functional.shaders.operator",
        ".int_compare.equal.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006720,
        "dEQP-GLES2.functional.shaders.operato",
        "r.int_compare.equal.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006721,
        "dEQP-GLES2.functional.shaders.operator",
        ".int_compare.equal.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006722,
        "dEQP-GLES2.functional.shaders.operator",
        ".int_compare.equal.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006723,
        "dEQP-GLES2.functional.shaders.operator.",
        "int_compare.equal.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006724,
        "dEQP-GLES2.functional.shaders.operato",
        "r.int_compare.equal.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006725,
        "dEQP-GLES2.functional.shaders.operator",
        ".int_compare.equal.highp_ivec4_fragment");
