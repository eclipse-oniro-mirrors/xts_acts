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
#include "../ActsDeqpgles30016TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015600,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div.dynamic.lowp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015601,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.dynamic.lowp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015602,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div.dynamic.lowp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015603,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.dynamic.lowp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015604,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.dynamic.mediump_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015605,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.dynamic.mediump_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015606,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.dynamic.mediump_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015607,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.dynamic.mediump_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015608,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.dynamic.highp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015609,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.dynamic.highp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015610,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div.dynamic.highp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015611,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.dynamic.highp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015612,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.dynamic.lowp_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015613,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.dynamic.lowp_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015614,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.dynamic.lowp_mat2x3_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015615,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.dynamic.lowp_mat2x3_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015616,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.dynamic.mediump_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015617,
        "dEQP-GLES3.functional.shaders.matrix.di",
        "v.dynamic.mediump_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015618,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.dynamic.mediump_mat2x3_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015619,
        "dEQP-GLES3.functional.shaders.matrix.di",
        "v.dynamic.mediump_mat2x3_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015620,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.dynamic.highp_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015621,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.dynamic.highp_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015622,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.dynamic.highp_mat2x3_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015623,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.dynamic.highp_mat2x3_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015624,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.dynamic.lowp_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015625,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.dynamic.lowp_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015626,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.dynamic.lowp_mat2x4_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015627,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.dynamic.lowp_mat2x4_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015628,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.dynamic.mediump_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015629,
        "dEQP-GLES3.functional.shaders.matrix.di",
        "v.dynamic.mediump_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015630,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.dynamic.mediump_mat2x4_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015631,
        "dEQP-GLES3.functional.shaders.matrix.di",
        "v.dynamic.mediump_mat2x4_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015632,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.dynamic.highp_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015633,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.dynamic.highp_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015634,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.dynamic.highp_mat2x4_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015635,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.dynamic.highp_mat2x4_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015636,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.dynamic.lowp_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015637,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.dynamic.lowp_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015638,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.dynamic.lowp_mat3x2_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015639,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.dynamic.lowp_mat3x2_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015640,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.dynamic.mediump_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015641,
        "dEQP-GLES3.functional.shaders.matrix.di",
        "v.dynamic.mediump_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015642,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.dynamic.mediump_mat3x2_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015643,
        "dEQP-GLES3.functional.shaders.matrix.di",
        "v.dynamic.mediump_mat3x2_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015644,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.dynamic.highp_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015645,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.dynamic.highp_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015646,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.dynamic.highp_mat3x2_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015647,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.dynamic.highp_mat3x2_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015648,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div.dynamic.lowp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015649,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.dynamic.lowp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015650,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div.dynamic.lowp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015651,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.dynamic.lowp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015652,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.dynamic.mediump_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015653,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.dynamic.mediump_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015654,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.dynamic.mediump_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015655,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.dynamic.mediump_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015656,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.dynamic.highp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015657,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.dynamic.highp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015658,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div.dynamic.highp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015659,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.dynamic.highp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015660,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.dynamic.lowp_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015661,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.dynamic.lowp_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015662,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.dynamic.lowp_mat3x4_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015663,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.dynamic.lowp_mat3x4_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015664,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.dynamic.mediump_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015665,
        "dEQP-GLES3.functional.shaders.matrix.di",
        "v.dynamic.mediump_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015666,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.dynamic.mediump_mat3x4_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015667,
        "dEQP-GLES3.functional.shaders.matrix.di",
        "v.dynamic.mediump_mat3x4_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015668,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.dynamic.highp_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015669,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.dynamic.highp_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015670,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.dynamic.highp_mat3x4_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015671,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.dynamic.highp_mat3x4_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015672,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.dynamic.lowp_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015673,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.dynamic.lowp_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015674,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.dynamic.lowp_mat4x2_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015675,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.dynamic.lowp_mat4x2_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015676,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.dynamic.mediump_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015677,
        "dEQP-GLES3.functional.shaders.matrix.di",
        "v.dynamic.mediump_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015678,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.dynamic.mediump_mat4x2_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015679,
        "dEQP-GLES3.functional.shaders.matrix.di",
        "v.dynamic.mediump_mat4x2_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015680,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.dynamic.highp_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015681,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.dynamic.highp_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015682,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.dynamic.highp_mat4x2_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015683,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.dynamic.highp_mat4x2_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015684,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.dynamic.lowp_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015685,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.dynamic.lowp_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015686,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.dynamic.lowp_mat4x3_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015687,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.dynamic.lowp_mat4x3_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015688,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.dynamic.mediump_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015689,
        "dEQP-GLES3.functional.shaders.matrix.di",
        "v.dynamic.mediump_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015690,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.dynamic.mediump_mat4x3_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015691,
        "dEQP-GLES3.functional.shaders.matrix.di",
        "v.dynamic.mediump_mat4x3_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015692,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.dynamic.highp_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015693,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.dynamic.highp_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015694,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.dynamic.highp_mat4x3_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015695,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.dynamic.highp_mat4x3_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015696,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div.dynamic.lowp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015697,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.dynamic.lowp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015698,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div.dynamic.lowp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015699,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.dynamic.lowp_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015700,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.dynamic.mediump_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015701,
        "dEQP-GLES3.functional.shaders.matrix.d",
        "iv.dynamic.mediump_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015702,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.dynamic.mediump_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015703,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.dynamic.mediump_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015704,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.dynamic.highp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015705,
        "dEQP-GLES3.functional.shaders.matrix.",
        "div.dynamic.highp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015706,
        "dEQP-GLES3.functional.shaders.matri",
        "x.div.dynamic.highp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015707,
        "dEQP-GLES3.functional.shaders.matrix",
        ".div.dynamic.highp_mat4_mat4_fragment");
