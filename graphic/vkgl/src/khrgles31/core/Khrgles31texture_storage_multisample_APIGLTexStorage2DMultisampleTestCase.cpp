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
#include "../ActsKhrgles310001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000002,
        "KHR-GLES31.core.texture_storage_multisample.APIGLTexStorage2DMult",
        "isample.multisample_texture_tex_storage_2d_general_samples_number");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000003,
        "KHR-GLES31.core.texture_storage_multisample.APIGLTexStorage2DMultisample",
        ".multisample_texture_tex_storage_2d_invalid_and_border_case_texture_sizes");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000004,
        "KHR-GLES31.core.texture_storage_multisample.APIGLTexStorage2DMultisample.multisa",
        "mple_texture_tex_storage_2d_non_color_depth_or_stencil_internal_formats_rejected");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000005,
        "KHR-GLES31.core.texture_storage_multisample.APIGLTexStorage2DMulti",
        "sample.multisample_texture_tex_storage_2d_reconfiguration_rejected");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000006,
        "KHR-GLES31.core.texture_storage_multisample.APIGLTexStorage2DMultis",
        "ample.multisample_texture_tex_storage_2d_texture_2d_multsample_array");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000007,
        "KHR-GLES31.core.texture_storage_multisample.APIGLTexStorage2DMultisample.multisa",
        "mple_texture_tex_storage_2d_unsupported_samples_count_for_color_textures_rejected");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000008,
        "KHR-GLES31.core.texture_storage_multisample.APIGLTexStorage2DMultisample.multisa",
        "mple_texture_tex_storage_2d_unsupported_samples_count_for_depth_textures_rejected");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000009,
        "KHR-GLES31.core.texture_storage_multisample.APIGLTexStorage2DMultisample.multisample",
        "_texture_tex_storage_2d_unsupported_samples_count_for_depth_stencil_textures_rejected");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000010,
        "KHR-GLES31.core.texture_storage_multisample.APIGLTexStorage",
        "2DMultisample.multisample_texture_tex_storage_2d_valid_calls");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000011,
        "KHR-GLES31.core.texture_storage_multisample.APIGLTexStorage",
        "2DMultisample.multisample_texture_tex_storage_2d_zero_sample");
