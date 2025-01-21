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

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015708,
        "dEQP-GLES3.functional.shaders.matrix.mat",
        "rixcompmult.dynamic.lowp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015709,
        "dEQP-GLES3.functional.shaders.matrix.matr",
        "ixcompmult.dynamic.lowp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015710,
        "dEQP-GLES3.functional.shaders.matrix.matri",
        "xcompmult.dynamic.mediump_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015711,
        "dEQP-GLES3.functional.shaders.matrix.matrix",
        "compmult.dynamic.mediump_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015712,
        "dEQP-GLES3.functional.shaders.matrix.matr",
        "ixcompmult.dynamic.highp_mat2_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015713,
        "dEQP-GLES3.functional.shaders.matrix.matri",
        "xcompmult.dynamic.highp_mat2_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015714,
        "dEQP-GLES3.functional.shaders.matrix.matri",
        "xcompmult.dynamic.lowp_mat2x3_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015715,
        "dEQP-GLES3.functional.shaders.matrix.matrix",
        "compmult.dynamic.lowp_mat2x3_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015716,
        "dEQP-GLES3.functional.shaders.matrix.matrixc",
        "ompmult.dynamic.mediump_mat2x3_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015717,
        "dEQP-GLES3.functional.shaders.matrix.matrixco",
        "mpmult.dynamic.mediump_mat2x3_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015718,
        "dEQP-GLES3.functional.shaders.matrix.matrix",
        "compmult.dynamic.highp_mat2x3_mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015719,
        "dEQP-GLES3.functional.shaders.matrix.matrixc",
        "ompmult.dynamic.highp_mat2x3_mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015720,
        "dEQP-GLES3.functional.shaders.matrix.matri",
        "xcompmult.dynamic.lowp_mat2x4_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015721,
        "dEQP-GLES3.functional.shaders.matrix.matrix",
        "compmult.dynamic.lowp_mat2x4_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015722,
        "dEQP-GLES3.functional.shaders.matrix.matrixc",
        "ompmult.dynamic.mediump_mat2x4_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015723,
        "dEQP-GLES3.functional.shaders.matrix.matrixco",
        "mpmult.dynamic.mediump_mat2x4_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015724,
        "dEQP-GLES3.functional.shaders.matrix.matrix",
        "compmult.dynamic.highp_mat2x4_mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015725,
        "dEQP-GLES3.functional.shaders.matrix.matrixc",
        "ompmult.dynamic.highp_mat2x4_mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015726,
        "dEQP-GLES3.functional.shaders.matrix.matri",
        "xcompmult.dynamic.lowp_mat3x2_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015727,
        "dEQP-GLES3.functional.shaders.matrix.matrix",
        "compmult.dynamic.lowp_mat3x2_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015728,
        "dEQP-GLES3.functional.shaders.matrix.matrixc",
        "ompmult.dynamic.mediump_mat3x2_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015729,
        "dEQP-GLES3.functional.shaders.matrix.matrixco",
        "mpmult.dynamic.mediump_mat3x2_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015730,
        "dEQP-GLES3.functional.shaders.matrix.matrix",
        "compmult.dynamic.highp_mat3x2_mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015731,
        "dEQP-GLES3.functional.shaders.matrix.matrixc",
        "ompmult.dynamic.highp_mat3x2_mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015732,
        "dEQP-GLES3.functional.shaders.matrix.mat",
        "rixcompmult.dynamic.lowp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015733,
        "dEQP-GLES3.functional.shaders.matrix.matr",
        "ixcompmult.dynamic.lowp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015734,
        "dEQP-GLES3.functional.shaders.matrix.matri",
        "xcompmult.dynamic.mediump_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015735,
        "dEQP-GLES3.functional.shaders.matrix.matrix",
        "compmult.dynamic.mediump_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015736,
        "dEQP-GLES3.functional.shaders.matrix.matr",
        "ixcompmult.dynamic.highp_mat3_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015737,
        "dEQP-GLES3.functional.shaders.matrix.matri",
        "xcompmult.dynamic.highp_mat3_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015738,
        "dEQP-GLES3.functional.shaders.matrix.matri",
        "xcompmult.dynamic.lowp_mat3x4_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015739,
        "dEQP-GLES3.functional.shaders.matrix.matrix",
        "compmult.dynamic.lowp_mat3x4_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015740,
        "dEQP-GLES3.functional.shaders.matrix.matrixc",
        "ompmult.dynamic.mediump_mat3x4_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015741,
        "dEQP-GLES3.functional.shaders.matrix.matrixco",
        "mpmult.dynamic.mediump_mat3x4_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015742,
        "dEQP-GLES3.functional.shaders.matrix.matrix",
        "compmult.dynamic.highp_mat3x4_mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015743,
        "dEQP-GLES3.functional.shaders.matrix.matrixc",
        "ompmult.dynamic.highp_mat3x4_mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015744,
        "dEQP-GLES3.functional.shaders.matrix.matri",
        "xcompmult.dynamic.lowp_mat4x2_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015745,
        "dEQP-GLES3.functional.shaders.matrix.matrix",
        "compmult.dynamic.lowp_mat4x2_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015746,
        "dEQP-GLES3.functional.shaders.matrix.matrixc",
        "ompmult.dynamic.mediump_mat4x2_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015747,
        "dEQP-GLES3.functional.shaders.matrix.matrixco",
        "mpmult.dynamic.mediump_mat4x2_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015748,
        "dEQP-GLES3.functional.shaders.matrix.matrix",
        "compmult.dynamic.highp_mat4x2_mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015749,
        "dEQP-GLES3.functional.shaders.matrix.matrixc",
        "ompmult.dynamic.highp_mat4x2_mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015750,
        "dEQP-GLES3.functional.shaders.matrix.matri",
        "xcompmult.dynamic.lowp_mat4x3_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015751,
        "dEQP-GLES3.functional.shaders.matrix.matrix",
        "compmult.dynamic.lowp_mat4x3_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015752,
        "dEQP-GLES3.functional.shaders.matrix.matrixc",
        "ompmult.dynamic.mediump_mat4x3_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015753,
        "dEQP-GLES3.functional.shaders.matrix.matrixco",
        "mpmult.dynamic.mediump_mat4x3_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015754,
        "dEQP-GLES3.functional.shaders.matrix.matrix",
        "compmult.dynamic.highp_mat4x3_mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015755,
        "dEQP-GLES3.functional.shaders.matrix.matrixc",
        "ompmult.dynamic.highp_mat4x3_mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015756,
        "dEQP-GLES3.functional.shaders.matrix.mat",
        "rixcompmult.dynamic.lowp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015757,
        "dEQP-GLES3.functional.shaders.matrix.matr",
        "ixcompmult.dynamic.lowp_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015758,
        "dEQP-GLES3.functional.shaders.matrix.matri",
        "xcompmult.dynamic.mediump_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015759,
        "dEQP-GLES3.functional.shaders.matrix.matrix",
        "compmult.dynamic.mediump_mat4_mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015760,
        "dEQP-GLES3.functional.shaders.matrix.matr",
        "ixcompmult.dynamic.highp_mat4_mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015761,
        "dEQP-GLES3.functional.shaders.matrix.matri",
        "xcompmult.dynamic.highp_mat4_mat4_fragment");
