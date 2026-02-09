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

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016338,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul_assign.lowp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016339,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul_assign.lowp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016340,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul_assign.mediump_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016341,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul_assign.mediump_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016342,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul_assign.highp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016343,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul_assign.highp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016344,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul_assign.lowp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016345,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul_assign.lowp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016346,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul_assign.mediump_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016347,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul_assign.mediump_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016348,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul_assign.highp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016349,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul_assign.highp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016350,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul_assign.lowp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016351,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul_assign.lowp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016352,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul_assign.mediump_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016353,
        "dEQP-GLES3.functional.shaders.matrix.",
        "mul_assign.mediump_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016354,
        "dEQP-GLES3.functional.shaders.matri",
        "x.mul_assign.highp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016355,
        "dEQP-GLES3.functional.shaders.matrix",
        ".mul_assign.highp_mat4_float_fragment");
