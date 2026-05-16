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
#include "../KhrglesextBaseFunc.h"
#include "../ActsKhrglesext0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000112,
        "KHR-GLESEXT.geometry_shade",
        "r.api.createShaderProgramv");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000113,
        "KHR-GLESEXT.geometry_",
        "shader.api.shader_type");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000114,
        "KHR-GLESEXT.geometry_s",
        "hader.api.getProgramiv");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000115,
        "KHR-GLESEXT.geometry_s",
        "hader.api.getProgramiv2");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000116,
        "KHR-GLESEXT.geometry_s",
        "hader.api.getProgramiv3");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000117,
        "KHR-GLESEXT.geometry_sh",
        "ader.api.fs_gs_draw_call");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000118,
        "KHR-GLESEXT.geometry_shad",
        "er.api.max_image_uniforms");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000119,
        "KHR-GLESEXT.geometry_shader.",
        "api.max_shader_storage_blocks");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000120,
        "KHR-GLESEXT.geometry_shad",
        "er.api.max_atomic_counters");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000121,
        "KHR-GLESEXT.geometry_shader.a",
        "pi.max_atomic_counter_buffers");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000122,
        "KHR-GLESEXT.geometry_shader.api.p",
        "ipeline_program_without_active_vs");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000123,
        "KHR-GLESEXT.geometry_shader.a",
        "pi.incompatible_draw_call_mode");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000124,
        "KHR-GLESEXT.geometry_shader.ap",
        "i.insufficient_emitted_vertices");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000125,
        "KHR-GLESEXT.geometry_shader.api",
        ".program_pipeline_vs_gs_capture");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000126,
        "KHR-GLESEXT.geometry_shader.api.draw_pr",
        "imitives_do_not_match_output_primitives");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000127,
        "KHR-GLESEXT.geometry_shader.ap",
        "i.draw_calls_while_tf_is_paused");
