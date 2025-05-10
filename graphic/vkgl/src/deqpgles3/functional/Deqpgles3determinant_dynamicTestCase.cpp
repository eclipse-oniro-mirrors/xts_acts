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

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015870,
        "dEQP-GLES3.functional.shaders.matrix.de",
        "terminant.dynamic.lowp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015871,
        "dEQP-GLES3.functional.shaders.matrix.det",
        "erminant.dynamic.lowp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015872,
        "dEQP-GLES3.functional.shaders.matrix.dete",
        "rminant.dynamic.mediump_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015873,
        "dEQP-GLES3.functional.shaders.matrix.deter",
        "minant.dynamic.mediump_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015874,
        "dEQP-GLES3.functional.shaders.matrix.det",
        "erminant.dynamic.highp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015875,
        "dEQP-GLES3.functional.shaders.matrix.dete",
        "rminant.dynamic.highp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015876,
        "dEQP-GLES3.functional.shaders.matrix.de",
        "terminant.dynamic.lowp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015877,
        "dEQP-GLES3.functional.shaders.matrix.det",
        "erminant.dynamic.lowp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015878,
        "dEQP-GLES3.functional.shaders.matrix.dete",
        "rminant.dynamic.mediump_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015879,
        "dEQP-GLES3.functional.shaders.matrix.deter",
        "minant.dynamic.mediump_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015880,
        "dEQP-GLES3.functional.shaders.matrix.det",
        "erminant.dynamic.highp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015881,
        "dEQP-GLES3.functional.shaders.matrix.dete",
        "rminant.dynamic.highp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015882,
        "dEQP-GLES3.functional.shaders.matrix.de",
        "terminant.dynamic.lowp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015883,
        "dEQP-GLES3.functional.shaders.matrix.det",
        "erminant.dynamic.lowp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015884,
        "dEQP-GLES3.functional.shaders.matrix.dete",
        "rminant.dynamic.mediump_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015885,
        "dEQP-GLES3.functional.shaders.matrix.deter",
        "minant.dynamic.mediump_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015886,
        "dEQP-GLES3.functional.shaders.matrix.det",
        "erminant.dynamic.highp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015887,
        "dEQP-GLES3.functional.shaders.matrix.dete",
        "rminant.dynamic.highp_mat4_float_fragment");
