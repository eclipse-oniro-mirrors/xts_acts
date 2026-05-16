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
#include "../ActsDeqpgles30018TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017153,
        "dEQP-GLES3.functional.shaders.texture_functio",
        "ns.textureprojgrad.sampler2d_vec3_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017154,
        "dEQP-GLES3.functional.shaders.texture_function",
        "s.textureprojgrad.sampler2d_vec3_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017155,
        "dEQP-GLES3.functional.shaders.texture_functio",
        "ns.textureprojgrad.sampler2d_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017156,
        "dEQP-GLES3.functional.shaders.texture_function",
        "s.textureprojgrad.sampler2d_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017157,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.textureprojgrad.isampler2d_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017158,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.textureprojgrad.isampler2d_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017159,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.textureprojgrad.usampler2d_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017160,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.textureprojgrad.usampler2d_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017161,
        "dEQP-GLES3.functional.shaders.texture_functio",
        "ns.textureprojgrad.sampler2d_vec4_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017162,
        "dEQP-GLES3.functional.shaders.texture_function",
        "s.textureprojgrad.sampler2d_vec4_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017163,
        "dEQP-GLES3.functional.shaders.texture_functio",
        "ns.textureprojgrad.sampler2d_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017164,
        "dEQP-GLES3.functional.shaders.texture_function",
        "s.textureprojgrad.sampler2d_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017165,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.textureprojgrad.isampler2d_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017166,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.textureprojgrad.isampler2d_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017167,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.textureprojgrad.usampler2d_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017168,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.textureprojgrad.usampler2d_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017169,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.textureprojgrad.sampler3d_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017170,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.textureprojgrad.sampler3d_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017171,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.textureprojgrad.sampler3d_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017172,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.textureprojgrad.sampler3d_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017173,
        "dEQP-GLES3.functional.shaders.texture_fu",
        "nctions.textureprojgrad.isampler3d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017174,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.textureprojgrad.isampler3d_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017175,
        "dEQP-GLES3.functional.shaders.texture_fu",
        "nctions.textureprojgrad.usampler3d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017176,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.textureprojgrad.usampler3d_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017177,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.textureprojgrad.sampler2dshadow_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017178,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.textureprojgrad.sampler2dshadow_fragment");
