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

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004377,
        "dEQP-GLES3.functional.shader",
        "s.arrays.return.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004378,
        "dEQP-GLES3.functional.shaders",
        ".arrays.return.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004379,
        "dEQP-GLES3.functional.shade",
        "rs.arrays.return.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004380,
        "dEQP-GLES3.functional.shader",
        "s.arrays.return.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004381,
        "dEQP-GLES3.functional.shade",
        "rs.arrays.return.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004382,
        "dEQP-GLES3.functional.shader",
        "s.arrays.return.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004383,
        "dEQP-GLES3.functional.shaders.",
        "arrays.return.float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004384,
        "dEQP-GLES3.functional.shaders.a",
        "rrays.return.float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004385,
        "dEQP-GLES3.functional.shader",
        "s.arrays.return.struct_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004386,
        "dEQP-GLES3.functional.shaders",
        ".arrays.return.struct_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004387,
        "dEQP-GLES3.functional.shaders",
        ".arrays.return.int_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004388,
        "dEQP-GLES3.functional.shaders.",
        "arrays.return.int_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004389,
        "dEQP-GLES3.functional.shaders.",
        "arrays.return.bool_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004390,
        "dEQP-GLES3.functional.shaders.a",
        "rrays.return.bool_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004391,
        "dEQP-GLES3.functional.shaders.",
        "arrays.return.float_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004392,
        "dEQP-GLES3.functional.shaders.a",
        "rrays.return.float_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004393,
        "dEQP-GLES3.functional.shaders",
        ".arrays.return.int_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004394,
        "dEQP-GLES3.functional.shaders.",
        "arrays.return.int_mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004395,
        "dEQP-GLES3.functional.shaders.",
        "arrays.return.bool_mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004396,
        "dEQP-GLES3.functional.shaders.a",
        "rrays.return.bool_mat3_fragment");
