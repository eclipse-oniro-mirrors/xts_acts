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
#include "../Gl46masterBaseFunc.h"
#include "../ActsGl46master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008241,
    "KHR-GL46.geometry_shader.api.createShaderProgramv");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008242,
    "KHR-GL46.geometry_shader.api.shader_type");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008243,
    "KHR-GL46.geometry_shader.api.getProgramiv");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008244,
    "KHR-GL46.geometry_shader.api.getProgramiv2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008245,
    "KHR-GL46.geometry_shader.api.getProgramiv3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008246,
    "KHR-GL46.geometry_shader.api.fs_gs_draw_call");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008247,
    "KHR-GL46.geometry_shader.api.max_image_uniforms");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008248,
    "KHR-GL46.geometry_shader.api.max_shader_storage_blocks");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008249,
    "KHR-GL46.geometry_shader.api.max_atomic_counters");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008250,
    "KHR-GL46.geometry_shader.api.max_atomic_counter_buffers");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008251,
    "KHR-GL46.geometry_shader.api.pipeline_program_without_active_vs");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008252,
    "KHR-GL46.geometry_shader.api.incompatible_draw_call_mode");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008253,
    "KHR-GL46.geometry_shader.api.insufficient_emitted_vertices");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008254,
    "KHR-GL46.geometry_shader.api.program_pipeline_vs_gs_capture");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008255,
    "KHR-GL46.geometry_shader.api.draw_primitives_do_not_match_output_primitives");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_008256,
    "KHR-GL46.geometry_shader.api.draw_calls_while_tf_is_paused");
