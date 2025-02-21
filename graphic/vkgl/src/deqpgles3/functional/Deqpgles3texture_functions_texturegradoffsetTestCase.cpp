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

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017125,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.texturegradoffset.sampler2d_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017126,
        "dEQP-GLES3.functional.shaders.texture_functio",
        "ns.texturegradoffset.sampler2d_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017127,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.texturegradoffset.sampler2d_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017128,
        "dEQP-GLES3.functional.shaders.texture_functio",
        "ns.texturegradoffset.sampler2d_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017129,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texturegradoffset.isampler2d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017130,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.texturegradoffset.isampler2d_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017131,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texturegradoffset.usampler2d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017132,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.texturegradoffset.usampler2d_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017133,
        "dEQP-GLES3.functional.shaders.texture_function",
        "s.texturegradoffset.sampler2darray_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017134,
        "dEQP-GLES3.functional.shaders.texture_functions",
        ".texturegradoffset.sampler2darray_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017135,
        "dEQP-GLES3.functional.shaders.texture_function",
        "s.texturegradoffset.sampler2darray_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017136,
        "dEQP-GLES3.functional.shaders.texture_functions",
        ".texturegradoffset.sampler2darray_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017137,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.texturegradoffset.isampler2darray_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017138,
        "dEQP-GLES3.functional.shaders.texture_functio",
        "ns.texturegradoffset.isampler2darray_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017139,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.texturegradoffset.usampler2darray_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017140,
        "dEQP-GLES3.functional.shaders.texture_functio",
        "ns.texturegradoffset.usampler2darray_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017141,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.texturegradoffset.sampler3d_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017142,
        "dEQP-GLES3.functional.shaders.texture_functio",
        "ns.texturegradoffset.sampler3d_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017143,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.texturegradoffset.sampler3d_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017144,
        "dEQP-GLES3.functional.shaders.texture_functio",
        "ns.texturegradoffset.sampler3d_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017145,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texturegradoffset.isampler3d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017146,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.texturegradoffset.isampler3d_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017147,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texturegradoffset.usampler3d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017148,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.texturegradoffset.usampler3d_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017149,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.texturegradoffset.sampler2dshadow_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017150,
        "dEQP-GLES3.functional.shaders.texture_functio",
        "ns.texturegradoffset.sampler2dshadow_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017151,
        "dEQP-GLES3.functional.shaders.texture_function",
        "s.texturegradoffset.sampler2darrayshadow_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017152,
        "dEQP-GLES3.functional.shaders.texture_functions",
        ".texturegradoffset.sampler2darrayshadow_fragment");
