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

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013374,
        "dEQP-GLES3.functional.shaders.operator",
        ".geometric.refract.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013375,
        "dEQP-GLES3.functional.shaders.operator.",
        "geometric.refract.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013376,
        "dEQP-GLES3.functional.shaders.operato",
        "r.geometric.refract.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013377,
        "dEQP-GLES3.functional.shaders.operator",
        ".geometric.refract.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013378,
        "dEQP-GLES3.functional.shaders.operator.ge",
        "ometric.refract.mediump_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013379,
        "dEQP-GLES3.functional.shaders.operator.geo",
        "metric.refract.mediump_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013380,
        "dEQP-GLES3.functional.shaders.operator.g",
        "eometric.refract.highp_vec2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013381,
        "dEQP-GLES3.functional.shaders.operator.ge",
        "ometric.refract.highp_vec2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013382,
        "dEQP-GLES3.functional.shaders.operator.ge",
        "ometric.refract.mediump_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013383,
        "dEQP-GLES3.functional.shaders.operator.geo",
        "metric.refract.mediump_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013384,
        "dEQP-GLES3.functional.shaders.operator.g",
        "eometric.refract.highp_vec3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013385,
        "dEQP-GLES3.functional.shaders.operator.ge",
        "ometric.refract.highp_vec3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013386,
        "dEQP-GLES3.functional.shaders.operator.ge",
        "ometric.refract.mediump_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013387,
        "dEQP-GLES3.functional.shaders.operator.geo",
        "metric.refract.mediump_vec4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013388,
        "dEQP-GLES3.functional.shaders.operator.g",
        "eometric.refract.highp_vec4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013389,
        "dEQP-GLES3.functional.shaders.operator.ge",
        "ometric.refract.highp_vec4_float_fragment");
