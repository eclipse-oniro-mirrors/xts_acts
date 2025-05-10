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

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000169,
        "KHR-GLESEXT.tessellation_shader.tessellation_con",
        "trol_to_tessellation_evaluation.data_pass_through");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000170,
        "KHR-GLESEXT.tessellation_shader.tessellati",
        "on_control_to_tessellation_evaluation.gl_in");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000171,
        "KHR-GLESEXT.tessellation_shader.tessellation_control_to_tes",
        "sellation_evaluation.gl_MaxPatchVertices_Position_PointSize");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000172,
        "KHR-GLESEXT.tessellation_shader.tessellation_cont",
        "rol_to_tessellation_evaluation.gl_PatchVerticesIn");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000173,
        "KHR-GLESEXT.tessellation_shader.tessellation_c",
        "ontrol_to_tessellation_evaluation.gl_tessLevel");
