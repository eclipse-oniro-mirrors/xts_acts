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

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000179,
        "KHR-GLESEXT.tessellation_shader.tessellation_sh",
        "ader_triangles_tessellation.degenerate_triangle");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000180,
        "KHR-GLESEXT.tessellation_shader.tessellation_sh",
        "ader_triangles_tessellation.identical_triangles");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000181,
        "KHR-GLESEXT.tessellation_shader.tessellation_shader_tr",
        "iangles_tessellation.inner_tessellation_level_rounding");