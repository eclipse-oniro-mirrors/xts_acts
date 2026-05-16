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
#include "../ActsDeqpgles30006TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005951,
        "dEQP-GLES3.functional.shaders.indexing.va",
        "rying_array.float_static_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005952,
        "dEQP-GLES3.functional.shaders.indexing.var",
        "ying_array.float_static_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005953,
        "dEQP-GLES3.functional.shaders.indexing.varyi",
        "ng_array.float_static_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005954,
        "dEQP-GLES3.functional.shaders.indexing.varyi",
        "ng_array.float_static_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005955,
        "dEQP-GLES3.functional.shaders.indexing.var",
        "ying_array.float_dynamic_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005956,
        "dEQP-GLES3.functional.shaders.indexing.var",
        "ying_array.float_dynamic_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005957,
        "dEQP-GLES3.functional.shaders.indexing.varyi",
        "ng_array.float_dynamic_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005958,
        "dEQP-GLES3.functional.shaders.indexing.varyin",
        "g_array.float_dynamic_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005959,
        "dEQP-GLES3.functional.shaders.indexing.varyi",
        "ng_array.float_static_loop_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005960,
        "dEQP-GLES3.functional.shaders.indexing.varyi",
        "ng_array.float_static_loop_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005961,
        "dEQP-GLES3.functional.shaders.indexing.varying",
        "_array.float_static_loop_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005962,
        "dEQP-GLES3.functional.shaders.indexing.varying_",
        "array.float_static_loop_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005963,
        "dEQP-GLES3.functional.shaders.indexing.varyi",
        "ng_array.float_dynamic_loop_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005964,
        "dEQP-GLES3.functional.shaders.indexing.varyin",
        "g_array.float_dynamic_loop_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005965,
        "dEQP-GLES3.functional.shaders.indexing.varying_",
        "array.float_dynamic_loop_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005966,
        "dEQP-GLES3.functional.shaders.indexing.varying_",
        "array.float_dynamic_loop_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005967,
        "dEQP-GLES3.functional.shaders.indexing.va",
        "rying_array.vec2_static_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005968,
        "dEQP-GLES3.functional.shaders.indexing.va",
        "rying_array.vec2_static_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005969,
        "dEQP-GLES3.functional.shaders.indexing.vary",
        "ing_array.vec2_static_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005970,
        "dEQP-GLES3.functional.shaders.indexing.varyi",
        "ng_array.vec2_static_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005971,
        "dEQP-GLES3.functional.shaders.indexing.va",
        "rying_array.vec2_dynamic_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005972,
        "dEQP-GLES3.functional.shaders.indexing.var",
        "ying_array.vec2_dynamic_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005973,
        "dEQP-GLES3.functional.shaders.indexing.varyi",
        "ng_array.vec2_dynamic_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005974,
        "dEQP-GLES3.functional.shaders.indexing.varyi",
        "ng_array.vec2_dynamic_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005975,
        "dEQP-GLES3.functional.shaders.indexing.vary",
        "ing_array.vec2_static_loop_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005976,
        "dEQP-GLES3.functional.shaders.indexing.varyi",
        "ng_array.vec2_static_loop_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005977,
        "dEQP-GLES3.functional.shaders.indexing.varying",
        "_array.vec2_static_loop_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005978,
        "dEQP-GLES3.functional.shaders.indexing.varying",
        "_array.vec2_static_loop_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005979,
        "dEQP-GLES3.functional.shaders.indexing.varyi",
        "ng_array.vec2_dynamic_loop_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005980,
        "dEQP-GLES3.functional.shaders.indexing.varyi",
        "ng_array.vec2_dynamic_loop_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005981,
        "dEQP-GLES3.functional.shaders.indexing.varying",
        "_array.vec2_dynamic_loop_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005982,
        "dEQP-GLES3.functional.shaders.indexing.varying_",
        "array.vec2_dynamic_loop_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005983,
        "dEQP-GLES3.functional.shaders.indexing.va",
        "rying_array.vec3_static_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005984,
        "dEQP-GLES3.functional.shaders.indexing.va",
        "rying_array.vec3_static_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005985,
        "dEQP-GLES3.functional.shaders.indexing.vary",
        "ing_array.vec3_static_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005986,
        "dEQP-GLES3.functional.shaders.indexing.varyi",
        "ng_array.vec3_static_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005987,
        "dEQP-GLES3.functional.shaders.indexing.va",
        "rying_array.vec3_dynamic_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005988,
        "dEQP-GLES3.functional.shaders.indexing.var",
        "ying_array.vec3_dynamic_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005989,
        "dEQP-GLES3.functional.shaders.indexing.varyi",
        "ng_array.vec3_dynamic_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005990,
        "dEQP-GLES3.functional.shaders.indexing.varyi",
        "ng_array.vec3_dynamic_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005991,
        "dEQP-GLES3.functional.shaders.indexing.vary",
        "ing_array.vec3_static_loop_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005992,
        "dEQP-GLES3.functional.shaders.indexing.varyi",
        "ng_array.vec3_static_loop_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005993,
        "dEQP-GLES3.functional.shaders.indexing.varying",
        "_array.vec3_static_loop_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005994,
        "dEQP-GLES3.functional.shaders.indexing.varying",
        "_array.vec3_static_loop_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005995,
        "dEQP-GLES3.functional.shaders.indexing.varyi",
        "ng_array.vec3_dynamic_loop_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005996,
        "dEQP-GLES3.functional.shaders.indexing.varyi",
        "ng_array.vec3_dynamic_loop_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005997,
        "dEQP-GLES3.functional.shaders.indexing.varying",
        "_array.vec3_dynamic_loop_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005998,
        "dEQP-GLES3.functional.shaders.indexing.varying_",
        "array.vec3_dynamic_loop_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005999,
        "dEQP-GLES3.functional.shaders.indexing.va",
        "rying_array.vec4_static_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_006000,
        "dEQP-GLES3.functional.shaders.indexing.va",
        "rying_array.vec4_static_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_006001,
        "dEQP-GLES3.functional.shaders.indexing.vary",
        "ing_array.vec4_static_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_006002,
        "dEQP-GLES3.functional.shaders.indexing.varyi",
        "ng_array.vec4_static_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_006003,
        "dEQP-GLES3.functional.shaders.indexing.va",
        "rying_array.vec4_dynamic_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_006004,
        "dEQP-GLES3.functional.shaders.indexing.var",
        "ying_array.vec4_dynamic_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_006005,
        "dEQP-GLES3.functional.shaders.indexing.varyi",
        "ng_array.vec4_dynamic_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_006006,
        "dEQP-GLES3.functional.shaders.indexing.varyi",
        "ng_array.vec4_dynamic_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_006007,
        "dEQP-GLES3.functional.shaders.indexing.vary",
        "ing_array.vec4_static_loop_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_006008,
        "dEQP-GLES3.functional.shaders.indexing.varyi",
        "ng_array.vec4_static_loop_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_006009,
        "dEQP-GLES3.functional.shaders.indexing.varying",
        "_array.vec4_static_loop_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_006010,
        "dEQP-GLES3.functional.shaders.indexing.varying",
        "_array.vec4_static_loop_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_006011,
        "dEQP-GLES3.functional.shaders.indexing.varyi",
        "ng_array.vec4_dynamic_loop_write_static_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_006012,
        "dEQP-GLES3.functional.shaders.indexing.varyi",
        "ng_array.vec4_dynamic_loop_write_dynamic_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_006013,
        "dEQP-GLES3.functional.shaders.indexing.varying",
        "_array.vec4_dynamic_loop_write_static_loop_read");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_006014,
        "dEQP-GLES3.functional.shaders.indexing.varying_",
        "array.vec4_dynamic_loop_write_dynamic_loop_read");
