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

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002543,
        "KHR-GLES31.core.gpu_shade",
        "r5.sampler_array_indexing");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002544,
        "KHR-GLES31.core.gpu_shad",
        "er5.images_array_indexing");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002545,
        "KHR-GLES31.core.gpu_shader5.a",
        "tomic_counters_array_indexing");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002546,
        "KHR-GLES31.core.gpu_shader5.",
        "uniform_blocks_array_indexing");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002547,
        "KHR-GLES31.core.gpu_sh",
        "ader5.precise_qualifier");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002548,
        "KHR-GLES31.core.gpu_",
        "shader5.fma_accuracy");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002549,
        "KHR-GLES31.core.gpu_sha",
        "der5.fma_precision_float");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002550,
        "KHR-GLES31.core.gpu_sha",
        "der5.fma_precision_vec2");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002551,
        "KHR-GLES31.core.gpu_sha",
        "der5.fma_precision_vec3");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002552,
        "KHR-GLES31.core.gpu_sha",
        "der5.fma_precision_vec4");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002553,
        "KHR-GLES31.core.gpu_shader5.tex",
        "ture_gather_offset_color_repeat");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002554,
        "KHR-GLES31.core.gpu_shader5.te",
        "xture_gather_offset_color_array");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002555,
        "KHR-GLES31.core.gpu_shader5.",
        "texture_gather_offsets_color");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002556,
        "KHR-GLES31.core.gpu_shader5.tex",
        "ture_gather_offset_depth_repeat");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002557,
        "KHR-GLES31.core.gpu_shader5.text",
        "ure_gather_offset_depth_repeat_y");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002558,
        "KHR-GLES31.core.gpu_shader5.te",
        "xture_gather_offset_depth_array");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002559,
        "KHR-GLES31.core.gpu_shader5.",
        "texture_gather_offsets_depth");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002560,
        "KHR-GLES31.core.gpu_shader5.texture",
        "_gather_offset_color_clamp_to_border");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002561,
        "KHR-GLES31.core.gpu_shader5.textur",
        "e_gather_offset_color_clamp_to_edge");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002562,
        "KHR-GLES31.core.gpu_shader5.textur",
        "e_gather_offset_depth_clamp_border");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002563,
        "KHR-GLES31.core.gpu_shader5.textu",
        "re_gather_offset_depth_clamp_edge");
