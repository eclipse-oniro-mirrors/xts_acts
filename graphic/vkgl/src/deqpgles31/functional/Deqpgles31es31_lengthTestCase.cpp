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

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004090,
        "dEQP-GLES31.functional.shaders.array",
        "s_of_arrays.es31.length.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004091,
        "dEQP-GLES31.functional.shaders.arrays",
        "_of_arrays.es31.length.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004092,
        "dEQP-GLES31.functional.shaders.arra",
        "ys_of_arrays.es31.length.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004093,
        "dEQP-GLES31.functional.shaders.array",
        "s_of_arrays.es31.length.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004094,
        "dEQP-GLES31.functional.shaders.arra",
        "ys_of_arrays.es31.length.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004095,
        "dEQP-GLES31.functional.shaders.array",
        "s_of_arrays.es31.length.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004096,
        "dEQP-GLES31.functional.shaders.array",
        "s_of_arrays.es31.length.struct_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004097,
        "dEQP-GLES31.functional.shaders.arrays",
        "_of_arrays.es31.length.struct_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004098,
        "dEQP-GLES31.functional.shaders.arra",
        "ys_of_arrays.es31.length.mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004099,
        "dEQP-GLES31.functional.shaders.array",
        "s_of_arrays.es31.length.mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004100,
        "dEQP-GLES31.functional.shaders.arrays_of_ar",
        "rays.es31.length.constant_expression_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004101,
        "dEQP-GLES31.functional.shaders.arrays_of_arr",
        "ays.es31.length.constant_expression_fragment");
