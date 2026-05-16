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
#include "../Khrgles3BaseFunc.h"
#include "../ActsKhrgles30004TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003908,
        "KHR-GLES3.framebuffer_completene",
        "ss.incomplete_missing_attachment");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003909,
        "KHR-GLES3.framebuffer_completen",
        "ess.incomplete_image_zero_width");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003910,
        "KHR-GLES3.framebuffer_completen",
        "ess.incomplete_image_zero_height");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003911,
        "KHR-GLES3.framebuffer_completenes",
        "s.incomplete_texture_3d_layer_oob");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003912,
        "KHR-GLES3.framebuffer_completenes",
        "s.incomplete_texture_2d_layer_oob");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003913,
        "KHR-GLES3.framebuffer_completeness",
        ".incomplete_texture_2d_mm_layer_oob");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003914,
        "KHR-GLES3.framebuffer_completeness.mut",
        "able_nbl_texture_expect_mipmap_complete");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003915,
        "KHR-GLES3.framebuffer_completeness.mu",
        "table_nbl_texture_expect_cube_complete");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003916,
        "KHR-GLES3.framebuffer_completeness",
        ".expect_renderable_internal_format");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003917,
        "KHR-GLES3.framebuffer_completenes",
        "s.all_rbos_expect_same_numsamples");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003918,
        "KHR-GLES3.framebuffer_completeness.r",
        "bo_and_texture_expect_zero_numsamples");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003919,
        "KHR-GLES3.framebuffer_com",
        "pleteness.status_tracking");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003920,
        "KHR-GLES3.framebuffer_completeness.mu",
        "table_texture_missing_attachment_level");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003921,
        "KHR-GLES3.framebuffer_completeness.imm",
        "utable_texture_any_level_as_attachment");
