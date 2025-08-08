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

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000049,
        "KHR-GLES31.core.texture_storage_multisample.GLC",
        "overage.extension_specific_enums_are_recognized");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000050,
        "KHR-GLES31.core.texture_storage_multisample.GLCoverage.get_tex_para",
        "meter_reports_correct_default_values_for_multisample_texture_targets");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000051,
        "KHR-GLES31.core.texture_storage_multisample.GLCover",
        "age.gl_sample_mask_mode_status_is_reported_correctly");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000052,
        "KHR-GLES31.core.texture_storage_multisample.GLCover",
        "age.gl_tex_parameter_handlers_accept_zero_base_level");
