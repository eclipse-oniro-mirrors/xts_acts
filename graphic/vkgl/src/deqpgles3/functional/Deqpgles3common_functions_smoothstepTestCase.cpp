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

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013232,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.smoothstep.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013233,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.smoothstep.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013234,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.smoothstep.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013235,
        "dEQP-GLES3.functional.shaders.operator.commo",
        "n_functions.smoothstep.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013236,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.smoothstep.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013237,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.smoothstep.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013238,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.smoothstep.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013239,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.smoothstep.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013240,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.smoothstep.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013241,
        "dEQP-GLES3.functional.shaders.operator.commo",
        "n_functions.smoothstep.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013242,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.smoothstep.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013243,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.smoothstep.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013244,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.smoothstep.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013245,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.smoothstep.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013246,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.smoothstep.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013247,
        "dEQP-GLES3.functional.shaders.operator.commo",
        "n_functions.smoothstep.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013248,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.smoothstep.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013249,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.smoothstep.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013250,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.smoothstep.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013251,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.smoothstep.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013252,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.smoothstep.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013253,
        "dEQP-GLES3.functional.shaders.operator.commo",
        "n_functions.smoothstep.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013254,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.smoothstep.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013255,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.smoothstep.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013256,
        "dEQP-GLES3.functional.shaders.operator.commo",
        "n_functions.smoothstep.lowp_float_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013257,
        "dEQP-GLES3.functional.shaders.operator.common",
        "_functions.smoothstep.lowp_float_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013258,
        "dEQP-GLES3.functional.shaders.operator.common_",
        "functions.smoothstep.mediump_float_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013259,
        "dEQP-GLES3.functional.shaders.operator.common_f",
        "unctions.smoothstep.mediump_float_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013260,
        "dEQP-GLES3.functional.shaders.operator.common",
        "_functions.smoothstep.highp_float_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013261,
        "dEQP-GLES3.functional.shaders.operator.common_",
        "functions.smoothstep.highp_float_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013262,
        "dEQP-GLES3.functional.shaders.operator.commo",
        "n_functions.smoothstep.lowp_float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013263,
        "dEQP-GLES3.functional.shaders.operator.common",
        "_functions.smoothstep.lowp_float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013264,
        "dEQP-GLES3.functional.shaders.operator.common_",
        "functions.smoothstep.mediump_float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013265,
        "dEQP-GLES3.functional.shaders.operator.common_f",
        "unctions.smoothstep.mediump_float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013266,
        "dEQP-GLES3.functional.shaders.operator.common",
        "_functions.smoothstep.highp_float_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013267,
        "dEQP-GLES3.functional.shaders.operator.common_",
        "functions.smoothstep.highp_float_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013268,
        "dEQP-GLES3.functional.shaders.operator.commo",
        "n_functions.smoothstep.lowp_float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013269,
        "dEQP-GLES3.functional.shaders.operator.common",
        "_functions.smoothstep.lowp_float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013270,
        "dEQP-GLES3.functional.shaders.operator.common_",
        "functions.smoothstep.mediump_float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013271,
        "dEQP-GLES3.functional.shaders.operator.common_f",
        "unctions.smoothstep.mediump_float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013272,
        "dEQP-GLES3.functional.shaders.operator.common",
        "_functions.smoothstep.highp_float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013273,
        "dEQP-GLES3.functional.shaders.operator.common_",
        "functions.smoothstep.highp_float_vec4_fragment");
