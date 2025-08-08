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

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000165,
        "KHR-GLES32.core.gpu_shade",
        "r5.sampler_array_indexing");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000166,
        "KHR-GLES32.core.gpu_shad",
        "er5.images_array_indexing");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000167,
        "KHR-GLES32.core.gpu_shader5.a",
        "tomic_counters_array_indexing");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000168,
        "KHR-GLES32.core.gpu_shader5.",
        "uniform_blocks_array_indexing");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000169,
        "KHR-GLES32.core.gpu_sh",
        "ader5.precise_qualifier");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000170,
        "KHR-GLES32.core.gpu_",
        "shader5.fma_accuracy");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000171,
        "KHR-GLES32.core.gpu_sha",
        "der5.fma_precision_float");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000172,
        "KHR-GLES32.core.gpu_sha",
        "der5.fma_precision_vec2");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000173,
        "KHR-GLES32.core.gpu_sha",
        "der5.fma_precision_vec3");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000174,
        "KHR-GLES32.core.gpu_sha",
        "der5.fma_precision_vec4");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000175,
        "KHR-GLES32.core.gpu_shader5.tex",
        "ture_gather_offset_color_repeat");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000176,
        "KHR-GLES32.core.gpu_shader5.te",
        "xture_gather_offset_color_array");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000177,
        "KHR-GLES32.core.gpu_shader5.",
        "texture_gather_offsets_color");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000178,
        "KHR-GLES32.core.gpu_shader5.tex",
        "ture_gather_offset_depth_repeat");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000179,
        "KHR-GLES32.core.gpu_shader5.text",
        "ure_gather_offset_depth_repeat_y");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000180,
        "KHR-GLES32.core.gpu_shader5.te",
        "xture_gather_offset_depth_array");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000181,
        "KHR-GLES32.core.gpu_shader5.",
        "texture_gather_offsets_depth");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000182,
        "KHR-GLES32.core.gpu_shader5.texture",
        "_gather_offset_color_clamp_to_border");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000183,
        "KHR-GLES32.core.gpu_shader5.textur",
        "e_gather_offset_color_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000184,
        "KHR-GLES32.core.gpu_shader5.textur",
        "e_gather_offset_depth_clamp_border");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000185,
        "KHR-GLES32.core.gpu_shader5.textu",
        "re_gather_offset_depth_clamp_edge");
