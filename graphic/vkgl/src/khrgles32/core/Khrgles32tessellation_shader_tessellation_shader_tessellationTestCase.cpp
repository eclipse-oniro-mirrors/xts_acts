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

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000202,
        "KHR-GLES32.core.tessellation_shader.tessellation_shader_",
        "tessellation.gl_InvocationID_PatchVerticesIn_PrimitiveID");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000203,
        "KHR-GLES32.core.tessellation_shader.te",
        "ssellation_shader_tessellation.TCS_TES");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000204,
        "KHR-GLES32.core.tessellation_shader.",
        "tessellation_shader_tessellation.TES");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000205,
        "KHR-GLES32.core.tessellation_shader.tessella",
        "tion_shader_tessellation.input_patch_discard");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000206,
        "KHR-GLES32.core.tessellation_shader.tessellat",
        "ion_shader_tessellation.max_in_out_attributes");
