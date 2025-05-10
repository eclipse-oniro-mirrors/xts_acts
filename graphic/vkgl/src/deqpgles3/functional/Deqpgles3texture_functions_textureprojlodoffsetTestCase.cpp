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

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017067,
        "dEQP-GLES3.functional.shaders.texture_functions.",
        "textureprojlodoffset.sampler2d_vec3_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017068,
        "dEQP-GLES3.functional.shaders.texture_functions.t",
        "extureprojlodoffset.sampler2d_vec3_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017069,
        "dEQP-GLES3.functional.shaders.texture_functions.",
        "textureprojlodoffset.sampler2d_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017070,
        "dEQP-GLES3.functional.shaders.texture_functions.t",
        "extureprojlodoffset.sampler2d_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017071,
        "dEQP-GLES3.functional.shaders.texture_functio",
        "ns.textureprojlodoffset.isampler2d_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017072,
        "dEQP-GLES3.functional.shaders.texture_function",
        "s.textureprojlodoffset.isampler2d_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017073,
        "dEQP-GLES3.functional.shaders.texture_functio",
        "ns.textureprojlodoffset.usampler2d_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017074,
        "dEQP-GLES3.functional.shaders.texture_function",
        "s.textureprojlodoffset.usampler2d_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017075,
        "dEQP-GLES3.functional.shaders.texture_functions.",
        "textureprojlodoffset.sampler2d_vec4_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017076,
        "dEQP-GLES3.functional.shaders.texture_functions.t",
        "extureprojlodoffset.sampler2d_vec4_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017077,
        "dEQP-GLES3.functional.shaders.texture_functions.",
        "textureprojlodoffset.sampler2d_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017078,
        "dEQP-GLES3.functional.shaders.texture_functions.t",
        "extureprojlodoffset.sampler2d_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017079,
        "dEQP-GLES3.functional.shaders.texture_functio",
        "ns.textureprojlodoffset.isampler2d_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017080,
        "dEQP-GLES3.functional.shaders.texture_function",
        "s.textureprojlodoffset.isampler2d_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017081,
        "dEQP-GLES3.functional.shaders.texture_functio",
        "ns.textureprojlodoffset.usampler2d_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017082,
        "dEQP-GLES3.functional.shaders.texture_function",
        "s.textureprojlodoffset.usampler2d_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017083,
        "dEQP-GLES3.functional.shaders.texture_functio",
        "ns.textureprojlodoffset.sampler3d_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017084,
        "dEQP-GLES3.functional.shaders.texture_function",
        "s.textureprojlodoffset.sampler3d_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017085,
        "dEQP-GLES3.functional.shaders.texture_function",
        "s.textureprojlodoffset.sampler3d_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017086,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.textureprojlodoffset.isampler3d_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017087,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.textureprojlodoffset.usampler3d_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017088,
        "dEQP-GLES3.functional.shaders.texture_functio",
        "ns.textureprojlodoffset.sampler2dshadow_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017089,
        "dEQP-GLES3.functional.shaders.texture_function",
        "s.textureprojlodoffset.sampler2dshadow_fragment");
