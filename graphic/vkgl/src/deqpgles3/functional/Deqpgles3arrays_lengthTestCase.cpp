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

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004447,
        "dEQP-GLES3.functional.shader",
        "s.arrays.length.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004448,
        "dEQP-GLES3.functional.shaders",
        ".arrays.length.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004449,
        "dEQP-GLES3.functional.shade",
        "rs.arrays.length.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004450,
        "dEQP-GLES3.functional.shader",
        "s.arrays.length.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004451,
        "dEQP-GLES3.functional.shade",
        "rs.arrays.length.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004452,
        "dEQP-GLES3.functional.shader",
        "s.arrays.length.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004453,
        "dEQP-GLES3.functional.shader",
        "s.arrays.length.struct_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004454,
        "dEQP-GLES3.functional.shaders",
        ".arrays.length.struct_fragment");
