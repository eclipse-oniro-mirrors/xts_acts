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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20008TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007870,
        "dEQP-GLES2.functional.shaders.const",
        "ant_expressions.trivial.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007871,
        "dEQP-GLES2.functional.shaders.consta",
        "nt_expressions.trivial.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007872,
        "dEQP-GLES2.functional.shaders.cons",
        "tant_expressions.trivial.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007873,
        "dEQP-GLES2.functional.shaders.const",
        "ant_expressions.trivial.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007874,
        "dEQP-GLES2.functional.shaders.const",
        "ant_expressions.trivial.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007875,
        "dEQP-GLES2.functional.shaders.consta",
        "nt_expressions.trivial.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007876,
        "dEQP-GLES2.functional.shaders.const",
        "ant_expressions.trivial.cast_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007877,
        "dEQP-GLES2.functional.shaders.consta",
        "nt_expressions.trivial.cast_fragment");
