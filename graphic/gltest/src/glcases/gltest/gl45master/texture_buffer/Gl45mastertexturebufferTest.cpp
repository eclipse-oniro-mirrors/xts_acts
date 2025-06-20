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
#include "../Gl45masterBaseFunc.h"
#include "../ActsGl45master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008405,
    "KHR-GL45.texture_buffer.texture_buffer_operations_buffer_load");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008406,
    "KHR-GL45.texture_buffer.texture_buffer_operations_cpu_writes");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008407,
    "KHR-GL45.texture_buffer.texture_buffer_operations_framebuffer_readback");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008408,
    "KHR-GL45.texture_buffer.texture_buffer_operations_transform_feedback");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008409,
    "KHR-GL45.texture_buffer.texture_buffer_operations_image_store");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008410,
    "KHR-GL45.texture_buffer.texture_buffer_operations_ssbo_writes");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008411,
    "KHR-GL45.texture_buffer.texture_buffer_max_size");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008412,
    "KHR-GL45.texture_buffer.texture_buffer_texture_buffer_range");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008413,
    "KHR-GL45.texture_buffer.texture_buffer_conv_int_to_float");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008414,
    "KHR-GL45.texture_buffer.texture_buffer_atomic_functions");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008415,
    "KHR-GL45.texture_buffer.texture_buffer_parameters");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008416,
    "KHR-GL45.texture_buffer.texture_buffer_errors");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008417,
    "KHR-GL45.texture_buffer.texture_buffer_active_uniform_validation_fragment_shader");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008418,
    "KHR-GL45.texture_buffer.texture_buffer_active_uniform_validation_compute_shader");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008419,
    "KHR-GL45.texture_buffer.texture_buffer_buffer_parameters");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008420,
    "KHR-GL45.texture_buffer.texture_buffer_precision");
