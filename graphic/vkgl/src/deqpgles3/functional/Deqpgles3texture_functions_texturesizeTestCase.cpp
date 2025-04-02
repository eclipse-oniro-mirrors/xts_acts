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

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017253,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texturesize.sampler2d_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017254,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.texturesize.sampler2d_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017255,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texturesize.sampler2d_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017256,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.texturesize.sampler2d_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017257,
        "dEQP-GLES3.functional.shaders.texture_",
        "functions.texturesize.isampler2d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017258,
        "dEQP-GLES3.functional.shaders.texture_f",
        "unctions.texturesize.isampler2d_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017259,
        "dEQP-GLES3.functional.shaders.texture_",
        "functions.texturesize.usampler2d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017260,
        "dEQP-GLES3.functional.shaders.texture_f",
        "unctions.texturesize.usampler2d_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017261,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texturesize.sampler2dshadow_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017262,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.texturesize.sampler2dshadow_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017263,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texturesize.sampler3d_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017264,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.texturesize.sampler3d_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017265,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texturesize.sampler3d_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017266,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.texturesize.sampler3d_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017267,
        "dEQP-GLES3.functional.shaders.texture_",
        "functions.texturesize.isampler3d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017268,
        "dEQP-GLES3.functional.shaders.texture_f",
        "unctions.texturesize.isampler3d_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017269,
        "dEQP-GLES3.functional.shaders.texture_",
        "functions.texturesize.usampler3d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017270,
        "dEQP-GLES3.functional.shaders.texture_f",
        "unctions.texturesize.usampler3d_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017271,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.texturesize.samplercube_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017272,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.texturesize.samplercube_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017273,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.texturesize.samplercube_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017274,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.texturesize.samplercube_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017275,
        "dEQP-GLES3.functional.shaders.texture_f",
        "unctions.texturesize.isamplercube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017276,
        "dEQP-GLES3.functional.shaders.texture_fu",
        "nctions.texturesize.isamplercube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017277,
        "dEQP-GLES3.functional.shaders.texture_f",
        "unctions.texturesize.usamplercube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017278,
        "dEQP-GLES3.functional.shaders.texture_fu",
        "nctions.texturesize.usamplercube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017279,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.texturesize.samplercubeshadow_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017280,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.texturesize.samplercubeshadow_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017281,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.texturesize.sampler2darray_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017282,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.texturesize.sampler2darray_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017283,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.texturesize.sampler2darray_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017284,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.texturesize.sampler2darray_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017285,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texturesize.isampler2darray_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017286,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.texturesize.isampler2darray_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017287,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texturesize.usampler2darray_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017288,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.texturesize.usampler2darray_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017289,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.texturesize.sampler2darrayshadow_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017290,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.texturesize.sampler2darrayshadow_fragment");
