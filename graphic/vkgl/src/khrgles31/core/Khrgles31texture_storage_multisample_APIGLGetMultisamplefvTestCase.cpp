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

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000021,
        "KHR-GLES31.core.texture_storage_multisample.APIGLGetMultisamplefv.m",
        "ultisample_texture_get_multisamplefv_index_equal_gl_samples_rejected");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000022,
        "KHR-GLES31.core.texture_storage_multisample.APIGLGetMultisamplefv.mu",
        "ltisample_texture_get_multisamplefv_index_greater_gl_samples_rejected");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000023,
        "KHR-GLES31.core.texture_storage_multisample.APIGLGetMultisample",
        "fv.multisample_texture_get_multisamplefv_invalid_pname_rejected");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000024,
        "KHR-GLES31.core.texture_storage_multisample.APIGLGetMultisamplefv",
        ".multisample_texture_get_multisamplefv_null_val_arguments_accepted");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000025,
        "KHR-GLES31.core.texture_storage_multisample.APIGLGetMultisamplefv.mu",
        "ltisample_texture_get_multisamplefv_sample_position_values_validation");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000026,
        "KHR-GLES31.core.texture_storage_multisample.APIGLGetM",
        "ultisamplefv.multisample_texture_sample_maski_getters");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000027,
        "KHR-GLES31.core.texture_storage_multisample.APIGLGetMultisamplefv.mult",
        "isample_texture_sample_maski_index_lower_than_gl_max_sample_mask_words");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000028,
        "KHR-GLES31.core.texture_storage_multisample.APIGLGetMultisamplefv.m",
        "ultisample_texture_sample_maski_index_equal_gl_max_sample_mask_words");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000029,
        "KHR-GLES31.core.texture_storage_multisample.APIGLGetMultisamplefv.mu",
        "ltisample_texture_sample_maski_index_greater_gl_max_sample_mask_words");
