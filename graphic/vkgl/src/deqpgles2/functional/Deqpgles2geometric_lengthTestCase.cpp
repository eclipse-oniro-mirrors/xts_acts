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

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006412,
        "dEQP-GLES2.functional.shaders.operator",
        ".geometric.length.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006413,
        "dEQP-GLES2.functional.shaders.operator.",
        "geometric.length.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006414,
        "dEQP-GLES2.functional.shaders.operato",
        "r.geometric.length.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006415,
        "dEQP-GLES2.functional.shaders.operator",
        ".geometric.length.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006416,
        "dEQP-GLES2.functional.shaders.operato",
        "r.geometric.length.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006417,
        "dEQP-GLES2.functional.shaders.operator",
        ".geometric.length.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006418,
        "dEQP-GLES2.functional.shaders.operat",
        "or.geometric.length.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006419,
        "dEQP-GLES2.functional.shaders.operato",
        "r.geometric.length.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006420,
        "dEQP-GLES2.functional.shaders.operato",
        "r.geometric.length.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006421,
        "dEQP-GLES2.functional.shaders.operator",
        ".geometric.length.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006422,
        "dEQP-GLES2.functional.shaders.operat",
        "or.geometric.length.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006423,
        "dEQP-GLES2.functional.shaders.operato",
        "r.geometric.length.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006424,
        "dEQP-GLES2.functional.shaders.operato",
        "r.geometric.length.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006425,
        "dEQP-GLES2.functional.shaders.operator",
        ".geometric.length.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006426,
        "dEQP-GLES2.functional.shaders.operat",
        "or.geometric.length.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006427,
        "dEQP-GLES2.functional.shaders.operato",
        "r.geometric.length.highp_vec4_fragment");
