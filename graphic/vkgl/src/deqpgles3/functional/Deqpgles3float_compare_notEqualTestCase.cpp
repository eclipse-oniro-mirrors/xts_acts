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

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013480,
        "dEQP-GLES3.functional.shaders.operator.",
        "float_compare.notEqual.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013481,
        "dEQP-GLES3.functional.shaders.operator.f",
        "loat_compare.notEqual.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013482,
        "dEQP-GLES3.functional.shaders.operator.f",
        "loat_compare.notEqual.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013483,
        "dEQP-GLES3.functional.shaders.operator.fl",
        "oat_compare.notEqual.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013484,
        "dEQP-GLES3.functional.shaders.operator.",
        "float_compare.notEqual.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013485,
        "dEQP-GLES3.functional.shaders.operator.f",
        "loat_compare.notEqual.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013486,
        "dEQP-GLES3.functional.shaders.operator.",
        "float_compare.notEqual.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013487,
        "dEQP-GLES3.functional.shaders.operator.f",
        "loat_compare.notEqual.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013488,
        "dEQP-GLES3.functional.shaders.operator.f",
        "loat_compare.notEqual.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013489,
        "dEQP-GLES3.functional.shaders.operator.fl",
        "oat_compare.notEqual.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013490,
        "dEQP-GLES3.functional.shaders.operator.",
        "float_compare.notEqual.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013491,
        "dEQP-GLES3.functional.shaders.operator.f",
        "loat_compare.notEqual.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013492,
        "dEQP-GLES3.functional.shaders.operator.",
        "float_compare.notEqual.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013493,
        "dEQP-GLES3.functional.shaders.operator.f",
        "loat_compare.notEqual.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013494,
        "dEQP-GLES3.functional.shaders.operator.f",
        "loat_compare.notEqual.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013495,
        "dEQP-GLES3.functional.shaders.operator.fl",
        "oat_compare.notEqual.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013496,
        "dEQP-GLES3.functional.shaders.operator.",
        "float_compare.notEqual.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013497,
        "dEQP-GLES3.functional.shaders.operator.f",
        "loat_compare.notEqual.highp_vec4_fragment");
