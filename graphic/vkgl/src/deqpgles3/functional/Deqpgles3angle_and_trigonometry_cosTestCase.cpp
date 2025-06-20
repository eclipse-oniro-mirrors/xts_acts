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

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012206,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.cos.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012207,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.cos.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012208,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.cos.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012209,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.cos.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012210,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.cos.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012211,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.cos.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012212,
        "dEQP-GLES3.functional.shaders.operator.an",
        "gle_and_trigonometry.cos.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012213,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.cos.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012214,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.cos.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012215,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.cos.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012216,
        "dEQP-GLES3.functional.shaders.operator.an",
        "gle_and_trigonometry.cos.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012217,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.cos.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012218,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.cos.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012219,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.cos.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012220,
        "dEQP-GLES3.functional.shaders.operator.an",
        "gle_and_trigonometry.cos.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012221,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.cos.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012222,
        "dEQP-GLES3.functional.shaders.operator.an",
        "gle_and_trigonometry.cos.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012223,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.cos.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012224,
        "dEQP-GLES3.functional.shaders.operator.an",
        "gle_and_trigonometry.cos.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012225,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.cos.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012226,
        "dEQP-GLES3.functional.shaders.operator.an",
        "gle_and_trigonometry.cos.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012227,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.cos.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012228,
        "dEQP-GLES3.functional.shaders.operator.an",
        "gle_and_trigonometry.cos.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012229,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.cos.lowp_vec4_fragment");
