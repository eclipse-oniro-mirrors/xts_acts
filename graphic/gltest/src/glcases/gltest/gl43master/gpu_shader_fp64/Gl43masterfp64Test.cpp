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
#include "../Gl43masterBaseFunc.h"
#include "../ActsGl43master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004534,
    "KHR-GL43.gpu_shader_fp64.fp64.errors");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004535,
    "KHR-GL43.gpu_shader_fp64.fp64.max_uniform_components");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004536,
    "KHR-GL43.gpu_shader_fp64.fp64.named_uniform_blocks");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004537,
    "KHR-GL43.gpu_shader_fp64.fp64.state_query");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004538,
    "KHR-GL43.gpu_shader_fp64.fp64.conversions");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004539,
    "KHR-GL43.gpu_shader_fp64.fp64.illegal_conversions");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004540,
    "KHR-GL43.gpu_shader_fp64.fp64.varyings");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004541,
    "KHR-GL43.gpu_shader_fp64.fp64.valid_constructors");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004542,
    "KHR-GL43.gpu_shader_fp64.fp64.operators");
