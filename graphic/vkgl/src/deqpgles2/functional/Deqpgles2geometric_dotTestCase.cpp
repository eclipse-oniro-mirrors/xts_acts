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

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006444,
        "dEQP-GLES2.functional.shaders.operat",
        "or.geometric.dot.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006445,
        "dEQP-GLES2.functional.shaders.operato",
        "r.geometric.dot.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006446,
        "dEQP-GLES2.functional.shaders.opera",
        "tor.geometric.dot.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006447,
        "dEQP-GLES2.functional.shaders.operat",
        "or.geometric.dot.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006448,
        "dEQP-GLES2.functional.shaders.operat",
        "or.geometric.dot.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006449,
        "dEQP-GLES2.functional.shaders.operato",
        "r.geometric.dot.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006450,
        "dEQP-GLES2.functional.shaders.opera",
        "tor.geometric.dot.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006451,
        "dEQP-GLES2.functional.shaders.operat",
        "or.geometric.dot.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006452,
        "dEQP-GLES2.functional.shaders.operat",
        "or.geometric.dot.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006453,
        "dEQP-GLES2.functional.shaders.operato",
        "r.geometric.dot.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006454,
        "dEQP-GLES2.functional.shaders.opera",
        "tor.geometric.dot.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006455,
        "dEQP-GLES2.functional.shaders.operat",
        "or.geometric.dot.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006456,
        "dEQP-GLES2.functional.shaders.operat",
        "or.geometric.dot.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006457,
        "dEQP-GLES2.functional.shaders.operato",
        "r.geometric.dot.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006458,
        "dEQP-GLES2.functional.shaders.opera",
        "tor.geometric.dot.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20007TestSuite, TestCase_006459,
        "dEQP-GLES2.functional.shaders.operat",
        "or.geometric.dot.highp_vec4_fragment");
