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
#include "../Gl45masterBaseFunc.h"
#include "../ActsGl45master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008266,
    "KHR-GL45.gpu_shader5.sampler_array_indexing");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008267,
    "KHR-GL45.gpu_shader5.images_array_indexing");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008268,
    "KHR-GL45.gpu_shader5.atomic_counters_array_indexing");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008269,
    "KHR-GL45.gpu_shader5.uniform_blocks_array_indexing");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008270,
    "KHR-GL45.gpu_shader5.ssbo_array_indexing");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008271,
    "KHR-GL45.gpu_shader5.precise_qualifier");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008272,
    "KHR-GL45.gpu_shader5.fma_accuracy");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008273,
    "KHR-GL45.gpu_shader5.fma_precision_float");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008274,
    "KHR-GL45.gpu_shader5.fma_precision_vec2");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008275,
    "KHR-GL45.gpu_shader5.fma_precision_vec3");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008276,
    "KHR-GL45.gpu_shader5.fma_precision_vec4");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008277,
    "KHR-GL45.gpu_shader5.texture_gather_offset_color_repeat");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008278,
    "KHR-GL45.gpu_shader5.texture_gather_offset_color_array");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008279,
    "KHR-GL45.gpu_shader5.texture_gather_offsets_color");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008280,
    "KHR-GL45.gpu_shader5.texture_gather_offset_depth_repeat");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008281,
    "KHR-GL45.gpu_shader5.texture_gather_offset_depth_repeat_y");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008282,
    "KHR-GL45.gpu_shader5.texture_gather_offset_depth_array");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008283,
    "KHR-GL45.gpu_shader5.texture_gather_offsets_depth");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008284,
    "KHR-GL45.gpu_shader5.texture_gather_offset_color_clamp_to_border");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008285,
    "KHR-GL45.gpu_shader5.texture_gather_offset_color_clamp_to_edge");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008286,
    "KHR-GL45.gpu_shader5.texture_gather_offset_depth_clamp_border");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008287,
    "KHR-GL45.gpu_shader5.texture_gather_offset_depth_clamp_edge");
