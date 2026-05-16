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

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016825,
        "dEQP-GLES3.functional.shaders.texture_f",
        "unctions.texture.sampler2d_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016826,
        "dEQP-GLES3.functional.shaders.texture_fu",
        "nctions.texture.sampler2d_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016827,
        "dEQP-GLES3.functional.shaders.texture_f",
        "unctions.texture.sampler2d_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016828,
        "dEQP-GLES3.functional.shaders.texture_fu",
        "nctions.texture.sampler2d_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016829,
        "dEQP-GLES3.functional.shaders.textur",
        "e_functions.texture.isampler2d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016830,
        "dEQP-GLES3.functional.shaders.texture",
        "_functions.texture.isampler2d_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016831,
        "dEQP-GLES3.functional.shaders.textur",
        "e_functions.texture.usampler2d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016832,
        "dEQP-GLES3.functional.shaders.texture",
        "_functions.texture.usampler2d_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016833,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.texture.sampler2d_bias_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016834,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.texture.sampler2d_bias_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016835,
        "dEQP-GLES3.functional.shaders.texture_fu",
        "nctions.texture.isampler2d_bias_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016836,
        "dEQP-GLES3.functional.shaders.texture_fu",
        "nctions.texture.usampler2d_bias_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016837,
        "dEQP-GLES3.functional.shaders.texture_fu",
        "nctions.texture.samplercube_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016838,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texture.samplercube_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016839,
        "dEQP-GLES3.functional.shaders.texture_fu",
        "nctions.texture.samplercube_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016840,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texture.samplercube_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016841,
        "dEQP-GLES3.functional.shaders.texture",
        "_functions.texture.isamplercube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016842,
        "dEQP-GLES3.functional.shaders.texture_",
        "functions.texture.isamplercube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016843,
        "dEQP-GLES3.functional.shaders.texture",
        "_functions.texture.usamplercube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016844,
        "dEQP-GLES3.functional.shaders.texture_",
        "functions.texture.usamplercube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016845,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.texture.samplercube_bias_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016846,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.texture.samplercube_bias_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016847,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texture.isamplercube_bias_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016848,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texture.usamplercube_bias_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016849,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texture.sampler2darray_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016850,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.texture.sampler2darray_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016851,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texture.sampler2darray_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016852,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.texture.sampler2darray_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016853,
        "dEQP-GLES3.functional.shaders.texture_f",
        "unctions.texture.isampler2darray_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016854,
        "dEQP-GLES3.functional.shaders.texture_fu",
        "nctions.texture.isampler2darray_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016855,
        "dEQP-GLES3.functional.shaders.texture_f",
        "unctions.texture.usampler2darray_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016856,
        "dEQP-GLES3.functional.shaders.texture_fu",
        "nctions.texture.usampler2darray_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016857,
        "dEQP-GLES3.functional.shaders.texture_functio",
        "ns.texture.sampler2darray_bias_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016858,
        "dEQP-GLES3.functional.shaders.texture_functio",
        "ns.texture.sampler2darray_bias_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016859,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.texture.isampler2darray_bias_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016860,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.texture.usampler2darray_bias_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016861,
        "dEQP-GLES3.functional.shaders.texture_f",
        "unctions.texture.sampler3d_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016862,
        "dEQP-GLES3.functional.shaders.texture_fu",
        "nctions.texture.sampler3d_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016863,
        "dEQP-GLES3.functional.shaders.texture_f",
        "unctions.texture.sampler3d_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016864,
        "dEQP-GLES3.functional.shaders.texture_fu",
        "nctions.texture.sampler3d_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016865,
        "dEQP-GLES3.functional.shaders.textur",
        "e_functions.texture.isampler3d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016866,
        "dEQP-GLES3.functional.shaders.texture",
        "_functions.texture.isampler3d_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016867,
        "dEQP-GLES3.functional.shaders.textur",
        "e_functions.texture.usampler3d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016868,
        "dEQP-GLES3.functional.shaders.texture",
        "_functions.texture.usampler3d_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016869,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.texture.sampler3d_bias_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016870,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.texture.sampler3d_bias_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016871,
        "dEQP-GLES3.functional.shaders.texture_fu",
        "nctions.texture.isampler3d_bias_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016872,
        "dEQP-GLES3.functional.shaders.texture_fu",
        "nctions.texture.usampler3d_bias_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016873,
        "dEQP-GLES3.functional.shaders.texture_f",
        "unctions.texture.sampler2dshadow_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016874,
        "dEQP-GLES3.functional.shaders.texture_fu",
        "nctions.texture.sampler2dshadow_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016875,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.texture.sampler2dshadow_bias_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016876,
        "dEQP-GLES3.functional.shaders.texture_fu",
        "nctions.texture.samplercubeshadow_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016877,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texture.samplercubeshadow_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016878,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.texture.samplercubeshadow_bias_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016879,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.texture.sampler2darrayshadow_fragment");
