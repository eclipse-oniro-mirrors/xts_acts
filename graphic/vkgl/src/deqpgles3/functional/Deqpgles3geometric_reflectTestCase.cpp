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

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013358,
        "dEQP-GLES3.functional.shaders.operator",
        ".geometric.reflect.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013359,
        "dEQP-GLES3.functional.shaders.operator.",
        "geometric.reflect.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013360,
        "dEQP-GLES3.functional.shaders.operato",
        "r.geometric.reflect.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013361,
        "dEQP-GLES3.functional.shaders.operator",
        ".geometric.reflect.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013362,
        "dEQP-GLES3.functional.shaders.operator",
        ".geometric.reflect.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013363,
        "dEQP-GLES3.functional.shaders.operator.",
        "geometric.reflect.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013364,
        "dEQP-GLES3.functional.shaders.operato",
        "r.geometric.reflect.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013365,
        "dEQP-GLES3.functional.shaders.operator",
        ".geometric.reflect.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013366,
        "dEQP-GLES3.functional.shaders.operator",
        ".geometric.reflect.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013367,
        "dEQP-GLES3.functional.shaders.operator.",
        "geometric.reflect.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013368,
        "dEQP-GLES3.functional.shaders.operato",
        "r.geometric.reflect.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013369,
        "dEQP-GLES3.functional.shaders.operator",
        ".geometric.reflect.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013370,
        "dEQP-GLES3.functional.shaders.operator",
        ".geometric.reflect.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013371,
        "dEQP-GLES3.functional.shaders.operator.",
        "geometric.reflect.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013372,
        "dEQP-GLES3.functional.shaders.operato",
        "r.geometric.reflect.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013373,
        "dEQP-GLES3.functional.shaders.operator",
        ".geometric.reflect.highp_vec4_fragment");
