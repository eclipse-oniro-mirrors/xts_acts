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

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017229,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.texelfetchoffset.sampler2d_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017230,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.texelfetchoffset.sampler2d_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017231,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.texelfetchoffset.sampler2d_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017232,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.texelfetchoffset.sampler2d_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017233,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texelfetchoffset.isampler2d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017234,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.texelfetchoffset.isampler2d_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017235,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texelfetchoffset.usampler2d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017236,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.texelfetchoffset.usampler2d_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017237,
        "dEQP-GLES3.functional.shaders.texture_function",
        "s.texelfetchoffset.sampler2darray_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017238,
        "dEQP-GLES3.functional.shaders.texture_functions",
        ".texelfetchoffset.sampler2darray_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017239,
        "dEQP-GLES3.functional.shaders.texture_function",
        "s.texelfetchoffset.sampler2darray_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017240,
        "dEQP-GLES3.functional.shaders.texture_functions",
        ".texelfetchoffset.sampler2darray_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017241,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.texelfetchoffset.isampler2darray_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017242,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.texelfetchoffset.isampler2darray_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017243,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.texelfetchoffset.usampler2darray_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017244,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.texelfetchoffset.usampler2darray_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017245,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.texelfetchoffset.sampler3d_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017246,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.texelfetchoffset.sampler3d_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017247,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.texelfetchoffset.sampler3d_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017248,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.texelfetchoffset.sampler3d_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017249,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texelfetchoffset.isampler3d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017250,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.texelfetchoffset.isampler3d_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017251,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texelfetchoffset.usampler3d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017252,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.texelfetchoffset.usampler3d_fragment");
