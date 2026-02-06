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

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006654,
        "dEQP-GLES2.functional.shaders.operator.in",
        "t_compare.lessThanEqual.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006655,
        "dEQP-GLES2.functional.shaders.operator.int",
        "_compare.lessThanEqual.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006656,
        "dEQP-GLES2.functional.shaders.operator.int",
        "_compare.lessThanEqual.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006657,
        "dEQP-GLES2.functional.shaders.operator.int_",
        "compare.lessThanEqual.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006658,
        "dEQP-GLES2.functional.shaders.operator.in",
        "t_compare.lessThanEqual.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006659,
        "dEQP-GLES2.functional.shaders.operator.int",
        "_compare.lessThanEqual.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006660,
        "dEQP-GLES2.functional.shaders.operator.in",
        "t_compare.lessThanEqual.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006661,
        "dEQP-GLES2.functional.shaders.operator.int",
        "_compare.lessThanEqual.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006662,
        "dEQP-GLES2.functional.shaders.operator.int",
        "_compare.lessThanEqual.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006663,
        "dEQP-GLES2.functional.shaders.operator.int_",
        "compare.lessThanEqual.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006664,
        "dEQP-GLES2.functional.shaders.operator.in",
        "t_compare.lessThanEqual.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006665,
        "dEQP-GLES2.functional.shaders.operator.int",
        "_compare.lessThanEqual.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006666,
        "dEQP-GLES2.functional.shaders.operator.in",
        "t_compare.lessThanEqual.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006667,
        "dEQP-GLES2.functional.shaders.operator.int",
        "_compare.lessThanEqual.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006668,
        "dEQP-GLES2.functional.shaders.operator.int",
        "_compare.lessThanEqual.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006669,
        "dEQP-GLES2.functional.shaders.operator.int_",
        "compare.lessThanEqual.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006670,
        "dEQP-GLES2.functional.shaders.operator.in",
        "t_compare.lessThanEqual.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006671,
        "dEQP-GLES2.functional.shaders.operator.int",
        "_compare.lessThanEqual.highp_ivec4_fragment");
