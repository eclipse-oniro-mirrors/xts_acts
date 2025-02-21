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

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004101,
        "dEQP-GLES3.functional.shaders.fun",
        "ctions.qualifiers.in_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004102,
        "dEQP-GLES3.functional.shaders.func",
        "tions.qualifiers.in_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004103,
        "dEQP-GLES3.functional.shaders.fun",
        "ctions.qualifiers.out_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004104,
        "dEQP-GLES3.functional.shaders.func",
        "tions.qualifiers.out_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004105,
        "dEQP-GLES3.functional.shaders.func",
        "tions.qualifiers.inout_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004106,
        "dEQP-GLES3.functional.shaders.funct",
        "ions.qualifiers.inout_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004107,
        "dEQP-GLES3.functional.shaders.funct",
        "ions.qualifiers.in_lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004108,
        "dEQP-GLES3.functional.shaders.functi",
        "ons.qualifiers.in_lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004109,
        "dEQP-GLES3.functional.shaders.functi",
        "ons.qualifiers.out_lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004110,
        "dEQP-GLES3.functional.shaders.functio",
        "ns.qualifiers.out_lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004111,
        "dEQP-GLES3.functional.shaders.functio",
        "ns.qualifiers.inout_lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004112,
        "dEQP-GLES3.functional.shaders.function",
        "s.qualifiers.inout_lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004113,
        "dEQP-GLES3.functional.shaders.functi",
        "ons.qualifiers.in_highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004114,
        "dEQP-GLES3.functional.shaders.functio",
        "ns.qualifiers.in_highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004115,
        "dEQP-GLES3.functional.shaders.functi",
        "ons.qualifiers.out_highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004116,
        "dEQP-GLES3.functional.shaders.functio",
        "ns.qualifiers.out_highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004117,
        "dEQP-GLES3.functional.shaders.functio",
        "ns.qualifiers.inout_highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004118,
        "dEQP-GLES3.functional.shaders.function",
        "s.qualifiers.inout_highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004119,
        "dEQP-GLES3.functional.shaders.func",
        "tions.qualifiers.const_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004120,
        "dEQP-GLES3.functional.shaders.funct",
        "ions.qualifiers.const_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004121,
        "dEQP-GLES3.functional.shaders.functi",
        "ons.qualifiers.const_in_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004122,
        "dEQP-GLES3.functional.shaders.functio",
        "ns.qualifiers.const_in_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004123,
        "dEQP-GLES3.functional.shaders.fu",
        "nctions.qualifiers.in_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004124,
        "dEQP-GLES3.functional.shaders.fun",
        "ctions.qualifiers.in_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004125,
        "dEQP-GLES3.functional.shaders.fu",
        "nctions.qualifiers.out_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004126,
        "dEQP-GLES3.functional.shaders.fun",
        "ctions.qualifiers.out_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004127,
        "dEQP-GLES3.functional.shaders.fun",
        "ctions.qualifiers.inout_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004128,
        "dEQP-GLES3.functional.shaders.func",
        "tions.qualifiers.inout_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004129,
        "dEQP-GLES3.functional.shaders.func",
        "tions.qualifiers.in_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004130,
        "dEQP-GLES3.functional.shaders.funct",
        "ions.qualifiers.in_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004131,
        "dEQP-GLES3.functional.shaders.funct",
        "ions.qualifiers.out_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004132,
        "dEQP-GLES3.functional.shaders.functi",
        "ons.qualifiers.out_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004133,
        "dEQP-GLES3.functional.shaders.functi",
        "ons.qualifiers.inout_lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004134,
        "dEQP-GLES3.functional.shaders.functio",
        "ns.qualifiers.inout_lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004135,
        "dEQP-GLES3.functional.shaders.funct",
        "ions.qualifiers.in_highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004136,
        "dEQP-GLES3.functional.shaders.functi",
        "ons.qualifiers.in_highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004137,
        "dEQP-GLES3.functional.shaders.funct",
        "ions.qualifiers.out_highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004138,
        "dEQP-GLES3.functional.shaders.functi",
        "ons.qualifiers.out_highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004139,
        "dEQP-GLES3.functional.shaders.functi",
        "ons.qualifiers.inout_highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004140,
        "dEQP-GLES3.functional.shaders.functio",
        "ns.qualifiers.inout_highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004141,
        "dEQP-GLES3.functional.shaders.fun",
        "ctions.qualifiers.const_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004142,
        "dEQP-GLES3.functional.shaders.func",
        "tions.qualifiers.const_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004143,
        "dEQP-GLES3.functional.shaders.funct",
        "ions.qualifiers.const_in_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004144,
        "dEQP-GLES3.functional.shaders.functi",
        "ons.qualifiers.const_in_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004145,
        "dEQP-GLES3.functional.shaders.fu",
        "nctions.qualifiers.in_bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004146,
        "dEQP-GLES3.functional.shaders.fun",
        "ctions.qualifiers.in_bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004147,
        "dEQP-GLES3.functional.shaders.fun",
        "ctions.qualifiers.out_bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004148,
        "dEQP-GLES3.functional.shaders.func",
        "tions.qualifiers.out_bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004149,
        "dEQP-GLES3.functional.shaders.func",
        "tions.qualifiers.inout_bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004150,
        "dEQP-GLES3.functional.shaders.funct",
        "ions.qualifiers.inout_bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004151,
        "dEQP-GLES3.functional.shaders.func",
        "tions.qualifiers.const_bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004152,
        "dEQP-GLES3.functional.shaders.funct",
        "ions.qualifiers.const_bool_fragment");
