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

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000035,
        "KHR-GLES31.core.texture_storage_multisample.APIDepende",
        "ncies.fbo_with_attachments_of_varying_amount_of_samples");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000036,
        "KHR-GLES31.core.texture_storage_multisample.APIDepe",
        "ndencies.fbo_with_single_and_multisample_attachments");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000037,
        "KHR-GLES31.core.texture_storage_multisample.APIDependenci",
        "es.fbo_with_fixed_and_varying_sample_locations_attachments");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000038,
        "KHR-GLES31.core.texture_storage_multisample.APIDependencies.fbo_with",
        "_different_fixedsamplelocations_texture_and_renderbuffer_attachments");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000039,
        "KHR-GLES31.core.texture_storage_multisample.APIDependencies.fbo_with_render",
        "buffer_and_multisample_texture_attachments_with_different_number_of_samples");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000040,
        "KHR-GLES31.core.texture_storage_multisample.APIDependenci",
        "es.framebuffer_texture2d_used_with_invalid_texture_target");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000041,
        "KHR-GLES31.core.texture_storage_multisample.APIDepen",
        "dencies.framebuffer_texture2d_used_with_invalid_level");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000042,
        "KHR-GLES31.core.texture_storage_multisample.APIDependencie",
        "s.framebuffer_texture_layer_used_for_invalid_texture_target");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000043,
        "KHR-GLES31.core.texture_storage_multisample.APIDependencies",
        ".framebuffer_texture_layer_used_with_invalid_level_argument");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000044,
        "KHR-GLES31.core.texture_storage_multisample.APIDependencies.renderbuffer_s",
        "torage_multisample_invalid_samples_argument_for_noninteger_internalformats");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000045,
        "KHR-GLES31.core.texture_storage_multisample.APIDependencies.renderbuffer",
        "_storage_multisample_invalid_samples_argument_for_integer_internalformats");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000046,
        "KHR-GLES31.core.texture_storage_multisample.APIDependencie",
        "s.no_error_generated_for_valid_framebuffer_texture2d_calls");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000047,
        "KHR-GLES31.core.texture_storage_multisample.APIDependencies.no_",
        "error_generated_for_valid_renderbuffer_storage_multisample_calls");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000048,
        "KHR-GLES31.core.texture_storage_multisam",
        "ple.APIDependencies.tex_parameter_support");
