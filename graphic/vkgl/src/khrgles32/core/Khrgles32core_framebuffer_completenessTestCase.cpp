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
#include "../ActsKhrgles320002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001149,
        "KHR-GLES32.core.framebuffer_complet",
        "eness.incomplete_missing_attachment");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001150,
        "KHR-GLES32.core.framebuffer_comple",
        "teness.incomplete_image_zero_width");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001151,
        "KHR-GLES32.core.framebuffer_comple",
        "teness.incomplete_image_zero_height");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001152,
        "KHR-GLES32.core.framebuffer_complete",
        "ness.incomplete_texture_3d_layer_oob");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001153,
        "KHR-GLES32.core.framebuffer_complete",
        "ness.incomplete_texture_2d_layer_oob");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001154,
        "KHR-GLES32.core.framebuffer_completen",
        "ess.incomplete_texture_2d_mm_layer_oob");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001155,
        "KHR-GLES32.core.framebuffer_completeness.",
        "mutable_nbl_texture_expect_mipmap_complete");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001156,
        "KHR-GLES32.core.framebuffer_completeness",
        ".mutable_nbl_texture_expect_cube_complete");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001157,
        "KHR-GLES32.core.framebuffer_completen",
        "ess.expect_renderable_internal_format");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001158,
        "KHR-GLES32.core.framebuffer_complete",
        "ness.all_rbos_expect_same_numsamples");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001159,
        "KHR-GLES32.core.framebuffer_completenes",
        "s.rbo_and_texture_expect_zero_numsamples");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001160,
        "KHR-GLES32.core.framebuffer_comp",
        "leteness.expect_equal_numsamples");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001161,
        "KHR-GLES32.core.framebuffer_",
        "completeness.status_tracking");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001162,
        "KHR-GLES32.core.framebuffer_completeness",
        ".mutable_texture_missing_attachment_level");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001163,
        "KHR-GLES32.core.framebuffer_completeness.",
        "immutable_texture_any_level_as_attachment");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001164,
        "KHR-GLES32.core.framebuffer_completeness.cube",
        "_map_layered_attachment_valid_size_and_format");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001165,
        "KHR-GLES32.core.framebuffer_completeness.cu",
        "be_map_layered_attachment_different_formats");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001166,
        "KHR-GLES32.core.framebuffer_completeness.c",
        "ube_map_layered_attachment_different_sizes");
