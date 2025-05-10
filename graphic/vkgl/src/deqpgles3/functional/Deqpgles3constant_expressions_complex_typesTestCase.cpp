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
#include "../ActsDeqpgles30020TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019674,
        "dEQP-GLES3.functional.shaders.constant_",
        "expressions.complex_types.struct_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019675,
        "dEQP-GLES3.functional.shaders.constant_e",
        "xpressions.complex_types.struct_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019676,
        "dEQP-GLES3.functional.shaders.constant_exp",
        "ressions.complex_types.nested_struct_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019677,
        "dEQP-GLES3.functional.shaders.constant_expr",
        "essions.complex_types.nested_struct_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019678,
        "dEQP-GLES3.functional.shaders.constant_ex",
        "pressions.complex_types.array_size_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019679,
        "dEQP-GLES3.functional.shaders.constant_exp",
        "ressions.complex_types.array_size_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019680,
        "dEQP-GLES3.functional.shaders.constant_exp",
        "ressions.complex_types.array_length_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019681,
        "dEQP-GLES3.functional.shaders.constant_expr",
        "essions.complex_types.array_length_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019682,
        "dEQP-GLES3.functional.shaders.constant",
        "_expressions.complex_types.array_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019683,
        "dEQP-GLES3.functional.shaders.constant_",
        "expressions.complex_types.array_fragment");
