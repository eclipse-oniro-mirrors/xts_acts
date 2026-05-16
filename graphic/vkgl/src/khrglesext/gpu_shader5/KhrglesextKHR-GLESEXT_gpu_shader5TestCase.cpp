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

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000137,
        "KHR-GLESEXT.gpu_shader5",
        ".sampler_array_indexing");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000138,
        "KHR-GLESEXT.gpu_shader",
        "5.images_array_indexing");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000139,
        "KHR-GLESEXT.gpu_shader5.ato",
        "mic_counters_array_indexing");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000140,
        "KHR-GLESEXT.gpu_shader5.un",
        "iform_blocks_array_indexing");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000141,
        "KHR-GLESEXT.gpu_shad",
        "er5.precise_qualifier");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000142,
        "KHR-GLESEXT.gpu_sh",
        "ader5.fma_accuracy");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000143,
        "KHR-GLESEXT.gpu_shade",
        "r5.fma_precision_float");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000144,
        "KHR-GLESEXT.gpu_shade",
        "r5.fma_precision_vec2");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000145,
        "KHR-GLESEXT.gpu_shade",
        "r5.fma_precision_vec3");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000146,
        "KHR-GLESEXT.gpu_shade",
        "r5.fma_precision_vec4");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000147,
        "KHR-GLESEXT.gpu_shader5.textu",
        "re_gather_offset_color_repeat");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000148,
        "KHR-GLESEXT.gpu_shader5.text",
        "ure_gather_offset_color_array");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000149,
        "KHR-GLESEXT.gpu_shader5.te",
        "xture_gather_offsets_color");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000150,
        "KHR-GLESEXT.gpu_shader5.textu",
        "re_gather_offset_depth_repeat");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000151,
        "KHR-GLESEXT.gpu_shader5.textur",
        "e_gather_offset_depth_repeat_y");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000152,
        "KHR-GLESEXT.gpu_shader5.text",
        "ure_gather_offset_depth_array");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000153,
        "KHR-GLESEXT.gpu_shader5.te",
        "xture_gather_offsets_depth");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000154,
        "KHR-GLESEXT.gpu_shader5.texture_g",
        "ather_offset_color_clamp_to_border");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000155,
        "KHR-GLESEXT.gpu_shader5.texture_",
        "gather_offset_color_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000156,
        "KHR-GLESEXT.gpu_shader5.texture_",
        "gather_offset_depth_clamp_border");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000157,
        "KHR-GLESEXT.gpu_shader5.texture",
        "_gather_offset_depth_clamp_edge");
