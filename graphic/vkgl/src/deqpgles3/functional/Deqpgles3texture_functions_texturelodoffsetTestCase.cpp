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

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017018,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.texturelodoffset.sampler2d_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017019,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.texturelodoffset.sampler2d_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017020,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.texturelodoffset.sampler2d_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017021,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.texturelodoffset.sampler2d_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017022,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texturelodoffset.isampler2d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017023,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.texturelodoffset.isampler2d_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017024,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texturelodoffset.usampler2d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017025,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.texturelodoffset.usampler2d_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017026,
        "dEQP-GLES3.functional.shaders.texture_function",
        "s.texturelodoffset.sampler2darray_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017027,
        "dEQP-GLES3.functional.shaders.texture_functions",
        ".texturelodoffset.sampler2darray_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017028,
        "dEQP-GLES3.functional.shaders.texture_function",
        "s.texturelodoffset.sampler2darray_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017029,
        "dEQP-GLES3.functional.shaders.texture_functions",
        ".texturelodoffset.sampler2darray_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017030,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.texturelodoffset.isampler2darray_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017031,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.texturelodoffset.isampler2darray_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017032,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.texturelodoffset.usampler2darray_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017033,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.texturelodoffset.sampler3d_fixed_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017034,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.texturelodoffset.sampler3d_fixed_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017035,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.texturelodoffset.sampler3d_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017036,
        "dEQP-GLES3.functional.shaders.texture_fun",
        "ctions.texturelodoffset.isampler3d_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017037,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.texturelodoffset.isampler3d_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017038,
        "dEQP-GLES3.functional.shaders.texture_func",
        "tions.texturelodoffset.usampler3d_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017039,
        "dEQP-GLES3.functional.shaders.texture_funct",
        "ions.texturelodoffset.sampler2dshadow_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017040,
        "dEQP-GLES3.functional.shaders.texture_functi",
        "ons.texturelodoffset.sampler2dshadow_fragment");
