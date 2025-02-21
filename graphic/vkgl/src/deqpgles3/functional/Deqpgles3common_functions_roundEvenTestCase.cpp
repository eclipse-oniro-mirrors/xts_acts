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
#include "../ActsDeqpgles30013TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012670,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.roundEven.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012671,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.roundEven.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012672,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.roundEven.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012673,
        "dEQP-GLES3.functional.shaders.operator.commo",
        "n_functions.roundEven.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012674,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.roundEven.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012675,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.roundEven.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012676,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.roundEven.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012677,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.roundEven.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012678,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.roundEven.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012679,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.roundEven.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012680,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.roundEven.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012681,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.roundEven.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012682,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.roundEven.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012683,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.roundEven.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012684,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.roundEven.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012685,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.roundEven.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012686,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.roundEven.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012687,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.roundEven.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012688,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.roundEven.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012689,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.roundEven.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012690,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.roundEven.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012691,
        "dEQP-GLES3.functional.shaders.operator.comm",
        "on_functions.roundEven.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012692,
        "dEQP-GLES3.functional.shaders.operator.co",
        "mmon_functions.roundEven.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012693,
        "dEQP-GLES3.functional.shaders.operator.com",
        "mon_functions.roundEven.highp_vec4_fragment");
