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

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000012,
        "KHR-GLES31.core.texture_storage_multisample.APIGLTexStorage3DMult",
        "isample.invalid_texture_sizes_are_rejected_valid_are_accepted_test");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000013,
        "KHR-GLES31.core.texture_storage_multisample.APIGLTexStorage",
        "3DMultisample.multisample_texture_tex_storage_3d_zero_sample");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000014,
        "KHR-GLES31.core.texture_storage_multisample.APIGLTexStorage3DMultisamp",
        "le.non_color_depth_stencil_renderable_internalformats_are_rejected_test");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000015,
        "KHR-GLES31.core.texture_storage_multisample.APIGLTexStorage3DMultisample.requests_to_",
        "set_up_multisample_color_textures_with_unsupported_number_of_samples_are_rejected_test");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000016,
        "KHR-GLES31.core.texture_storage_multisample.APIGLTexStorage3DMultisample.requests_to_",
        "set_up_multisample_depth_textures_with_unsupported_number_of_samples_are_rejected_test");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000017,
        "KHR-GLES31.core.texture_storage_multisample.APIGLTexStorage3DMultisample.requests_to_s",
        "et_up_multisample_stencil_textures_with_unsupported_number_of_samples_are_rejected_test");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000018,
        "KHR-GLES31.core.texture_storage_multisample.APIGLTexStorage3DMultisample.reques",
        "ts_to_set_up_multisample_textures_with_valid_and_invalid_number_of_samples_test");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000019,
        "KHR-GLES31.core.texture_storage_multisample.APIGLTexStorage",
        "3DMultisample.texture_2D_multisample_target_is_rejected_test");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000020,
        "KHR-GLES31.core.texture_storage_multisample.APIGLTexStor",
        "age3DMultisample.valid_internalformats_are_accepted_test");
