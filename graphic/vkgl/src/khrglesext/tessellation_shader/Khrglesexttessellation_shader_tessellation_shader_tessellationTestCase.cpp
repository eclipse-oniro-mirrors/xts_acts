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

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000174,
        "KHR-GLESEXT.tessellation_shader.tessellation_shader_te",
        "ssellation.gl_InvocationID_PatchVerticesIn_PrimitiveID");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000175,
        "KHR-GLESEXT.tessellation_shader.tess",
        "ellation_shader_tessellation.TCS_TES");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000176,
        "KHR-GLESEXT.tessellation_shader.te",
        "ssellation_shader_tessellation.TES");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000177,
        "KHR-GLESEXT.tessellation_shader.tessellati",
        "on_shader_tessellation.input_patch_discard");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000178,
        "KHR-GLESEXT.tessellation_shader.tessellatio",
        "n_shader_tessellation.max_in_out_attributes");
