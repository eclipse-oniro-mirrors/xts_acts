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
#include "../ActsKhrgles310003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002478,
        "KHR-GLES31.core.geometry_shader.layered_rendering_boundary_co",
        "ndition.layered_rendering_boundary_condition_various_textures");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002479,
        "KHR-GLES31.core.geometry_shader.layered_rendering_bound",
        "ary_condition.layered_rendering_boundary_condition_no_gs");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002480,
        "KHR-GLES31.core.geometry_shader.layered_rendering_boundary_co",
        "ndition.layered_rendering_boundary_condition_no_default_layer");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002481,
        "KHR-GLES31.core.geometry_shader.layered_rendering_boundary_c",
        "ondition.layered_rendering_boundary_condition_no_layered_fbo");
