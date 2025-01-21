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
#include "../ActsDeqpgles30005TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004349,
        "dEQP-GLES3.functional.shaders.a",
        "rrays.constructor.float3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004350,
        "dEQP-GLES3.functional.shaders.ar",
        "rays.constructor.float3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004351,
        "dEQP-GLES3.functional.shaders.a",
        "rrays.constructor.float4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004352,
        "dEQP-GLES3.functional.shaders.ar",
        "rays.constructor.float4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004353,
        "dEQP-GLES3.functional.shaders.",
        "arrays.constructor.int3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004354,
        "dEQP-GLES3.functional.shaders.a",
        "rrays.constructor.int3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004355,
        "dEQP-GLES3.functional.shaders.",
        "arrays.constructor.int4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004356,
        "dEQP-GLES3.functional.shaders.a",
        "rrays.constructor.int4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004357,
        "dEQP-GLES3.functional.shaders.",
        "arrays.constructor.bool3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004358,
        "dEQP-GLES3.functional.shaders.a",
        "rrays.constructor.bool3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004359,
        "dEQP-GLES3.functional.shaders.",
        "arrays.constructor.bool4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004360,
        "dEQP-GLES3.functional.shaders.a",
        "rrays.constructor.bool4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004361,
        "dEQP-GLES3.functional.shaders.a",
        "rrays.constructor.struct3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004362,
        "dEQP-GLES3.functional.shaders.ar",
        "rays.constructor.struct3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004363,
        "dEQP-GLES3.functional.shaders.a",
        "rrays.constructor.struct4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004364,
        "dEQP-GLES3.functional.shaders.ar",
        "rays.constructor.struct4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004365,
        "dEQP-GLES3.functional.shaders.arr",
        "ays.constructor.float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004366,
        "dEQP-GLES3.functional.shaders.arra",
        "ys.constructor.float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004367,
        "dEQP-GLES3.functional.shaders.ar",
        "rays.constructor.int_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004368,
        "dEQP-GLES3.functional.shaders.arr",
        "ays.constructor.int_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004369,
        "dEQP-GLES3.functional.shaders.ar",
        "rays.constructor.bool_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004370,
        "dEQP-GLES3.functional.shaders.arr",
        "ays.constructor.bool_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004371,
        "dEQP-GLES3.functional.shaders.arr",
        "ays.constructor.float_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004372,
        "dEQP-GLES3.functional.shaders.arra",
        "ys.constructor.float_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004373,
        "dEQP-GLES3.functional.shaders.ar",
        "rays.constructor.int_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004374,
        "dEQP-GLES3.functional.shaders.arr",
        "ays.constructor.int_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004375,
        "dEQP-GLES3.functional.shaders.ar",
        "rays.constructor.bool_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004376,
        "dEQP-GLES3.functional.shaders.arr",
        "ays.constructor.bool_mat3_fragment");
