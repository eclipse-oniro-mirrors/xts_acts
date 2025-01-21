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

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015888,
        "dEQP-GLES3.functional.shaders.matrix.",
        "inverse.dynamic.lowp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015889,
        "dEQP-GLES3.functional.shaders.matrix.i",
        "nverse.dynamic.lowp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015890,
        "dEQP-GLES3.functional.shaders.matrix.in",
        "verse.dynamic.mediump_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015891,
        "dEQP-GLES3.functional.shaders.matrix.inv",
        "erse.dynamic.mediump_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015892,
        "dEQP-GLES3.functional.shaders.matrix.i",
        "nverse.dynamic.highp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015893,
        "dEQP-GLES3.functional.shaders.matrix.in",
        "verse.dynamic.highp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015894,
        "dEQP-GLES3.functional.shaders.matrix.",
        "inverse.dynamic.lowp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015895,
        "dEQP-GLES3.functional.shaders.matrix.i",
        "nverse.dynamic.lowp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015896,
        "dEQP-GLES3.functional.shaders.matrix.in",
        "verse.dynamic.mediump_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015897,
        "dEQP-GLES3.functional.shaders.matrix.inv",
        "erse.dynamic.mediump_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015898,
        "dEQP-GLES3.functional.shaders.matrix.i",
        "nverse.dynamic.highp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015899,
        "dEQP-GLES3.functional.shaders.matrix.in",
        "verse.dynamic.highp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015900,
        "dEQP-GLES3.functional.shaders.matrix.",
        "inverse.dynamic.lowp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015901,
        "dEQP-GLES3.functional.shaders.matrix.i",
        "nverse.dynamic.lowp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015902,
        "dEQP-GLES3.functional.shaders.matrix.in",
        "verse.dynamic.mediump_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015903,
        "dEQP-GLES3.functional.shaders.matrix.inv",
        "erse.dynamic.mediump_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015904,
        "dEQP-GLES3.functional.shaders.matrix.i",
        "nverse.dynamic.highp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30016TestSuite, TestCase_015905,
        "dEQP-GLES3.functional.shaders.matrix.in",
        "verse.dynamic.highp_mat4_float_fragment");
