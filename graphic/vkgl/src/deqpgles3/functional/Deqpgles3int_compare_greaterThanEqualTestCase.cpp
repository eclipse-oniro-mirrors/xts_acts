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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30014TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013552,
        "dEQP-GLES3.functional.shaders.operator.int",
        "_compare.greaterThanEqual.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013553,
        "dEQP-GLES3.functional.shaders.operator.int_",
        "compare.greaterThanEqual.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013554,
        "dEQP-GLES3.functional.shaders.operator.int_c",
        "ompare.greaterThanEqual.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013555,
        "dEQP-GLES3.functional.shaders.operator.int_co",
        "mpare.greaterThanEqual.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013556,
        "dEQP-GLES3.functional.shaders.operator.int_",
        "compare.greaterThanEqual.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013557,
        "dEQP-GLES3.functional.shaders.operator.int_c",
        "ompare.greaterThanEqual.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013558,
        "dEQP-GLES3.functional.shaders.operator.int",
        "_compare.greaterThanEqual.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013559,
        "dEQP-GLES3.functional.shaders.operator.int_",
        "compare.greaterThanEqual.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013560,
        "dEQP-GLES3.functional.shaders.operator.int_c",
        "ompare.greaterThanEqual.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013561,
        "dEQP-GLES3.functional.shaders.operator.int_co",
        "mpare.greaterThanEqual.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013562,
        "dEQP-GLES3.functional.shaders.operator.int_",
        "compare.greaterThanEqual.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013563,
        "dEQP-GLES3.functional.shaders.operator.int_c",
        "ompare.greaterThanEqual.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013564,
        "dEQP-GLES3.functional.shaders.operator.int",
        "_compare.greaterThanEqual.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013565,
        "dEQP-GLES3.functional.shaders.operator.int_",
        "compare.greaterThanEqual.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013566,
        "dEQP-GLES3.functional.shaders.operator.int_c",
        "ompare.greaterThanEqual.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013567,
        "dEQP-GLES3.functional.shaders.operator.int_co",
        "mpare.greaterThanEqual.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013568,
        "dEQP-GLES3.functional.shaders.operator.int_",
        "compare.greaterThanEqual.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013569,
        "dEQP-GLES3.functional.shaders.operator.int_c",
        "ompare.greaterThanEqual.highp_ivec4_fragment");
