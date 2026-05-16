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
#include "../ActsDeqpgles30017TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016953,
        "dEQP-GLES3.functional.shaders.texture_function",
        "s.textureprojoffset.sampler2d_vec3_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016954,
        "dEQP-GLES3.functional.shaders.texture_functions",
        ".textureprojoffset.sampler2d_vec3_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016955,
        "dEQP-GLES3.functional.shaders.texture_function",
        "s.textureprojoffset.sampler2d_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016956,
        "dEQP-GLES3.functional.shaders.texture_functions",
        ".textureprojoffset.sampler2d_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016957,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.textureprojoffset.isampler2d_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016958,
        "dEQP-GLES3.functional.shaders.texture_functio",
        "ns.textureprojoffset.isampler2d_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016959,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.textureprojoffset.usampler2d_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016960,
        "dEQP-GLES3.functional.shaders.texture_functio",
        "ns.textureprojoffset.usampler2d_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016961,
        "dEQP-GLES3.functional.shaders.texture_functions.te",
        "xtureprojoffset.sampler2d_vec3_bias_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016962,
        "dEQP-GLES3.functional.shaders.texture_functions.te",
        "xtureprojoffset.sampler2d_vec3_bias_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016963,
        "dEQP-GLES3.functional.shaders.texture_functions",
        ".textureprojoffset.isampler2d_vec3_bias_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016964,
        "dEQP-GLES3.functional.shaders.texture_functions",
        ".textureprojoffset.usampler2d_vec3_bias_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016965,
        "dEQP-GLES3.functional.shaders.texture_function",
        "s.textureprojoffset.sampler2d_vec4_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016966,
        "dEQP-GLES3.functional.shaders.texture_functions",
        ".textureprojoffset.sampler2d_vec4_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016967,
        "dEQP-GLES3.functional.shaders.texture_function",
        "s.textureprojoffset.sampler2d_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016968,
        "dEQP-GLES3.functional.shaders.texture_functions",
        ".textureprojoffset.sampler2d_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016969,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.textureprojoffset.isampler2d_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016970,
        "dEQP-GLES3.functional.shaders.texture_functio",
        "ns.textureprojoffset.isampler2d_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016971,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.textureprojoffset.usampler2d_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016972,
        "dEQP-GLES3.functional.shaders.texture_functio",
        "ns.textureprojoffset.usampler2d_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016973,
        "dEQP-GLES3.functional.shaders.texture_functions.te",
        "xtureprojoffset.sampler2d_vec4_bias_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016974,
        "dEQP-GLES3.functional.shaders.texture_functions.te",
        "xtureprojoffset.sampler2d_vec4_bias_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016975,
        "dEQP-GLES3.functional.shaders.texture_functions",
        ".textureprojoffset.isampler2d_vec4_bias_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016976,
        "dEQP-GLES3.functional.shaders.texture_functions",
        ".textureprojoffset.usampler2d_vec4_bias_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016977,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.textureprojoffset.sampler3d_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016978,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.textureprojoffset.sampler3d_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016979,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.textureprojoffset.isampler3d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016980,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.textureprojoffset.usampler3d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016981,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.textureprojoffset.sampler2dshadow_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016982,
        "dEQP-GLES3.functional.shaders.texture_functio",
        "ns.textureprojoffset.sampler2dshadow_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016983,
        "dEQP-GLES3.functional.shaders.texture_functions",
        ".textureprojoffset.sampler2dshadow_bias_fragment");
