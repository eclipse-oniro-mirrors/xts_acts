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

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017041,
        "dEQP-GLES3.functional.shaders.texture_functio",
        "ns.textureprojlod.sampler2d_vec3_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017042,
        "dEQP-GLES3.functional.shaders.texture_function",
        "s.textureprojlod.sampler2d_vec3_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017043,
        "dEQP-GLES3.functional.shaders.texture_functio",
        "ns.textureprojlod.sampler2d_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017044,
        "dEQP-GLES3.functional.shaders.texture_function",
        "s.textureprojlod.sampler2d_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017045,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.textureprojlod.isampler2d_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017046,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.textureprojlod.isampler2d_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017047,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.textureprojlod.usampler2d_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017048,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.textureprojlod.usampler2d_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017049,
        "dEQP-GLES3.functional.shaders.texture_functio",
        "ns.textureprojlod.sampler2d_vec4_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017050,
        "dEQP-GLES3.functional.shaders.texture_function",
        "s.textureprojlod.sampler2d_vec4_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017051,
        "dEQP-GLES3.functional.shaders.texture_functio",
        "ns.textureprojlod.sampler2d_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017052,
        "dEQP-GLES3.functional.shaders.texture_function",
        "s.textureprojlod.sampler2d_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017053,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.textureprojlod.isampler2d_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017054,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.textureprojlod.isampler2d_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017055,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.textureprojlod.usampler2d_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017056,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.textureprojlod.usampler2d_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017057,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.textureprojlod.sampler3d_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017058,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.textureprojlod.sampler3d_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017059,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.textureprojlod.sampler3d_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017060,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.textureprojlod.sampler3d_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017061,
        "dEQP-GLES3.functional.shaders.texture_fu",
        "nctions.textureprojlod.isampler3d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017062,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.textureprojlod.isampler3d_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017063,
        "dEQP-GLES3.functional.shaders.texture_fu",
        "nctions.textureprojlod.usampler3d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017064,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.textureprojlod.usampler3d_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017065,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.textureprojlod.sampler2dshadow_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017066,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.textureprojlod.sampler2dshadow_fragment");
