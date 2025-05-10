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

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016880,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.textureoffset.sampler2d_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016881,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.textureoffset.sampler2d_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016882,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.textureoffset.sampler2d_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016883,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.textureoffset.sampler2d_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016884,
        "dEQP-GLES3.functional.shaders.texture_f",
        "unctions.textureoffset.isampler2d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016885,
        "dEQP-GLES3.functional.shaders.texture_fu",
        "nctions.textureoffset.isampler2d_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016886,
        "dEQP-GLES3.functional.shaders.texture_f",
        "unctions.textureoffset.usampler2d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016887,
        "dEQP-GLES3.functional.shaders.texture_fu",
        "nctions.textureoffset.usampler2d_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016888,
        "dEQP-GLES3.functional.shaders.texture_functio",
        "ns.textureoffset.sampler2d_bias_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016889,
        "dEQP-GLES3.functional.shaders.texture_functio",
        "ns.textureoffset.sampler2d_bias_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016890,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.textureoffset.isampler2d_bias_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016891,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.textureoffset.usampler2d_bias_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016892,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.textureoffset.sampler2darray_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016893,
        "dEQP-GLES3.functional.shaders.texture_functio",
        "ns.textureoffset.sampler2darray_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016894,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.textureoffset.sampler2darray_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016895,
        "dEQP-GLES3.functional.shaders.texture_functio",
        "ns.textureoffset.sampler2darray_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016896,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.textureoffset.isampler2darray_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016897,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.textureoffset.isampler2darray_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016898,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.textureoffset.usampler2darray_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016899,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.textureoffset.usampler2darray_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016900,
        "dEQP-GLES3.functional.shaders.texture_functions.",
        "textureoffset.sampler2darray_bias_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016901,
        "dEQP-GLES3.functional.shaders.texture_functions.",
        "textureoffset.sampler2darray_bias_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016902,
        "dEQP-GLES3.functional.shaders.texture_functio",
        "ns.textureoffset.isampler2darray_bias_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016903,
        "dEQP-GLES3.functional.shaders.texture_functio",
        "ns.textureoffset.usampler2darray_bias_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016904,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.textureoffset.sampler3d_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016905,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.textureoffset.sampler3d_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016906,
        "dEQP-GLES3.functional.shaders.texture_f",
        "unctions.textureoffset.usampler3d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016907,
        "dEQP-GLES3.functional.shaders.texture_functio",
        "ns.textureoffset.sampler3d_bias_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016908,
        "dEQP-GLES3.functional.shaders.texture_functio",
        "ns.textureoffset.sampler3d_bias_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016909,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.textureoffset.isampler3d_bias_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016910,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.textureoffset.usampler3d_bias_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016911,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.textureoffset.sampler2dshadow_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016912,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.textureoffset.sampler2dshadow_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016913,
        "dEQP-GLES3.functional.shaders.texture_functio",
        "ns.textureoffset.sampler2dshadow_bias_fragment");
