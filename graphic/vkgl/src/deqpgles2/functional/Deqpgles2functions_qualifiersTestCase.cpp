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

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002039,
        "dEQP-GLES2.functional.shaders.fun",
        "ctions.qualifiers.in_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002040,
        "dEQP-GLES2.functional.shaders.func",
        "tions.qualifiers.in_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002041,
        "dEQP-GLES2.functional.shaders.fun",
        "ctions.qualifiers.out_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002042,
        "dEQP-GLES2.functional.shaders.func",
        "tions.qualifiers.out_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002043,
        "dEQP-GLES2.functional.shaders.func",
        "tions.qualifiers.inout_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002044,
        "dEQP-GLES2.functional.shaders.funct",
        "ions.qualifiers.inout_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002045,
        "dEQP-GLES2.functional.shaders.funct",
        "ions.qualifiers.in_lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002046,
        "dEQP-GLES2.functional.shaders.functi",
        "ons.qualifiers.in_lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002047,
        "dEQP-GLES2.functional.shaders.functi",
        "ons.qualifiers.out_lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002048,
        "dEQP-GLES2.functional.shaders.functio",
        "ns.qualifiers.out_lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002049,
        "dEQP-GLES2.functional.shaders.functio",
        "ns.qualifiers.inout_lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002050,
        "dEQP-GLES2.functional.shaders.function",
        "s.qualifiers.inout_lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002051,
        "dEQP-GLES2.functional.shaders.functi",
        "ons.qualifiers.in_highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002052,
        "dEQP-GLES2.functional.shaders.functio",
        "ns.qualifiers.in_highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002053,
        "dEQP-GLES2.functional.shaders.functi",
        "ons.qualifiers.out_highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002054,
        "dEQP-GLES2.functional.shaders.functio",
        "ns.qualifiers.out_highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002055,
        "dEQP-GLES2.functional.shaders.functio",
        "ns.qualifiers.inout_highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002056,
        "dEQP-GLES2.functional.shaders.function",
        "s.qualifiers.inout_highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002057,
        "dEQP-GLES2.functional.shaders.func",
        "tions.qualifiers.const_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002058,
        "dEQP-GLES2.functional.shaders.funct",
        "ions.qualifiers.const_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002059,
        "dEQP-GLES2.functional.shaders.functi",
        "ons.qualifiers.const_in_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002060,
        "dEQP-GLES2.functional.shaders.functio",
        "ns.qualifiers.const_in_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002061,
        "dEQP-GLES2.functional.shaders.fu",
        "nctions.qualifiers.in_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002062,
        "dEQP-GLES2.functional.shaders.fun",
        "ctions.qualifiers.in_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002063,
        "dEQP-GLES2.functional.shaders.fu",
        "nctions.qualifiers.out_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002064,
        "dEQP-GLES2.functional.shaders.fun",
        "ctions.qualifiers.out_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002065,
        "dEQP-GLES2.functional.shaders.fun",
        "ctions.qualifiers.inout_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002066,
        "dEQP-GLES2.functional.shaders.func",
        "tions.qualifiers.inout_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002067,
        "dEQP-GLES2.functional.shaders.func",
        "tions.qualifiers.in_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002068,
        "dEQP-GLES2.functional.shaders.funct",
        "ions.qualifiers.in_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002069,
        "dEQP-GLES2.functional.shaders.funct",
        "ions.qualifiers.out_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002070,
        "dEQP-GLES2.functional.shaders.functi",
        "ons.qualifiers.out_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002071,
        "dEQP-GLES2.functional.shaders.functi",
        "ons.qualifiers.inout_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002072,
        "dEQP-GLES2.functional.shaders.functio",
        "ns.qualifiers.inout_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002073,
        "dEQP-GLES2.functional.shaders.funct",
        "ions.qualifiers.in_highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002074,
        "dEQP-GLES2.functional.shaders.functi",
        "ons.qualifiers.in_highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002075,
        "dEQP-GLES2.functional.shaders.funct",
        "ions.qualifiers.out_highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002076,
        "dEQP-GLES2.functional.shaders.functi",
        "ons.qualifiers.out_highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002077,
        "dEQP-GLES2.functional.shaders.functi",
        "ons.qualifiers.inout_highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002078,
        "dEQP-GLES2.functional.shaders.functio",
        "ns.qualifiers.inout_highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002079,
        "dEQP-GLES2.functional.shaders.fun",
        "ctions.qualifiers.const_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002080,
        "dEQP-GLES2.functional.shaders.func",
        "tions.qualifiers.const_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002081,
        "dEQP-GLES2.functional.shaders.funct",
        "ions.qualifiers.const_in_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002082,
        "dEQP-GLES2.functional.shaders.functi",
        "ons.qualifiers.const_in_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002083,
        "dEQP-GLES2.functional.shaders.fu",
        "nctions.qualifiers.in_bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002084,
        "dEQP-GLES2.functional.shaders.fun",
        "ctions.qualifiers.in_bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002085,
        "dEQP-GLES2.functional.shaders.fun",
        "ctions.qualifiers.out_bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002086,
        "dEQP-GLES2.functional.shaders.func",
        "tions.qualifiers.out_bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002087,
        "dEQP-GLES2.functional.shaders.func",
        "tions.qualifiers.inout_bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002088,
        "dEQP-GLES2.functional.shaders.funct",
        "ions.qualifiers.inout_bool_fragment");
