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

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006690,
        "dEQP-GLES2.functional.shaders.operator.int",
        "_compare.greaterThanEqual.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006691,
        "dEQP-GLES2.functional.shaders.operator.int_",
        "compare.greaterThanEqual.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006692,
        "dEQP-GLES2.functional.shaders.operator.int_c",
        "ompare.greaterThanEqual.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006693,
        "dEQP-GLES2.functional.shaders.operator.int_co",
        "mpare.greaterThanEqual.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006694,
        "dEQP-GLES2.functional.shaders.operator.int_",
        "compare.greaterThanEqual.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006695,
        "dEQP-GLES2.functional.shaders.operator.int_c",
        "ompare.greaterThanEqual.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006696,
        "dEQP-GLES2.functional.shaders.operator.int",
        "_compare.greaterThanEqual.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006697,
        "dEQP-GLES2.functional.shaders.operator.int_",
        "compare.greaterThanEqual.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006698,
        "dEQP-GLES2.functional.shaders.operator.int_c",
        "ompare.greaterThanEqual.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006699,
        "dEQP-GLES2.functional.shaders.operator.int_co",
        "mpare.greaterThanEqual.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006700,
        "dEQP-GLES2.functional.shaders.operator.int_",
        "compare.greaterThanEqual.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006701,
        "dEQP-GLES2.functional.shaders.operator.int_c",
        "ompare.greaterThanEqual.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006702,
        "dEQP-GLES2.functional.shaders.operator.int",
        "_compare.greaterThanEqual.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006703,
        "dEQP-GLES2.functional.shaders.operator.int_",
        "compare.greaterThanEqual.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006704,
        "dEQP-GLES2.functional.shaders.operator.int_c",
        "ompare.greaterThanEqual.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006705,
        "dEQP-GLES2.functional.shaders.operator.int_co",
        "mpare.greaterThanEqual.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006706,
        "dEQP-GLES2.functional.shaders.operator.int_",
        "compare.greaterThanEqual.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006707,
        "dEQP-GLES2.functional.shaders.operator.int_c",
        "ompare.greaterThanEqual.highp_ivec4_fragment");
