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

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012254,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.asin.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012255,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.asin.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012256,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.asin.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012257,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.asin.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012258,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.asin.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012259,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.asin.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012260,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.asin.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012261,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.asin.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012262,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.asin.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012263,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.asin.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012264,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.asin.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012265,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.asin.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012266,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.asin.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012267,
        "dEQP-GLES3.functional.shaders.operator.angle",
        "_and_trigonometry.asin.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012268,
        "dEQP-GLES3.functional.shaders.operator.ang",
        "le_and_trigonometry.asin.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30013TestSuite, TestCase_012269,
        "dEQP-GLES3.functional.shaders.operator.angl",
        "e_and_trigonometry.asin.highp_vec4_fragment");
