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

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013290,
        "dEQP-GLES3.functional.shaders.operator.",
        "geometric.distance.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013291,
        "dEQP-GLES3.functional.shaders.operator.g",
        "eometric.distance.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013292,
        "dEQP-GLES3.functional.shaders.operator",
        ".geometric.distance.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013293,
        "dEQP-GLES3.functional.shaders.operator.",
        "geometric.distance.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013294,
        "dEQP-GLES3.functional.shaders.operator",
        ".geometric.distance.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013295,
        "dEQP-GLES3.functional.shaders.operator.",
        "geometric.distance.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013296,
        "dEQP-GLES3.functional.shaders.operato",
        "r.geometric.distance.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013297,
        "dEQP-GLES3.functional.shaders.operator",
        ".geometric.distance.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013298,
        "dEQP-GLES3.functional.shaders.operator",
        ".geometric.distance.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013299,
        "dEQP-GLES3.functional.shaders.operator.",
        "geometric.distance.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013300,
        "dEQP-GLES3.functional.shaders.operato",
        "r.geometric.distance.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013301,
        "dEQP-GLES3.functional.shaders.operator",
        ".geometric.distance.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013302,
        "dEQP-GLES3.functional.shaders.operator",
        ".geometric.distance.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013303,
        "dEQP-GLES3.functional.shaders.operator.",
        "geometric.distance.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013304,
        "dEQP-GLES3.functional.shaders.operato",
        "r.geometric.distance.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013305,
        "dEQP-GLES3.functional.shaders.operator",
        ".geometric.distance.highp_vec4_fragment");
