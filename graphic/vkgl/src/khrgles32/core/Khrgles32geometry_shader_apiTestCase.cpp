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
#include "../Khrgles32BaseFunc.h"
#include "../ActsKhrgles320001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000140,
        "KHR-GLES32.core.geometry_sha",
        "der.api.createShaderProgramv");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000141,
        "KHR-GLES32.core.geometr",
        "y_shader.api.shader_type");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000142,
        "KHR-GLES32.core.geometry",
        "_shader.api.getProgramiv");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000143,
        "KHR-GLES32.core.geometry",
        "_shader.api.getProgramiv2");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000144,
        "KHR-GLES32.core.geometry",
        "_shader.api.getProgramiv3");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000145,
        "KHR-GLES32.core.geometry_",
        "shader.api.fs_gs_draw_call");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000146,
        "KHR-GLES32.core.geometry_sh",
        "ader.api.max_image_uniforms");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000147,
        "KHR-GLES32.core.geometry_shade",
        "r.api.max_shader_storage_blocks");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000148,
        "KHR-GLES32.core.geometry_sh",
        "ader.api.max_atomic_counters");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000149,
        "KHR-GLES32.core.geometry_shader",
        ".api.max_atomic_counter_buffers");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000150,
        "KHR-GLES32.core.geometry_shader.api",
        ".pipeline_program_without_active_vs");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000151,
        "KHR-GLES32.core.geometry_shader",
        ".api.incompatible_draw_call_mode");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000152,
        "KHR-GLES32.core.geometry_shader.",
        "api.insufficient_emitted_vertices");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000153,
        "KHR-GLES32.core.geometry_shader.a",
        "pi.program_pipeline_vs_gs_capture");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000154,
        "KHR-GLES32.core.geometry_shader.api.draw_",
        "primitives_do_not_match_output_primitives");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000155,
        "KHR-GLES32.core.geometry_shader.",
        "api.draw_calls_while_tf_is_paused");
