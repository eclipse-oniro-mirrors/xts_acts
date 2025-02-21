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

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016984,
        "dEQP-GLES3.functional.shaders.texture_fu",
        "nctions.texturelod.sampler2d_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016985,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texturelod.sampler2d_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016986,
        "dEQP-GLES3.functional.shaders.texture_fu",
        "nctions.texturelod.sampler2d_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016987,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texturelod.sampler2d_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016988,
        "dEQP-GLES3.functional.shaders.texture_",
        "functions.texturelod.isampler2d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016989,
        "dEQP-GLES3.functional.shaders.texture_f",
        "unctions.texturelod.isampler2d_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016990,
        "dEQP-GLES3.functional.shaders.texture_",
        "functions.texturelod.usampler2d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016991,
        "dEQP-GLES3.functional.shaders.texture_f",
        "unctions.texturelod.usampler2d_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016992,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texturelod.samplercube_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016993,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.texturelod.samplercube_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016994,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texturelod.samplercube_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016995,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.texturelod.samplercube_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016996,
        "dEQP-GLES3.functional.shaders.texture_f",
        "unctions.texturelod.isamplercube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016997,
        "dEQP-GLES3.functional.shaders.texture_fu",
        "nctions.texturelod.isamplercube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016998,
        "dEQP-GLES3.functional.shaders.texture_f",
        "unctions.texturelod.usamplercube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016999,
        "dEQP-GLES3.functional.shaders.texture_fu",
        "nctions.texturelod.usamplercube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_017000,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.texturelod.sampler2darray_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_017001,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.texturelod.sampler2darray_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_017002,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.texturelod.sampler2darray_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_017003,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.texturelod.sampler2darray_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_017004,
        "dEQP-GLES3.functional.shaders.texture_fu",
        "nctions.texturelod.isampler2darray_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_017005,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texturelod.isampler2darray_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_017006,
        "dEQP-GLES3.functional.shaders.texture_fu",
        "nctions.texturelod.usampler2darray_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_017007,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texturelod.usampler2darray_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_017008,
        "dEQP-GLES3.functional.shaders.texture_fu",
        "nctions.texturelod.sampler3d_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_017009,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texturelod.sampler3d_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_017010,
        "dEQP-GLES3.functional.shaders.texture_fu",
        "nctions.texturelod.sampler3d_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_017011,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texturelod.sampler3d_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_017012,
        "dEQP-GLES3.functional.shaders.texture_",
        "functions.texturelod.isampler3d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_017013,
        "dEQP-GLES3.functional.shaders.texture_f",
        "unctions.texturelod.isampler3d_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_017014,
        "dEQP-GLES3.functional.shaders.texture_",
        "functions.texturelod.usampler3d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_017015,
        "dEQP-GLES3.functional.shaders.texture_f",
        "unctions.texturelod.usampler3d_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_017016,
        "dEQP-GLES3.functional.shaders.texture_fu",
        "nctions.texturelod.sampler2dshadow_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_017017,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texturelod.sampler2dshadow_fragment");
