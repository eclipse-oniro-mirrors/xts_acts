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

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006464,
        "dEQP-GLES2.functional.shaders.operator.",
        "geometric.normalize.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006465,
        "dEQP-GLES2.functional.shaders.operator.g",
        "eometric.normalize.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006466,
        "dEQP-GLES2.functional.shaders.operator",
        ".geometric.normalize.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006467,
        "dEQP-GLES2.functional.shaders.operator.",
        "geometric.normalize.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006468,
        "dEQP-GLES2.functional.shaders.operator.",
        "geometric.normalize.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006469,
        "dEQP-GLES2.functional.shaders.operator.g",
        "eometric.normalize.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006470,
        "dEQP-GLES2.functional.shaders.operator",
        ".geometric.normalize.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006471,
        "dEQP-GLES2.functional.shaders.operator.",
        "geometric.normalize.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006472,
        "dEQP-GLES2.functional.shaders.operator.",
        "geometric.normalize.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006473,
        "dEQP-GLES2.functional.shaders.operator.g",
        "eometric.normalize.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006474,
        "dEQP-GLES2.functional.shaders.operator",
        ".geometric.normalize.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006475,
        "dEQP-GLES2.functional.shaders.operator.",
        "geometric.normalize.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006476,
        "dEQP-GLES2.functional.shaders.operator.",
        "geometric.normalize.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006477,
        "dEQP-GLES2.functional.shaders.operator.g",
        "eometric.normalize.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006478,
        "dEQP-GLES2.functional.shaders.operator",
        ".geometric.normalize.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006479,
        "dEQP-GLES2.functional.shaders.operator.",
        "geometric.normalize.highp_vec4_fragment");
