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

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000072,
        "KHR-GLESEXT.geometry_shader.layered_rendering_boundary_cond",
        "ition.layered_rendering_boundary_condition_various_textures");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000073,
        "KHR-GLESEXT.geometry_shader.layered_rendering_boundar",
        "y_condition.layered_rendering_boundary_condition_no_gs");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000074,
        "KHR-GLESEXT.geometry_shader.layered_rendering_boundary_cond",
        "ition.layered_rendering_boundary_condition_no_default_layer");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000075,
        "KHR-GLESEXT.geometry_shader.layered_rendering_boundary_con",
        "dition.layered_rendering_boundary_condition_no_layered_fbo");
