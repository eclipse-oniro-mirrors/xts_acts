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
#include "../ActsDeqpgles20008TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007784,
        "dEQP-GLES2.functional.shaders.builti",
        "n_variable.max_vertex_attribs_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007785,
        "dEQP-GLES2.functional.shaders.builtin",
        "_variable.max_vertex_attribs_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007786,
        "dEQP-GLES2.functional.shaders.builtin_va",
        "riable.max_vertex_uniform_vectors_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007787,
        "dEQP-GLES2.functional.shaders.builtin_var",
        "iable.max_vertex_uniform_vectors_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007788,
        "dEQP-GLES2.functional.shaders.builtin_var",
        "iable.max_fragment_uniform_vectors_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007789,
        "dEQP-GLES2.functional.shaders.builtin_vari",
        "able.max_fragment_uniform_vectors_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007790,
        "dEQP-GLES2.functional.shaders.builti",
        "n_variable.max_varying_vectors_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007791,
        "dEQP-GLES2.functional.shaders.builtin",
        "_variable.max_varying_vectors_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007792,
        "dEQP-GLES2.functional.shaders.builtin_",
        "variable.max_texture_image_units_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007793,
        "dEQP-GLES2.functional.shaders.builtin_v",
        "ariable.max_texture_image_units_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007794,
        "dEQP-GLES2.functional.shaders.builtin_vari",
        "able.max_vertex_texture_image_units_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007795,
        "dEQP-GLES2.functional.shaders.builtin_varia",
        "ble.max_vertex_texture_image_units_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007796,
        "dEQP-GLES2.functional.shaders.builtin_varia",
        "ble.max_combined_texture_image_units_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007797,
        "dEQP-GLES2.functional.shaders.builtin_variab",
        "le.max_combined_texture_image_units_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007798,
        "dEQP-GLES2.functional.shaders.built",
        "in_variable.max_draw_buffers_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007799,
        "dEQP-GLES2.functional.shaders.builti",
        "n_variable.max_draw_buffers_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007800,
        "dEQP-GLES2.functional.shaders.bu",
        "iltin_variable.depth_range_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007801,
        "dEQP-GLES2.functional.shaders.bui",
        "ltin_variable.depth_range_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007802,
        "dEQP-GLES2.functional.shaders.",
        "builtin_variable.fragcoord_xyz");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007803,
        "dEQP-GLES2.functional.shaders",
        ".builtin_variable.fragcoord_w");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007804,
        "dEQP-GLES2.functional.shader",
        "s.builtin_variable.pointcoord");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007805,
        "dEQP-GLES2.functional.shaders",
        ".builtin_variable.frontfacing");
