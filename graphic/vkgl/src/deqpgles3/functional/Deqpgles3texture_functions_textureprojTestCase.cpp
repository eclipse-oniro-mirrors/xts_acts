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

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016914,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.textureproj.sampler2d_vec3_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016915,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.textureproj.sampler2d_vec3_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016916,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.textureproj.sampler2d_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016917,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.textureproj.sampler2d_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016918,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.textureproj.isampler2d_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016919,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.textureproj.isampler2d_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016920,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.textureproj.usampler2d_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016921,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.textureproj.usampler2d_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016922,
        "dEQP-GLES3.functional.shaders.texture_functions",
        ".textureproj.sampler2d_vec3_bias_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016923,
        "dEQP-GLES3.functional.shaders.texture_functions",
        ".textureproj.sampler2d_vec3_bias_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016924,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.textureproj.isampler2d_vec3_bias_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016925,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.textureproj.usampler2d_vec3_bias_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016926,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.textureproj.sampler2d_vec4_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016927,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.textureproj.sampler2d_vec4_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016928,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.textureproj.sampler2d_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016929,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.textureproj.sampler2d_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016930,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.textureproj.isampler2d_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016931,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.textureproj.isampler2d_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016932,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.textureproj.usampler2d_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016933,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.textureproj.usampler2d_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016934,
        "dEQP-GLES3.functional.shaders.texture_functions",
        ".textureproj.sampler2d_vec4_bias_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016935,
        "dEQP-GLES3.functional.shaders.texture_functions",
        ".textureproj.sampler2d_vec4_bias_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016936,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.textureproj.isampler2d_vec4_bias_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016937,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.textureproj.usampler2d_vec4_bias_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016938,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.textureproj.sampler3d_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016939,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.textureproj.sampler3d_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016940,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.textureproj.sampler3d_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016941,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.textureproj.sampler3d_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016942,
        "dEQP-GLES3.functional.shaders.texture_",
        "functions.textureproj.isampler3d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016943,
        "dEQP-GLES3.functional.shaders.texture_f",
        "unctions.textureproj.isampler3d_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016944,
        "dEQP-GLES3.functional.shaders.texture_",
        "functions.textureproj.usampler3d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016945,
        "dEQP-GLES3.functional.shaders.texture_f",
        "unctions.textureproj.usampler3d_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016946,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.textureproj.sampler3d_bias_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016947,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.textureproj.sampler3d_bias_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016948,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.textureproj.isampler3d_bias_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016949,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.textureproj.usampler3d_bias_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016950,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.textureproj.sampler2dshadow_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016951,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.textureproj.sampler2dshadow_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016952,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.textureproj.sampler2dshadow_bias_fragment");
