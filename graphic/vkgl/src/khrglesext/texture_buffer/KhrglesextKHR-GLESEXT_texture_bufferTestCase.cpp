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

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000274,
        "KHR-GLESEXT.texture_buffer.textu",
        "re_buffer_operations_buffer_load");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000275,
        "KHR-GLESEXT.texture_buffer.text",
        "ure_buffer_operations_cpu_writes");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000276,
        "KHR-GLESEXT.texture_buffer.texture_b",
        "uffer_operations_framebuffer_readback");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000277,
        "KHR-GLESEXT.texture_buffer.texture_",
        "buffer_operations_transform_feedback");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000278,
        "KHR-GLESEXT.texture_buffer.textu",
        "re_buffer_operations_image_store");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000279,
        "KHR-GLESEXT.texture_buffer.textu",
        "re_buffer_operations_ssbo_writes");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000280,
        "KHR-GLESEXT.texture_buffe",
        "r.texture_buffer_max_size");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000281,
        "KHR-GLESEXT.texture_buffer.text",
        "ure_buffer_texture_buffer_range");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000282,
        "KHR-GLESEXT.texture_buffer.te",
        "xture_buffer_conv_int_to_float");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000283,
        "KHR-GLESEXT.texture_buffer.te",
        "xture_buffer_atomic_functions");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000284,
        "KHR-GLESEXT.texture_buffer",
        ".texture_buffer_parameters");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000285,
        "KHR-GLESEXT.texture_buff",
        "er.texture_buffer_errors");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000286,
        "KHR-GLESEXT.texture_buffer.texture_buffer",
        "_active_uniform_validation_fragment_shader");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000287,
        "KHR-GLESEXT.texture_buffer.texture_buffer",
        "_active_uniform_validation_compute_shader");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000288,
        "KHR-GLESEXT.texture_buffer.te",
        "xture_buffer_buffer_parameters");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000289,
        "KHR-GLESEXT.texture_buffe",
        "r.texture_buffer_precision");
