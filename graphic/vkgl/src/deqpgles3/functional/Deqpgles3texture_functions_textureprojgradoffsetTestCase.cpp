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

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017179,
        "dEQP-GLES3.functional.shaders.texture_functions.",
        "textureprojgradoffset.sampler2d_vec3_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017180,
        "dEQP-GLES3.functional.shaders.texture_functions.t",
        "extureprojgradoffset.sampler2d_vec3_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017181,
        "dEQP-GLES3.functional.shaders.texture_functions.",
        "textureprojgradoffset.sampler2d_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017182,
        "dEQP-GLES3.functional.shaders.texture_functions.t",
        "extureprojgradoffset.sampler2d_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017183,
        "dEQP-GLES3.functional.shaders.texture_function",
        "s.textureprojgradoffset.isampler2d_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017184,
        "dEQP-GLES3.functional.shaders.texture_functions",
        ".textureprojgradoffset.isampler2d_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017185,
        "dEQP-GLES3.functional.shaders.texture_function",
        "s.textureprojgradoffset.usampler2d_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017186,
        "dEQP-GLES3.functional.shaders.texture_functions",
        ".textureprojgradoffset.usampler2d_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017187,
        "dEQP-GLES3.functional.shaders.texture_functions.",
        "textureprojgradoffset.sampler2d_vec4_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017188,
        "dEQP-GLES3.functional.shaders.texture_functions.t",
        "extureprojgradoffset.sampler2d_vec4_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017189,
        "dEQP-GLES3.functional.shaders.texture_functions.",
        "textureprojgradoffset.sampler2d_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017190,
        "dEQP-GLES3.functional.shaders.texture_functions.t",
        "extureprojgradoffset.sampler2d_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017191,
        "dEQP-GLES3.functional.shaders.texture_function",
        "s.textureprojgradoffset.isampler2d_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017192,
        "dEQP-GLES3.functional.shaders.texture_functions",
        ".textureprojgradoffset.isampler2d_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017193,
        "dEQP-GLES3.functional.shaders.texture_function",
        "s.textureprojgradoffset.usampler2d_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017194,
        "dEQP-GLES3.functional.shaders.texture_functions",
        ".textureprojgradoffset.usampler2d_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017195,
        "dEQP-GLES3.functional.shaders.texture_function",
        "s.textureprojgradoffset.sampler3d_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017196,
        "dEQP-GLES3.functional.shaders.texture_functions",
        ".textureprojgradoffset.sampler3d_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017197,
        "dEQP-GLES3.functional.shaders.texture_function",
        "s.textureprojgradoffset.sampler3d_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017198,
        "dEQP-GLES3.functional.shaders.texture_functions",
        ".textureprojgradoffset.sampler3d_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017199,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.textureprojgradoffset.isampler3d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017200,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.textureprojgradoffset.isampler3d_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017201,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.textureprojgradoffset.usampler3d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017202,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.textureprojgradoffset.usampler3d_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017203,
        "dEQP-GLES3.functional.shaders.texture_function",
        "s.textureprojgradoffset.sampler2dshadow_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017204,
        "dEQP-GLES3.functional.shaders.texture_functions",
        ".textureprojgradoffset.sampler2dshadow_fragment");
