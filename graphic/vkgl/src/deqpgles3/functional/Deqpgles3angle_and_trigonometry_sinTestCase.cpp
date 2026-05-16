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

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012182,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.sin.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012183,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.sin.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012184,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.sin.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012185,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.sin.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012186,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.sin.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012187,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.sin.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012188,
        "dEQP-GLES3.functional.shaders.operator.an",
        "gle_and_trigonometry.sin.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012189,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.sin.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012190,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.sin.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012191,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.sin.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012192,
        "dEQP-GLES3.functional.shaders.operator.an",
        "gle_and_trigonometry.sin.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012193,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.sin.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012194,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.sin.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012195,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.sin.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012196,
        "dEQP-GLES3.functional.shaders.operator.an",
        "gle_and_trigonometry.sin.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012197,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.sin.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012198,
        "dEQP-GLES3.functional.shaders.operator.an",
        "gle_and_trigonometry.sin.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012199,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.sin.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012200,
        "dEQP-GLES3.functional.shaders.operator.an",
        "gle_and_trigonometry.sin.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012201,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.sin.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012202,
        "dEQP-GLES3.functional.shaders.operator.an",
        "gle_and_trigonometry.sin.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012203,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.sin.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012204,
        "dEQP-GLES3.functional.shaders.operator.an",
        "gle_and_trigonometry.sin.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012205,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.sin.lowp_vec4_fragment");
