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

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017205,
        "dEQP-GLES3.functional.shaders.texture_fu",
        "nctions.texelfetch.sampler2d_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017206,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texelfetch.sampler2d_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017207,
        "dEQP-GLES3.functional.shaders.texture_fu",
        "nctions.texelfetch.sampler2d_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017208,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texelfetch.sampler2d_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017209,
        "dEQP-GLES3.functional.shaders.texture_",
        "functions.texelfetch.isampler2d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017210,
        "dEQP-GLES3.functional.shaders.texture_f",
        "unctions.texelfetch.isampler2d_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017211,
        "dEQP-GLES3.functional.shaders.texture_",
        "functions.texelfetch.usampler2d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017212,
        "dEQP-GLES3.functional.shaders.texture_f",
        "unctions.texelfetch.usampler2d_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017213,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.texelfetch.sampler2darray_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017214,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.texelfetch.sampler2darray_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017215,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.texelfetch.sampler2darray_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017216,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.texelfetch.sampler2darray_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017217,
        "dEQP-GLES3.functional.shaders.texture_fu",
        "nctions.texelfetch.isampler2darray_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017218,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texelfetch.isampler2darray_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017219,
        "dEQP-GLES3.functional.shaders.texture_fu",
        "nctions.texelfetch.usampler2darray_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017220,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texelfetch.usampler2darray_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017221,
        "dEQP-GLES3.functional.shaders.texture_fu",
        "nctions.texelfetch.sampler3d_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017222,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texelfetch.sampler3d_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017223,
        "dEQP-GLES3.functional.shaders.texture_fu",
        "nctions.texelfetch.sampler3d_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017224,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texelfetch.sampler3d_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017225,
        "dEQP-GLES3.functional.shaders.texture_",
        "functions.texelfetch.isampler3d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017226,
        "dEQP-GLES3.functional.shaders.texture_f",
        "unctions.texelfetch.isampler3d_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017227,
        "dEQP-GLES3.functional.shaders.texture_",
        "functions.texelfetch.usampler3d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017228,
        "dEQP-GLES3.functional.shaders.texture_f",
        "unctions.texelfetch.usampler3d_fragment");
