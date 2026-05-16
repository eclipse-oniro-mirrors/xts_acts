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
#include "../ActsDeqpgles20001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000777,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.scalar_to_scalar.float_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000778,
        "dEQP-GLES2.functional.shaders.conversions",
        ".scalar_to_scalar.float_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000779,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.scalar_to_scalar.float_to_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000780,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.scalar_to_scalar.float_to_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000781,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.scalar_to_scalar.float_to_bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000782,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.scalar_to_scalar.float_to_bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000783,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.scalar_to_scalar.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000784,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.scalar_to_scalar.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000785,
        "dEQP-GLES2.functional.shaders.conversi",
        "ons.scalar_to_scalar.int_to_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000786,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.scalar_to_scalar.int_to_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000787,
        "dEQP-GLES2.functional.shaders.conversi",
        "ons.scalar_to_scalar.int_to_bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000788,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.scalar_to_scalar.int_to_bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000789,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.scalar_to_scalar.bool_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000790,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.scalar_to_scalar.bool_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000791,
        "dEQP-GLES2.functional.shaders.conversi",
        "ons.scalar_to_scalar.bool_to_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000792,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.scalar_to_scalar.bool_to_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000793,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.scalar_to_scalar.bool_to_bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000794,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.scalar_to_scalar.bool_to_bool_fragment");
