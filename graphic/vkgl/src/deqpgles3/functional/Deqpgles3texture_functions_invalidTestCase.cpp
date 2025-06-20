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

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017291,
        "dEQP-GLES3.functional.shaders.texture_functio",
        "ns.invalid.texture_sampler3dshadow_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017292,
        "dEQP-GLES3.functional.shaders.texture_function",
        "s.invalid.texture_sampler3dshadow_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017293,
        "dEQP-GLES3.functional.shaders.texture_functions.inv",
        "alid.texture_sampler2darrayshadow_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017294,
        "dEQP-GLES3.functional.shaders.texture_functions.inva",
        "lid.texture_sampler2darrayshadow_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017295,
        "dEQP-GLES3.functional.shaders.texture_functio",
        "ns.invalid.textureproj_samplercube_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017296,
        "dEQP-GLES3.functional.shaders.texture_function",
        "s.invalid.textureproj_samplercube_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017297,
        "dEQP-GLES3.functional.shaders.texture_function",
        "s.invalid.textureproj_isamplercube_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017298,
        "dEQP-GLES3.functional.shaders.texture_functions",
        ".invalid.textureproj_isamplercube_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017299,
        "dEQP-GLES3.functional.shaders.texture_function",
        "s.invalid.textureproj_usamplercube_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017300,
        "dEQP-GLES3.functional.shaders.texture_functions",
        ".invalid.textureproj_usamplercube_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017301,
        "dEQP-GLES3.functional.shaders.texture_functions.",
        "invalid.textureproj_samplercube_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017302,
        "dEQP-GLES3.functional.shaders.texture_functions.i",
        "nvalid.textureproj_samplercube_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017303,
        "dEQP-GLES3.functional.shaders.texture_functions.i",
        "nvalid.textureproj_isamplercube_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017304,
        "dEQP-GLES3.functional.shaders.texture_functions.in",
        "valid.textureproj_isamplercube_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017305,
        "dEQP-GLES3.functional.shaders.texture_functions.i",
        "nvalid.textureproj_usamplercube_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017306,
        "dEQP-GLES3.functional.shaders.texture_functions.in",
        "valid.textureproj_usamplercube_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017307,
        "dEQP-GLES3.functional.shaders.texture_functions.in",
        "valid.textureproj_sampler2darrayshadow_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017308,
        "dEQP-GLES3.functional.shaders.texture_functions.inv",
        "alid.textureproj_sampler2darrayshadow_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017309,
        "dEQP-GLES3.functional.shaders.texture_functions.inval",
        "id.textureproj_sampler2darrayshadow_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017310,
        "dEQP-GLES3.functional.shaders.texture_functions.invali",
        "d.textureproj_sampler2darrayshadow_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017311,
        "dEQP-GLES3.functional.shaders.texture_functions.inv",
        "alid.texturelod_samplercubeshadow_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017312,
        "dEQP-GLES3.functional.shaders.texture_functions.inva",
        "lid.texturelod_samplercubeshadow_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017313,
        "dEQP-GLES3.functional.shaders.texture_functions.inva",
        "lid.texturelod_sampler2darrayshadow_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017314,
        "dEQP-GLES3.functional.shaders.texture_functions.inval",
        "id.texturelod_sampler2darrayshadow_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017315,
        "dEQP-GLES3.functional.shaders.texture_functions.i",
        "nvalid.textureoffset_samplercube_vec3_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017316,
        "dEQP-GLES3.functional.shaders.texture_functions.in",
        "valid.textureoffset_samplercube_vec3_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017317,
        "dEQP-GLES3.functional.shaders.texture_functions.in",
        "valid.textureoffset_isamplercube_vec3_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017318,
        "dEQP-GLES3.functional.shaders.texture_functions.inv",
        "alid.textureoffset_isamplercube_vec3_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017319,
        "dEQP-GLES3.functional.shaders.texture_functions.in",
        "valid.textureoffset_usamplercube_vec3_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017320,
        "dEQP-GLES3.functional.shaders.texture_functions.inv",
        "alid.textureoffset_usamplercube_vec3_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017321,
        "dEQP-GLES3.functional.shaders.texture_functions.i",
        "nvalid.textureoffset_samplercube_vec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017322,
        "dEQP-GLES3.functional.shaders.texture_functions.in",
        "valid.textureoffset_samplercube_vec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017323,
        "dEQP-GLES3.functional.shaders.texture_functions.in",
        "valid.textureoffset_isamplercube_vec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017324,
        "dEQP-GLES3.functional.shaders.texture_functions.inv",
        "alid.textureoffset_isamplercube_vec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017325,
        "dEQP-GLES3.functional.shaders.texture_functions.in",
        "valid.textureoffset_usamplercube_vec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017326,
        "dEQP-GLES3.functional.shaders.texture_functions.inv",
        "alid.textureoffset_usamplercube_vec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017327,
        "dEQP-GLES3.functional.shaders.texture_functions.inva",
        "lid.textureoffset_samplercube_vec3_ivec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017328,
        "dEQP-GLES3.functional.shaders.texture_functions.inval",
        "id.textureoffset_samplercube_vec3_ivec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017329,
        "dEQP-GLES3.functional.shaders.texture_functions.inva",
        "lid.textureoffset_samplercube_vec3_ivec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017330,
        "dEQP-GLES3.functional.shaders.texture_functions.inval",
        "id.textureoffset_samplercube_vec3_ivec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017331,
        "dEQP-GLES3.functional.shaders.texture_functions.inv",
        "alid.textureoffset_sampler2darray_vec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017332,
        "dEQP-GLES3.functional.shaders.texture_functions.inva",
        "lid.textureoffset_sampler2darray_vec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017333,
        "dEQP-GLES3.functional.shaders.texture_functions.invali",
        "d.textureoffset_sampler2darray_vec3_ivec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017334,
        "dEQP-GLES3.functional.shaders.texture_functions.invalid",
        ".textureoffset_sampler2darray_vec3_ivec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017335,
        "dEQP-GLES3.functional.shaders.texture_functions.inva",
        "lid.textureoffset_samplercubeshadow_vec4_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017336,
        "dEQP-GLES3.functional.shaders.texture_functions.inval",
        "id.textureoffset_samplercubeshadow_vec4_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017337,
        "dEQP-GLES3.functional.shaders.texture_functions.inva",
        "lid.textureoffset_samplercubeshadow_vec4_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017338,
        "dEQP-GLES3.functional.shaders.texture_functions.inval",
        "id.textureoffset_samplercubeshadow_vec4_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017339,
        "dEQP-GLES3.functional.shaders.texture_functions.invali",
        "d.textureoffset_sampler2darrayshadow_vec4_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017340,
        "dEQP-GLES3.functional.shaders.texture_functions.invalid",
        ".textureoffset_sampler2darrayshadow_vec4_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017341,
        "dEQP-GLES3.functional.shaders.texture_functions.invalid.t",
        "extureoffset_sampler2darrayshadow_vec4_ivec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017342,
        "dEQP-GLES3.functional.shaders.texture_functions.invalid.te",
        "xtureoffset_sampler2darrayshadow_vec4_ivec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017343,
        "dEQP-GLES3.functional.shaders.texture_functions",
        ".invalid.texelfetch_samplercube_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017344,
        "dEQP-GLES3.functional.shaders.texture_functions.",
        "invalid.texelfetch_samplercube_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017345,
        "dEQP-GLES3.functional.shaders.texture_functions.",
        "invalid.texelfetch_isamplercube_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017346,
        "dEQP-GLES3.functional.shaders.texture_functions.i",
        "nvalid.texelfetch_isamplercube_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017347,
        "dEQP-GLES3.functional.shaders.texture_functions.",
        "invalid.texelfetch_usamplercube_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017348,
        "dEQP-GLES3.functional.shaders.texture_functions.i",
        "nvalid.texelfetch_usamplercube_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017349,
        "dEQP-GLES3.functional.shaders.texture_functions.i",
        "nvalid.texelfetch_sampler2dshadow_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017350,
        "dEQP-GLES3.functional.shaders.texture_functions.in",
        "valid.texelfetch_sampler2dshadow_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017351,
        "dEQP-GLES3.functional.shaders.texture_functions.in",
        "valid.texelfetch_samplercubeshadow_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017352,
        "dEQP-GLES3.functional.shaders.texture_functions.inv",
        "alid.texelfetch_samplercubeshadow_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017353,
        "dEQP-GLES3.functional.shaders.texture_functions.inva",
        "lid.texelfetch_sampler2darrayshadow_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017354,
        "dEQP-GLES3.functional.shaders.texture_functions.inval",
        "id.texelfetch_sampler2darrayshadow_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017355,
        "dEQP-GLES3.functional.shaders.texture_functions.in",
        "valid.texelfetch_samplercube_ivec3_int_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017356,
        "dEQP-GLES3.functional.shaders.texture_functions.inv",
        "alid.texelfetch_samplercube_ivec3_int_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017357,
        "dEQP-GLES3.functional.shaders.texture_functions.inva",
        "lid.texelfetch_sampler2dshadow_ivec2_int_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017358,
        "dEQP-GLES3.functional.shaders.texture_functions.inval",
        "id.texelfetch_sampler2dshadow_ivec2_int_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017359,
        "dEQP-GLES3.functional.shaders.texture_functions.inval",
        "id.texelfetch_samplercubeshadow_ivec3_int_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017360,
        "dEQP-GLES3.functional.shaders.texture_functions.invali",
        "d.texelfetch_samplercubeshadow_ivec3_int_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017361,
        "dEQP-GLES3.functional.shaders.texture_functions.invalid",
        ".texelfetch_sampler2darrayshadow_ivec3_int_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017362,
        "dEQP-GLES3.functional.shaders.texture_functions.invalid.",
        "texelfetch_sampler2darrayshadow_ivec3_int_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017363,
        "dEQP-GLES3.functional.shaders.texture_functions.inv",
        "alid.textureprojoffset_samplercube_vec4_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017364,
        "dEQP-GLES3.functional.shaders.texture_functions.inva",
        "lid.textureprojoffset_samplercube_vec4_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017365,
        "dEQP-GLES3.functional.shaders.texture_functions.inv",
        "alid.textureprojoffset_samplercube_vec4_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017366,
        "dEQP-GLES3.functional.shaders.texture_functions.inva",
        "lid.textureprojoffset_samplercube_vec4_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017367,
        "dEQP-GLES3.functional.shaders.texture_functions.invali",
        "d.textureprojoffset_samplercubeshadow_vec4_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017368,
        "dEQP-GLES3.functional.shaders.texture_functions.invalid",
        ".textureprojoffset_samplercubeshadow_vec4_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017369,
        "dEQP-GLES3.functional.shaders.texture_functions.invalid.",
        "textureprojoffset_sampler2darrayshadow_vec4_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017370,
        "dEQP-GLES3.functional.shaders.texture_functions.invalid.t",
        "extureprojoffset_sampler2darrayshadow_vec4_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017371,
        "dEQP-GLES3.functional.shaders.texture_functions.invalid.",
        "textureprojoffset_sampler2darrayshadow_vec4_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017372,
        "dEQP-GLES3.functional.shaders.texture_functions.invalid.t",
        "extureprojoffset_sampler2darrayshadow_vec4_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017373,
        "dEQP-GLES3.functional.shaders.texture_functions.invali",
        "d.texturelodoffset_samplercube_vec3_float_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017374,
        "dEQP-GLES3.functional.shaders.texture_functions.invalid",
        ".texturelodoffset_samplercube_vec3_float_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017375,
        "dEQP-GLES3.functional.shaders.texture_functions.invali",
        "d.texturelodoffset_samplercube_vec3_float_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017376,
        "dEQP-GLES3.functional.shaders.texture_functions.invalid",
        ".texturelodoffset_samplercube_vec3_float_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017377,
        "dEQP-GLES3.functional.shaders.texture_functions.invalid.t",
        "exturelodoffset_samplercubeshadow_vec3_float_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017378,
        "dEQP-GLES3.functional.shaders.texture_functions.invalid.te",
        "xturelodoffset_samplercubeshadow_vec3_float_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017379,
        "dEQP-GLES3.functional.shaders.texture_functions.invalid.te",
        "xturelodoffset_sampler2darrayshadow_vec3_float_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017380,
        "dEQP-GLES3.functional.shaders.texture_functions.invalid.tex",
        "turelodoffset_sampler2darrayshadow_vec3_float_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017381,
        "dEQP-GLES3.functional.shaders.texture_functions.invalid.te",
        "xturelodoffset_sampler2darrayshadow_vec3_float_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017382,
        "dEQP-GLES3.functional.shaders.texture_functions.invalid.tex",
        "turelodoffset_sampler2darrayshadow_vec3_float_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017383,
        "dEQP-GLES3.functional.shaders.texture_functions.in",
        "valid.textureprojlod_samplercube_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017384,
        "dEQP-GLES3.functional.shaders.texture_functions.inv",
        "alid.textureprojlod_samplercube_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017385,
        "dEQP-GLES3.functional.shaders.texture_functions.inv",
        "alid.textureprojlod_sampler2darray_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017386,
        "dEQP-GLES3.functional.shaders.texture_functions.inva",
        "lid.textureprojlod_sampler2darray_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017387,
        "dEQP-GLES3.functional.shaders.texture_functions.invali",
        "d.textureprojlod_sampler2darrayshadow_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017388,
        "dEQP-GLES3.functional.shaders.texture_functions.invalid",
        ".textureprojlod_sampler2darrayshadow_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017389,
        "dEQP-GLES3.functional.shaders.texture_functions.inva",
        "lid.texturegrad_sampler2darray_vec3_vec3_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017390,
        "dEQP-GLES3.functional.shaders.texture_functions.inval",
        "id.texturegrad_sampler2darray_vec3_vec3_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017391,
        "dEQP-GLES3.functional.shaders.texture_functions.invalid.",
        "texturegradoffset_samplercube_vec3_vec3_vec3_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017392,
        "dEQP-GLES3.functional.shaders.texture_functions.invalid.t",
        "exturegradoffset_samplercube_vec3_vec3_vec3_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017393,
        "dEQP-GLES3.functional.shaders.texture_functions.invalid.",
        "texturegradoffset_samplercube_vec3_vec3_vec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017394,
        "dEQP-GLES3.functional.shaders.texture_functions.invalid.t",
        "exturegradoffset_samplercube_vec3_vec3_vec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017395,
        "dEQP-GLES3.functional.shaders.texture_functions.invalid.tex",
        "turegradoffset_samplercubeshadow_vec4_vec3_vec3_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017396,
        "dEQP-GLES3.functional.shaders.texture_functions.invalid.text",
        "uregradoffset_samplercubeshadow_vec4_vec3_vec3_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017397,
        "dEQP-GLES3.functional.shaders.texture_functions.invalid.tex",
        "turegradoffset_samplercubeshadow_vec4_vec3_vec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017398,
        "dEQP-GLES3.functional.shaders.texture_functions.invalid.text",
        "uregradoffset_samplercubeshadow_vec4_vec3_vec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017399,
        "dEQP-GLES3.functional.shaders.texture_functions.inva",
        "lid.textureprojgrad_samplercube_vec4_vec3_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017400,
        "dEQP-GLES3.functional.shaders.texture_functions.inval",
        "id.textureprojgrad_samplercube_vec4_vec3_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017401,
        "dEQP-GLES3.functional.shaders.texture_functions.invali",
        "d.textureprojgrad_sampler2darray_vec4_vec2_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017402,
        "dEQP-GLES3.functional.shaders.texture_functions.invalid",
        ".textureprojgrad_sampler2darray_vec4_vec2_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017403,
        "dEQP-GLES3.functional.shaders.texture_functions.invalid.te",
        "xtureprojgradoffset_samplercube_vec4_vec3_vec3_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017404,
        "dEQP-GLES3.functional.shaders.texture_functions.invalid.tex",
        "tureprojgradoffset_samplercube_vec4_vec3_vec3_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017405,
        "dEQP-GLES3.functional.shaders.texture_functions.invalid.te",
        "xtureprojgradoffset_samplercube_vec4_vec3_vec3_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017406,
        "dEQP-GLES3.functional.shaders.texture_functions.invalid.tex",
        "tureprojgradoffset_samplercube_vec4_vec3_vec3_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017407,
        "dEQP-GLES3.functional.shaders.texture_functions.invalid.text",
        "ureprojgradoffset_sampler2darray_vec4_vec2_vec2_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017408,
        "dEQP-GLES3.functional.shaders.texture_functions.invalid.textu",
        "reprojgradoffset_sampler2darray_vec4_vec2_vec2_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017409,
        "dEQP-GLES3.functional.shaders.texture_functions.invalid.text",
        "ureprojgradoffset_sampler2darray_vec4_vec2_vec2_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017410,
        "dEQP-GLES3.functional.shaders.texture_functions.invalid.textu",
        "reprojgradoffset_sampler2darray_vec4_vec2_vec2_ivec3_fragment");
