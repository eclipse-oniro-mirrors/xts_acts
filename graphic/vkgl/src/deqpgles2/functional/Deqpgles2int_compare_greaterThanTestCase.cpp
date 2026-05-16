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

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006672,
        "dEQP-GLES2.functional.shaders.operator.i",
        "nt_compare.greaterThan.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006673,
        "dEQP-GLES2.functional.shaders.operator.in",
        "t_compare.greaterThan.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006674,
        "dEQP-GLES2.functional.shaders.operator.in",
        "t_compare.greaterThan.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006675,
        "dEQP-GLES2.functional.shaders.operator.int",
        "_compare.greaterThan.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006676,
        "dEQP-GLES2.functional.shaders.operator.i",
        "nt_compare.greaterThan.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006677,
        "dEQP-GLES2.functional.shaders.operator.in",
        "t_compare.greaterThan.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006678,
        "dEQP-GLES2.functional.shaders.operator.i",
        "nt_compare.greaterThan.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006679,
        "dEQP-GLES2.functional.shaders.operator.in",
        "t_compare.greaterThan.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006680,
        "dEQP-GLES2.functional.shaders.operator.in",
        "t_compare.greaterThan.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006681,
        "dEQP-GLES2.functional.shaders.operator.int",
        "_compare.greaterThan.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006682,
        "dEQP-GLES2.functional.shaders.operator.i",
        "nt_compare.greaterThan.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006683,
        "dEQP-GLES2.functional.shaders.operator.in",
        "t_compare.greaterThan.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006684,
        "dEQP-GLES2.functional.shaders.operator.i",
        "nt_compare.greaterThan.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006685,
        "dEQP-GLES2.functional.shaders.operator.in",
        "t_compare.greaterThan.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006686,
        "dEQP-GLES2.functional.shaders.operator.in",
        "t_compare.greaterThan.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006687,
        "dEQP-GLES2.functional.shaders.operator.int",
        "_compare.greaterThan.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006688,
        "dEQP-GLES2.functional.shaders.operator.i",
        "nt_compare.greaterThan.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006689,
        "dEQP-GLES2.functional.shaders.operator.in",
        "t_compare.greaterThan.highp_ivec4_fragment");
