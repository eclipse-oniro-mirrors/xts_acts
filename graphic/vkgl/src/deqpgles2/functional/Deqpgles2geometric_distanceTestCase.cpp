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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20007TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006428,
        "dEQP-GLES2.functional.shaders.operator.",
        "geometric.distance.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006429,
        "dEQP-GLES2.functional.shaders.operator.g",
        "eometric.distance.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006430,
        "dEQP-GLES2.functional.shaders.operator",
        ".geometric.distance.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006431,
        "dEQP-GLES2.functional.shaders.operator.",
        "geometric.distance.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006432,
        "dEQP-GLES2.functional.shaders.operator",
        ".geometric.distance.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006433,
        "dEQP-GLES2.functional.shaders.operator.",
        "geometric.distance.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006434,
        "dEQP-GLES2.functional.shaders.operato",
        "r.geometric.distance.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006435,
        "dEQP-GLES2.functional.shaders.operator",
        ".geometric.distance.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006436,
        "dEQP-GLES2.functional.shaders.operator",
        ".geometric.distance.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006437,
        "dEQP-GLES2.functional.shaders.operator.",
        "geometric.distance.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006438,
        "dEQP-GLES2.functional.shaders.operato",
        "r.geometric.distance.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006439,
        "dEQP-GLES2.functional.shaders.operator",
        ".geometric.distance.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006440,
        "dEQP-GLES2.functional.shaders.operator",
        ".geometric.distance.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006441,
        "dEQP-GLES2.functional.shaders.operator.",
        "geometric.distance.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006442,
        "dEQP-GLES2.functional.shaders.operato",
        "r.geometric.distance.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006443,
        "dEQP-GLES2.functional.shaders.operator",
        ".geometric.distance.highp_vec4_fragment");
