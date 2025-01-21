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
#include "../ActsDeqpgles20015TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014043,
        "dEQP-GLES2.functional.uniform_api.",
        "info_query.basic_array.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014044,
        "dEQP-GLES2.functional.uniform_api.i",
        "nfo_query.basic_array.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014045,
        "dEQP-GLES2.functional.uniform_api",
        ".info_query.basic_array.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014046,
        "dEQP-GLES2.functional.uniform_api.",
        "info_query.basic_array.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014047,
        "dEQP-GLES2.functional.uniform_api.i",
        "nfo_query.basic_array.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014048,
        "dEQP-GLES2.functional.uniform_api",
        ".info_query.basic_array.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014049,
        "dEQP-GLES2.functional.uniform_api.",
        "info_query.basic_array.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014050,
        "dEQP-GLES2.functional.uniform_api.i",
        "nfo_query.basic_array.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014051,
        "dEQP-GLES2.functional.uniform_api",
        ".info_query.basic_array.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014052,
        "dEQP-GLES2.functional.uniform_api",
        ".info_query.basic_array.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014053,
        "dEQP-GLES2.functional.uniform_api.",
        "info_query.basic_array.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014054,
        "dEQP-GLES2.functional.uniform_ap",
        "i.info_query.basic_array.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014055,
        "dEQP-GLES2.functional.uniform_api.",
        "info_query.basic_array.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014056,
        "dEQP-GLES2.functional.uniform_api.i",
        "nfo_query.basic_array.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014057,
        "dEQP-GLES2.functional.uniform_api",
        ".info_query.basic_array.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014058,
        "dEQP-GLES2.functional.uniform_api.",
        "info_query.basic_array.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014059,
        "dEQP-GLES2.functional.uniform_api.i",
        "nfo_query.basic_array.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014060,
        "dEQP-GLES2.functional.uniform_api",
        ".info_query.basic_array.bool_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014061,
        "dEQP-GLES2.functional.uniform_api.",
        "info_query.basic_array.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014062,
        "dEQP-GLES2.functional.uniform_api.i",
        "nfo_query.basic_array.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014063,
        "dEQP-GLES2.functional.uniform_api",
        ".info_query.basic_array.bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014064,
        "dEQP-GLES2.functional.uniform_api.in",
        "fo_query.basic_array.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014065,
        "dEQP-GLES2.functional.uniform_api.inf",
        "o_query.basic_array.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20015TestSuite, TestCase_014066,
        "dEQP-GLES2.functional.uniform_api.i",
        "nfo_query.basic_array.sampler2D_both");
