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

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015816,
        "dEQP-GLES3.functional.shaders.matrix.t",
        "ranspose.dynamic.lowp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015817,
        "dEQP-GLES3.functional.shaders.matrix.tr",
        "anspose.dynamic.lowp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015818,
        "dEQP-GLES3.functional.shaders.matrix.tra",
        "nspose.dynamic.mediump_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015819,
        "dEQP-GLES3.functional.shaders.matrix.tran",
        "spose.dynamic.mediump_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015820,
        "dEQP-GLES3.functional.shaders.matrix.tr",
        "anspose.dynamic.highp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015821,
        "dEQP-GLES3.functional.shaders.matrix.tra",
        "nspose.dynamic.highp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015822,
        "dEQP-GLES3.functional.shaders.matrix.tr",
        "anspose.dynamic.lowp_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015823,
        "dEQP-GLES3.functional.shaders.matrix.tra",
        "nspose.dynamic.lowp_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015824,
        "dEQP-GLES3.functional.shaders.matrix.tran",
        "spose.dynamic.mediump_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015825,
        "dEQP-GLES3.functional.shaders.matrix.trans",
        "pose.dynamic.mediump_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015826,
        "dEQP-GLES3.functional.shaders.matrix.tra",
        "nspose.dynamic.highp_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015827,
        "dEQP-GLES3.functional.shaders.matrix.tran",
        "spose.dynamic.highp_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015828,
        "dEQP-GLES3.functional.shaders.matrix.tr",
        "anspose.dynamic.lowp_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015829,
        "dEQP-GLES3.functional.shaders.matrix.tra",
        "nspose.dynamic.lowp_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015830,
        "dEQP-GLES3.functional.shaders.matrix.tran",
        "spose.dynamic.mediump_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015831,
        "dEQP-GLES3.functional.shaders.matrix.trans",
        "pose.dynamic.mediump_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015832,
        "dEQP-GLES3.functional.shaders.matrix.tra",
        "nspose.dynamic.highp_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015833,
        "dEQP-GLES3.functional.shaders.matrix.tran",
        "spose.dynamic.highp_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015834,
        "dEQP-GLES3.functional.shaders.matrix.tr",
        "anspose.dynamic.lowp_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015835,
        "dEQP-GLES3.functional.shaders.matrix.tra",
        "nspose.dynamic.lowp_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015836,
        "dEQP-GLES3.functional.shaders.matrix.tran",
        "spose.dynamic.mediump_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015837,
        "dEQP-GLES3.functional.shaders.matrix.trans",
        "pose.dynamic.mediump_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015838,
        "dEQP-GLES3.functional.shaders.matrix.tra",
        "nspose.dynamic.highp_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015839,
        "dEQP-GLES3.functional.shaders.matrix.tran",
        "spose.dynamic.highp_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015840,
        "dEQP-GLES3.functional.shaders.matrix.t",
        "ranspose.dynamic.lowp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015841,
        "dEQP-GLES3.functional.shaders.matrix.tr",
        "anspose.dynamic.lowp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015842,
        "dEQP-GLES3.functional.shaders.matrix.tra",
        "nspose.dynamic.mediump_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015843,
        "dEQP-GLES3.functional.shaders.matrix.tran",
        "spose.dynamic.mediump_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015844,
        "dEQP-GLES3.functional.shaders.matrix.tr",
        "anspose.dynamic.highp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015845,
        "dEQP-GLES3.functional.shaders.matrix.tra",
        "nspose.dynamic.highp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015846,
        "dEQP-GLES3.functional.shaders.matrix.tr",
        "anspose.dynamic.lowp_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015847,
        "dEQP-GLES3.functional.shaders.matrix.tra",
        "nspose.dynamic.lowp_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015848,
        "dEQP-GLES3.functional.shaders.matrix.tran",
        "spose.dynamic.mediump_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015849,
        "dEQP-GLES3.functional.shaders.matrix.trans",
        "pose.dynamic.mediump_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015850,
        "dEQP-GLES3.functional.shaders.matrix.tra",
        "nspose.dynamic.highp_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015851,
        "dEQP-GLES3.functional.shaders.matrix.tran",
        "spose.dynamic.highp_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015852,
        "dEQP-GLES3.functional.shaders.matrix.tr",
        "anspose.dynamic.lowp_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015853,
        "dEQP-GLES3.functional.shaders.matrix.tra",
        "nspose.dynamic.lowp_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015854,
        "dEQP-GLES3.functional.shaders.matrix.tran",
        "spose.dynamic.mediump_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015855,
        "dEQP-GLES3.functional.shaders.matrix.trans",
        "pose.dynamic.mediump_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015856,
        "dEQP-GLES3.functional.shaders.matrix.tra",
        "nspose.dynamic.highp_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015857,
        "dEQP-GLES3.functional.shaders.matrix.tran",
        "spose.dynamic.highp_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015858,
        "dEQP-GLES3.functional.shaders.matrix.tr",
        "anspose.dynamic.lowp_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015859,
        "dEQP-GLES3.functional.shaders.matrix.tra",
        "nspose.dynamic.lowp_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015860,
        "dEQP-GLES3.functional.shaders.matrix.tran",
        "spose.dynamic.mediump_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015861,
        "dEQP-GLES3.functional.shaders.matrix.trans",
        "pose.dynamic.mediump_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015862,
        "dEQP-GLES3.functional.shaders.matrix.tra",
        "nspose.dynamic.highp_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015863,
        "dEQP-GLES3.functional.shaders.matrix.tran",
        "spose.dynamic.highp_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015864,
        "dEQP-GLES3.functional.shaders.matrix.t",
        "ranspose.dynamic.lowp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015865,
        "dEQP-GLES3.functional.shaders.matrix.tr",
        "anspose.dynamic.lowp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015866,
        "dEQP-GLES3.functional.shaders.matrix.tra",
        "nspose.dynamic.mediump_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015867,
        "dEQP-GLES3.functional.shaders.matrix.tran",
        "spose.dynamic.mediump_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015868,
        "dEQP-GLES3.functional.shaders.matrix.tr",
        "anspose.dynamic.highp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015869,
        "dEQP-GLES3.functional.shaders.matrix.tra",
        "nspose.dynamic.highp_mat4_float_fragment");
