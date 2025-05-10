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
#include "../Khrgles31BaseFunc.h"
#include "../ActsKhrgles310003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002518,
        "KHR-GLES31.core.geometry_sha",
        "der.api.createShaderProgramv");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002519,
        "KHR-GLES31.core.geometr",
        "y_shader.api.shader_type");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002520,
        "KHR-GLES31.core.geometry",
        "_shader.api.getProgramiv");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002521,
        "KHR-GLES31.core.geometry",
        "_shader.api.getProgramiv2");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002522,
        "KHR-GLES31.core.geometry",
        "_shader.api.getProgramiv3");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002523,
        "KHR-GLES31.core.geometry_",
        "shader.api.fs_gs_draw_call");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002524,
        "KHR-GLES31.core.geometry_sh",
        "ader.api.max_image_uniforms");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002525,
        "KHR-GLES31.core.geometry_shade",
        "r.api.max_shader_storage_blocks");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002526,
        "KHR-GLES31.core.geometry_sh",
        "ader.api.max_atomic_counters");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002527,
        "KHR-GLES31.core.geometry_shader",
        ".api.max_atomic_counter_buffers");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002528,
        "KHR-GLES31.core.geometry_shader.api",
        ".pipeline_program_without_active_vs");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002529,
        "KHR-GLES31.core.geometry_shader",
        ".api.incompatible_draw_call_mode");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002530,
        "KHR-GLES31.core.geometry_shader.",
        "api.insufficient_emitted_vertices");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002531,
        "KHR-GLES31.core.geometry_shader.a",
        "pi.program_pipeline_vs_gs_capture");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002532,
        "KHR-GLES31.core.geometry_shader.api.draw_",
        "primitives_do_not_match_output_primitives");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002533,
        "KHR-GLES31.core.geometry_shader.",
        "api.draw_calls_while_tf_is_paused");
