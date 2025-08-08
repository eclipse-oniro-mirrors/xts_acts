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
#include "../ActsDeqpgles30012TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011966,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.greater_or_equal.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011967,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.greater_or_equal.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011968,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.greater_or_equal.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011969,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.greater_or_equal.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011970,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.greater_or_equal.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011971,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.greater_or_equal.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011972,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.greater_or_equal.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011973,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.greater_or_equal.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011974,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.greater_or_equal.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011975,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.greater_or_equal.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011976,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.greater_or_equal.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011977,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.greater_or_equal.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011978,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.greater_or_equal.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011979,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.greater_or_equal.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011980,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.greater_or_equal.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011981,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.greater_or_equal.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011982,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.greater_or_equal.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011983,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.greater_or_equal.highp_uint_fragment");
