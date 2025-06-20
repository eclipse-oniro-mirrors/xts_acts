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
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310005TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004382,
        "dEQP-GLES31.functional.shaders.array",
        "s_of_arrays.es32.length.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004383,
        "dEQP-GLES31.functional.shaders.arrays",
        "_of_arrays.es32.length.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004384,
        "dEQP-GLES31.functional.shaders.arra",
        "ys_of_arrays.es32.length.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004385,
        "dEQP-GLES31.functional.shaders.array",
        "s_of_arrays.es32.length.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004386,
        "dEQP-GLES31.functional.shaders.arra",
        "ys_of_arrays.es32.length.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004387,
        "dEQP-GLES31.functional.shaders.array",
        "s_of_arrays.es32.length.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004388,
        "dEQP-GLES31.functional.shaders.array",
        "s_of_arrays.es32.length.struct_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004389,
        "dEQP-GLES31.functional.shaders.arrays",
        "_of_arrays.es32.length.struct_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004390,
        "dEQP-GLES31.functional.shaders.arra",
        "ys_of_arrays.es32.length.mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004391,
        "dEQP-GLES31.functional.shaders.array",
        "s_of_arrays.es32.length.mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004392,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es32.length.constant_expression_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004393,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es32.length.constant_expression_fragment");
