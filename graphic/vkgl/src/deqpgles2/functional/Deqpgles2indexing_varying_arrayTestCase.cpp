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
#include "../ActsDeqpgles20003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002739,
        "dEQP-GLES2.functional.shaders.indexing.va",
        "rying_array.float_static_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002740,
        "dEQP-GLES2.functional.shaders.indexing.var",
        "ying_array.float_static_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002741,
        "dEQP-GLES2.functional.shaders.indexing.varyi",
        "ng_array.float_static_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002742,
        "dEQP-GLES2.functional.shaders.indexing.varyi",
        "ng_array.float_static_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002743,
        "dEQP-GLES2.functional.shaders.indexing.var",
        "ying_array.float_dynamic_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002744,
        "dEQP-GLES2.functional.shaders.indexing.var",
        "ying_array.float_dynamic_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002745,
        "dEQP-GLES2.functional.shaders.indexing.varyi",
        "ng_array.float_dynamic_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002746,
        "dEQP-GLES2.functional.shaders.indexing.varyin",
        "g_array.float_dynamic_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002747,
        "dEQP-GLES2.functional.shaders.indexing.varyi",
        "ng_array.float_static_loop_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002748,
        "dEQP-GLES2.functional.shaders.indexing.varyi",
        "ng_array.float_static_loop_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002749,
        "dEQP-GLES2.functional.shaders.indexing.varying",
        "_array.float_static_loop_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002750,
        "dEQP-GLES2.functional.shaders.indexing.varying_",
        "array.float_static_loop_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002751,
        "dEQP-GLES2.functional.shaders.indexing.varyi",
        "ng_array.float_dynamic_loop_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002752,
        "dEQP-GLES2.functional.shaders.indexing.varyin",
        "g_array.float_dynamic_loop_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002753,
        "dEQP-GLES2.functional.shaders.indexing.varying_",
        "array.float_dynamic_loop_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002754,
        "dEQP-GLES2.functional.shaders.indexing.varying_",
        "array.float_dynamic_loop_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002755,
        "dEQP-GLES2.functional.shaders.indexing.va",
        "rying_array.vec2_static_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002756,
        "dEQP-GLES2.functional.shaders.indexing.va",
        "rying_array.vec2_static_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002757,
        "dEQP-GLES2.functional.shaders.indexing.vary",
        "ing_array.vec2_static_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002758,
        "dEQP-GLES2.functional.shaders.indexing.varyi",
        "ng_array.vec2_static_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002759,
        "dEQP-GLES2.functional.shaders.indexing.va",
        "rying_array.vec2_dynamic_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002760,
        "dEQP-GLES2.functional.shaders.indexing.var",
        "ying_array.vec2_dynamic_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002761,
        "dEQP-GLES2.functional.shaders.indexing.varyi",
        "ng_array.vec2_dynamic_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002762,
        "dEQP-GLES2.functional.shaders.indexing.varyi",
        "ng_array.vec2_dynamic_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002763,
        "dEQP-GLES2.functional.shaders.indexing.vary",
        "ing_array.vec2_static_loop_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002764,
        "dEQP-GLES2.functional.shaders.indexing.varyi",
        "ng_array.vec2_static_loop_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002765,
        "dEQP-GLES2.functional.shaders.indexing.varying",
        "_array.vec2_static_loop_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002766,
        "dEQP-GLES2.functional.shaders.indexing.varying",
        "_array.vec2_static_loop_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002767,
        "dEQP-GLES2.functional.shaders.indexing.varyi",
        "ng_array.vec2_dynamic_loop_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002768,
        "dEQP-GLES2.functional.shaders.indexing.varyi",
        "ng_array.vec2_dynamic_loop_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002769,
        "dEQP-GLES2.functional.shaders.indexing.varying",
        "_array.vec2_dynamic_loop_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002770,
        "dEQP-GLES2.functional.shaders.indexing.varying_",
        "array.vec2_dynamic_loop_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002771,
        "dEQP-GLES2.functional.shaders.indexing.va",
        "rying_array.vec3_static_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002772,
        "dEQP-GLES2.functional.shaders.indexing.va",
        "rying_array.vec3_static_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002773,
        "dEQP-GLES2.functional.shaders.indexing.vary",
        "ing_array.vec3_static_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002774,
        "dEQP-GLES2.functional.shaders.indexing.varyi",
        "ng_array.vec3_static_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002775,
        "dEQP-GLES2.functional.shaders.indexing.va",
        "rying_array.vec3_dynamic_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002776,
        "dEQP-GLES2.functional.shaders.indexing.var",
        "ying_array.vec3_dynamic_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002777,
        "dEQP-GLES2.functional.shaders.indexing.varyi",
        "ng_array.vec3_dynamic_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002778,
        "dEQP-GLES2.functional.shaders.indexing.varyi",
        "ng_array.vec3_dynamic_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002779,
        "dEQP-GLES2.functional.shaders.indexing.vary",
        "ing_array.vec3_static_loop_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002780,
        "dEQP-GLES2.functional.shaders.indexing.varyi",
        "ng_array.vec3_static_loop_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002781,
        "dEQP-GLES2.functional.shaders.indexing.varying",
        "_array.vec3_static_loop_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002782,
        "dEQP-GLES2.functional.shaders.indexing.varying",
        "_array.vec3_static_loop_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002783,
        "dEQP-GLES2.functional.shaders.indexing.varyi",
        "ng_array.vec3_dynamic_loop_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002784,
        "dEQP-GLES2.functional.shaders.indexing.varyi",
        "ng_array.vec3_dynamic_loop_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002785,
        "dEQP-GLES2.functional.shaders.indexing.varying",
        "_array.vec3_dynamic_loop_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002786,
        "dEQP-GLES2.functional.shaders.indexing.varying_",
        "array.vec3_dynamic_loop_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002787,
        "dEQP-GLES2.functional.shaders.indexing.va",
        "rying_array.vec4_static_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002788,
        "dEQP-GLES2.functional.shaders.indexing.va",
        "rying_array.vec4_static_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002789,
        "dEQP-GLES2.functional.shaders.indexing.vary",
        "ing_array.vec4_static_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002790,
        "dEQP-GLES2.functional.shaders.indexing.varyi",
        "ng_array.vec4_static_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002791,
        "dEQP-GLES2.functional.shaders.indexing.va",
        "rying_array.vec4_dynamic_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002792,
        "dEQP-GLES2.functional.shaders.indexing.var",
        "ying_array.vec4_dynamic_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002793,
        "dEQP-GLES2.functional.shaders.indexing.varyi",
        "ng_array.vec4_dynamic_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002794,
        "dEQP-GLES2.functional.shaders.indexing.varyi",
        "ng_array.vec4_dynamic_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002795,
        "dEQP-GLES2.functional.shaders.indexing.vary",
        "ing_array.vec4_static_loop_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002796,
        "dEQP-GLES2.functional.shaders.indexing.varyi",
        "ng_array.vec4_static_loop_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002797,
        "dEQP-GLES2.functional.shaders.indexing.varying",
        "_array.vec4_static_loop_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002798,
        "dEQP-GLES2.functional.shaders.indexing.varying",
        "_array.vec4_static_loop_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002799,
        "dEQP-GLES2.functional.shaders.indexing.varyi",
        "ng_array.vec4_dynamic_loop_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002800,
        "dEQP-GLES2.functional.shaders.indexing.varyi",
        "ng_array.vec4_dynamic_loop_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002801,
        "dEQP-GLES2.functional.shaders.indexing.varying",
        "_array.vec4_dynamic_loop_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002802,
        "dEQP-GLES2.functional.shaders.indexing.varying_",
        "array.vec4_dynamic_loop_write_dynamic_loop_read");
