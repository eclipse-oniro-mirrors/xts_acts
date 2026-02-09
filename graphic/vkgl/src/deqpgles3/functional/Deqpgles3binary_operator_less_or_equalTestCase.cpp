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

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011930,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.less_or_equal.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011931,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.less_or_equal.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011932,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.less_or_equal.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011933,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.less_or_equal.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011934,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.less_or_equal.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011935,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.less_or_equal.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011936,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.less_or_equal.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011937,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.less_or_equal.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011938,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.less_or_equal.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011939,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.less_or_equal.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011940,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.less_or_equal.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011941,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.less_or_equal.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011942,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.less_or_equal.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011943,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.less_or_equal.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011944,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.less_or_equal.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011945,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.less_or_equal.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011946,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.less_or_equal.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011947,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.less_or_equal.highp_uint_fragment");
