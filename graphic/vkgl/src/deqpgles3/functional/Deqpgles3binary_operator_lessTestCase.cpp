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

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011912,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.less.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011913,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.less.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011914,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.less.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011915,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.less.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011916,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.less.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011917,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.less.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011918,
        "dEQP-GLES3.functional.shaders.operato",
        "r.binary_operator.less.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011919,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.less.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011920,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.less.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011921,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.less.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011922,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.less.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011923,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.less.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011924,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.less.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011925,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.less.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011926,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.less.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011927,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.less.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011928,
        "dEQP-GLES3.functional.shaders.operator",
        ".binary_operator.less.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30012TestSuite, TestCase_011929,
        "dEQP-GLES3.functional.shaders.operator.",
        "binary_operator.less.highp_uint_fragment");
