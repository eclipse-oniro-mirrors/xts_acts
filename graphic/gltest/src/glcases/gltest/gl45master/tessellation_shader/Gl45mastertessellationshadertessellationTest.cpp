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

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008304,
    "KHR-GL45.tessellation_shader.tessellation_shader_tessellation.gl_InvocationID_PatchVerticesIn_PrimitiveID");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008305,
    "KHR-GL45.tessellation_shader.tessellation_shader_tessellation.TCS_TES");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008306,
    "KHR-GL45.tessellation_shader.tessellation_shader_tessellation.TES");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008307,
    "KHR-GL45.tessellation_shader.tessellation_shader_tessellation.input_patch_discard");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008308,
    "KHR-GL45.tessellation_shader.tessellation_shader_tessellation.max_in_out_attributes");
