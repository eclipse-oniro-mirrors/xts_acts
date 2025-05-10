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

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012422,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.atanh.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012423,
        "dEQP-GLES3.functional.shaders.operator.angle_",
        "and_trigonometry.atanh.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012424,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.atanh.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012425,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.atanh.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012426,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.atanh.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012427,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.atanh.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012428,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.atanh.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012429,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.atanh.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012430,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.atanh.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012431,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.atanh.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012432,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.atanh.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012433,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.atanh.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012434,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.atanh.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012435,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.atanh.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012436,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.atanh.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012437,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.atanh.highp_vec4_fragment");
