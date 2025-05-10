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
#include "../ActsDeqpgles30005TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004397,
        "dEQP-GLES3.functional.shaders.arr",
        "ays.unnamed_parameter.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004398,
        "dEQP-GLES3.functional.shaders.arra",
        "ys.unnamed_parameter.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004399,
        "dEQP-GLES3.functional.shaders.ar",
        "rays.unnamed_parameter.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004400,
        "dEQP-GLES3.functional.shaders.arr",
        "ays.unnamed_parameter.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004401,
        "dEQP-GLES3.functional.shaders.arr",
        "ays.unnamed_parameter.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004402,
        "dEQP-GLES3.functional.shaders.arra",
        "ys.unnamed_parameter.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004403,
        "dEQP-GLES3.functional.shaders.arra",
        "ys.unnamed_parameter.struct_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004404,
        "dEQP-GLES3.functional.shaders.array",
        "s.unnamed_parameter.struct_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004405,
        "dEQP-GLES3.functional.shaders.arrays",
        ".unnamed_parameter.float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004406,
        "dEQP-GLES3.functional.shaders.arrays.",
        "unnamed_parameter.float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004407,
        "dEQP-GLES3.functional.shaders.array",
        "s.unnamed_parameter.int_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004408,
        "dEQP-GLES3.functional.shaders.arrays",
        ".unnamed_parameter.int_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004409,
        "dEQP-GLES3.functional.shaders.array",
        "s.unnamed_parameter.bool_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004410,
        "dEQP-GLES3.functional.shaders.arrays",
        ".unnamed_parameter.bool_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004411,
        "dEQP-GLES3.functional.shaders.arrays",
        ".unnamed_parameter.float_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004412,
        "dEQP-GLES3.functional.shaders.arrays.",
        "unnamed_parameter.float_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004413,
        "dEQP-GLES3.functional.shaders.array",
        "s.unnamed_parameter.int_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004414,
        "dEQP-GLES3.functional.shaders.arrays",
        ".unnamed_parameter.int_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004415,
        "dEQP-GLES3.functional.shaders.array",
        "s.unnamed_parameter.bool_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004416,
        "dEQP-GLES3.functional.shaders.arrays",
        ".unnamed_parameter.bool_mat3_fragment");
