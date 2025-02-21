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
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310006TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005017,
        "dEQP-GLES31.functional.shaders.builtin_constants.te",
        "ssellation_shader.max_tess_control_input_components");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005018,
        "dEQP-GLES31.functional.shaders.builtin_constants.te",
        "ssellation_shader.max_tess_control_output_components");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005019,
        "dEQP-GLES31.functional.shaders.builtin_constants.tes",
        "sellation_shader.max_tess_control_texture_image_units");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005020,
        "dEQP-GLES31.functional.shaders.builtin_constants.tes",
        "sellation_shader.max_tess_control_uniform_components");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005021,
        "dEQP-GLES31.functional.shaders.builtin_constants.tesse",
        "llation_shader.max_tess_control_total_output_components");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005022,
        "dEQP-GLES31.functional.shaders.builtin_constants.t",
        "essellation_shader.max_tess_control_image_uniforms");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005023,
        "dEQP-GLES31.functional.shaders.builtin_constants.te",
        "ssellation_shader.max_tess_evaluation_image_uniforms");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005024,
        "dEQP-GLES31.functional.shaders.builtin_constants.t",
        "essellation_shader.max_tess_control_atomic_counters");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005025,
        "dEQP-GLES31.functional.shaders.builtin_constants.tes",
        "sellation_shader.max_tess_evaluation_atomic_counters");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005026,
        "dEQP-GLES31.functional.shaders.builtin_constants.tesse",
        "llation_shader.max_tess_control_atomic_counter_buffers");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005027,
        "dEQP-GLES31.functional.shaders.builtin_constants.tessel",
        "lation_shader.max_tess_evaluation_atomic_counter_buffers");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005028,
        "dEQP-GLES31.functional.shaders.builtin_constants.tes",
        "sellation_shader.max_tess_evaluation_input_components");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005029,
        "dEQP-GLES31.functional.shaders.builtin_constants.tess",
        "ellation_shader.max_tess_evaluation_output_components");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005030,
        "dEQP-GLES31.functional.shaders.builtin_constants.tesse",
        "llation_shader.max_tess_evaluation_texture_image_units");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005031,
        "dEQP-GLES31.functional.shaders.builtin_constants.tess",
        "ellation_shader.max_tess_evaluation_uniform_components");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005032,
        "dEQP-GLES31.functional.shaders.builtin_constant",
        "s.tessellation_shader.max_tess_patch_components");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005033,
        "dEQP-GLES31.functional.shaders.builtin_cons",
        "tants.tessellation_shader.max_patch_vertices");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005034,
        "dEQP-GLES31.functional.shaders.builtin_cons",
        "tants.tessellation_shader.max_tess_gen_level");
