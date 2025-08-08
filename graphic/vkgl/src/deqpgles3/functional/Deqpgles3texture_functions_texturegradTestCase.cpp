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

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017090,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texturegrad.sampler2d_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017091,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.texturegrad.sampler2d_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017092,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texturegrad.sampler2d_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017093,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.texturegrad.sampler2d_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017094,
        "dEQP-GLES3.functional.shaders.texture_",
        "functions.texturegrad.isampler2d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017095,
        "dEQP-GLES3.functional.shaders.texture_f",
        "unctions.texturegrad.isampler2d_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017096,
        "dEQP-GLES3.functional.shaders.texture_",
        "functions.texturegrad.usampler2d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017097,
        "dEQP-GLES3.functional.shaders.texture_f",
        "unctions.texturegrad.usampler2d_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017098,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.texturegrad.samplercube_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017099,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.texturegrad.samplercube_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017100,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.texturegrad.samplercube_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017101,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.texturegrad.samplercube_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017102,
        "dEQP-GLES3.functional.shaders.texture_f",
        "unctions.texturegrad.isamplercube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017103,
        "dEQP-GLES3.functional.shaders.texture_f",
        "unctions.texturegrad.usamplercube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017104,
        "dEQP-GLES3.functional.shaders.texture_fu",
        "nctions.texturegrad.usamplercube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017105,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.texturegrad.sampler2darray_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017106,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.texturegrad.sampler2darray_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017107,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.texturegrad.sampler2darray_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017108,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.texturegrad.sampler2darray_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017109,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texturegrad.isampler2darray_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017110,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.texturegrad.isampler2darray_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017111,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texturegrad.usampler2darray_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017112,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.texturegrad.usampler2darray_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017113,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texturegrad.sampler3d_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017114,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.texturegrad.sampler3d_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017115,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texturegrad.sampler3d_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017116,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.texturegrad.sampler3d_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017117,
        "dEQP-GLES3.functional.shaders.texture_",
        "functions.texturegrad.isampler3d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017118,
        "dEQP-GLES3.functional.shaders.texture_f",
        "unctions.texturegrad.isampler3d_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017119,
        "dEQP-GLES3.functional.shaders.texture_",
        "functions.texturegrad.usampler3d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017120,
        "dEQP-GLES3.functional.shaders.texture_f",
        "unctions.texturegrad.usampler3d_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017121,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texturegrad.sampler2dshadow_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017122,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.texturegrad.sampler2dshadow_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017123,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.texturegrad.sampler2darrayshadow_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017124,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.texturegrad.sampler2darrayshadow_fragment");
