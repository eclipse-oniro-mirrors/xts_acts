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

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000303,
        "KHR-GLES32.core.texture_buffer.tex",
        "ture_buffer_operations_buffer_load");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000304,
        "KHR-GLES32.core.texture_buffer.te",
        "xture_buffer_operations_cpu_writes");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000305,
        "KHR-GLES32.core.texture_buffer.texture",
        "_buffer_operations_framebuffer_readback");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000306,
        "KHR-GLES32.core.texture_buffer.textur",
        "e_buffer_operations_transform_feedback");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000307,
        "KHR-GLES32.core.texture_buffer.tex",
        "ture_buffer_operations_image_store");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000308,
        "KHR-GLES32.core.texture_buffer.tex",
        "ture_buffer_operations_ssbo_writes");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000309,
        "KHR-GLES32.core.texture_buf",
        "fer.texture_buffer_max_size");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000310,
        "KHR-GLES32.core.texture_buffer.te",
        "xture_buffer_texture_buffer_range");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000311,
        "KHR-GLES32.core.texture_buffer.",
        "texture_buffer_conv_int_to_float");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000312,
        "KHR-GLES32.core.texture_buffer.",
        "texture_buffer_atomic_functions");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000313,
        "KHR-GLES32.core.texture_buff",
        "er.texture_buffer_parameters");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000314,
        "KHR-GLES32.core.texture_bu",
        "ffer.texture_buffer_errors");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000315,
        "KHR-GLES32.core.texture_buffer.texture_buff",
        "er_active_uniform_validation_fragment_shader");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000316,
        "KHR-GLES32.core.texture_buffer.texture_buff",
        "er_active_uniform_validation_compute_shader");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000317,
        "KHR-GLES32.core.texture_buffer.",
        "texture_buffer_buffer_parameters");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000318,
        "KHR-GLES32.core.texture_buf",
        "fer.texture_buffer_precision");
