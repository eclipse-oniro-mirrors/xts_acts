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

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012230,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.tan.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012231,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.tan.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012232,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.tan.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012233,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.tan.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012234,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.tan.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012235,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.tan.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012236,
        "dEQP-GLES3.functional.shaders.operator.an",
        "gle_and_trigonometry.tan.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012237,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.tan.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012238,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.tan.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012239,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.tan.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012240,
        "dEQP-GLES3.functional.shaders.operator.an",
        "gle_and_trigonometry.tan.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012241,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.tan.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012242,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.tan.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012243,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.tan.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012244,
        "dEQP-GLES3.functional.shaders.operator.an",
        "gle_and_trigonometry.tan.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012245,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.tan.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012246,
        "dEQP-GLES3.functional.shaders.operator.an",
        "gle_and_trigonometry.tan.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012247,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.tan.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012248,
        "dEQP-GLES3.functional.shaders.operator.an",
        "gle_and_trigonometry.tan.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012249,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.tan.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012250,
        "dEQP-GLES3.functional.shaders.operator.an",
        "gle_and_trigonometry.tan.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012251,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.tan.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012252,
        "dEQP-GLES3.functional.shaders.operator.an",
        "gle_and_trigonometry.tan.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012253,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.tan.lowp_vec4_fragment");
