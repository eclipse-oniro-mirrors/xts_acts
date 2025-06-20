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

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008840,
    "KHR-GL45.shader_draw_parameters_tests.ShaderDrawParametersExtension");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008841,
    "KHR-GL45.shader_draw_parameters_tests.ShaderDrawArraysParameters");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008842,
    "KHR-GL45.shader_draw_parameters_tests.ShaderDrawElementsParameters");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008843,
    "KHR-GL45.shader_draw_parameters_tests.ShaderDrawArraysIndirectParameters");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008844,
    "KHR-GL45.shader_draw_parameters_tests.ShaderDrawElementsIndirectParameters");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008845,
    "KHR-GL45.shader_draw_parameters_tests.ShaderDrawArraysInstancedParameters");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008846,
    "KHR-GL45.shader_draw_parameters_tests.ShaderDrawElementsInstancedParameters");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008847,
    "KHR-GL45.shader_draw_parameters_tests.ShaderMultiDrawArraysParameters");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008848,
    "KHR-GL45.shader_draw_parameters_tests.ShaderMultiDrawElementsParameters");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008849,
    "KHR-GL45.shader_draw_parameters_tests.ShaderMultiDrawArraysIndirectParameters");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008850,
    "KHR-GL45.shader_draw_parameters_tests.ShaderMultiDrawElementsIndirectParameters");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008851,
    "KHR-GL45.shader_draw_parameters_tests.MultiDrawArraysIndirectCountParameters");

static SHRINK_HWTEST_SF(ActsGl45master0001TestSuite, TestCase_008852,
    "KHR-GL45.shader_draw_parameters_tests.MultiDrawElementIndirectCountParameters");
