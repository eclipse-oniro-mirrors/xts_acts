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
#include "../ActsDeqpgles30014TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013570,
        "dEQP-GLES3.functional.shaders.operato",
        "r.int_compare.equal.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013571,
        "dEQP-GLES3.functional.shaders.operator",
        ".int_compare.equal.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013572,
        "dEQP-GLES3.functional.shaders.operator",
        ".int_compare.equal.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013573,
        "dEQP-GLES3.functional.shaders.operator.",
        "int_compare.equal.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013574,
        "dEQP-GLES3.functional.shaders.operato",
        "r.int_compare.equal.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013575,
        "dEQP-GLES3.functional.shaders.operator",
        ".int_compare.equal.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013576,
        "dEQP-GLES3.functional.shaders.operato",
        "r.int_compare.equal.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013577,
        "dEQP-GLES3.functional.shaders.operator",
        ".int_compare.equal.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013578,
        "dEQP-GLES3.functional.shaders.operator",
        ".int_compare.equal.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013579,
        "dEQP-GLES3.functional.shaders.operator.",
        "int_compare.equal.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013580,
        "dEQP-GLES3.functional.shaders.operato",
        "r.int_compare.equal.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013581,
        "dEQP-GLES3.functional.shaders.operator",
        ".int_compare.equal.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013582,
        "dEQP-GLES3.functional.shaders.operato",
        "r.int_compare.equal.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013583,
        "dEQP-GLES3.functional.shaders.operator",
        ".int_compare.equal.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013584,
        "dEQP-GLES3.functional.shaders.operator",
        ".int_compare.equal.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013585,
        "dEQP-GLES3.functional.shaders.operator.",
        "int_compare.equal.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013586,
        "dEQP-GLES3.functional.shaders.operato",
        "r.int_compare.equal.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013587,
        "dEQP-GLES3.functional.shaders.operator",
        ".int_compare.equal.highp_ivec4_fragment");
