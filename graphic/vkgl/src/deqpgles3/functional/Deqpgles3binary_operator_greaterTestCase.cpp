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

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011948,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.greater.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011949,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.greater.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011950,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.greater.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011951,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.greater.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011952,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.greater.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011953,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.greater.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011954,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.greater.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011955,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.greater.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011956,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.greater.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011957,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.greater.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011958,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.greater.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011959,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.greater.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011960,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.greater.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011961,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.greater.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011962,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.greater.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011963,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.greater.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011964,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.greater.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011965,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.greater.highp_uint_fragment");
