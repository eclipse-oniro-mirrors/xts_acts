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

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013462,
        "dEQP-GLES3.functional.shaders.operato",
        "r.float_compare.equal.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013463,
        "dEQP-GLES3.functional.shaders.operator",
        ".float_compare.equal.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013464,
        "dEQP-GLES3.functional.shaders.operator.",
        "float_compare.equal.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013465,
        "dEQP-GLES3.functional.shaders.operator.f",
        "loat_compare.equal.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013466,
        "dEQP-GLES3.functional.shaders.operator",
        ".float_compare.equal.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013467,
        "dEQP-GLES3.functional.shaders.operator.",
        "float_compare.equal.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013468,
        "dEQP-GLES3.functional.shaders.operato",
        "r.float_compare.equal.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013469,
        "dEQP-GLES3.functional.shaders.operator",
        ".float_compare.equal.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013470,
        "dEQP-GLES3.functional.shaders.operator.",
        "float_compare.equal.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013471,
        "dEQP-GLES3.functional.shaders.operator.f",
        "loat_compare.equal.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013472,
        "dEQP-GLES3.functional.shaders.operator",
        ".float_compare.equal.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013473,
        "dEQP-GLES3.functional.shaders.operator.",
        "float_compare.equal.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013474,
        "dEQP-GLES3.functional.shaders.operato",
        "r.float_compare.equal.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013475,
        "dEQP-GLES3.functional.shaders.operator",
        ".float_compare.equal.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013476,
        "dEQP-GLES3.functional.shaders.operator.",
        "float_compare.equal.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013477,
        "dEQP-GLES3.functional.shaders.operator.f",
        "loat_compare.equal.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013478,
        "dEQP-GLES3.functional.shaders.operator",
        ".float_compare.equal.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013479,
        "dEQP-GLES3.functional.shaders.operator.",
        "float_compare.equal.highp_vec4_fragment");
