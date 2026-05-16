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

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000160,
        "KHR-GLESEXT.tessellation_shader.single.d",
        "efault_values_of_context_wide_properties");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000161,
        "KHR-GLESEXT.tessellation_shade",
        "r.single.isolines_tessellation");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000162,
        "KHR-GLESEXT.tessellation_shader.single",
        ".ext_program_interface_query_dependency");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000163,
        "KHR-GLESEXT.tessellation_shader.",
        "single.program_object_properties");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000164,
        "KHR-GLESEXT.tessellation_shader.singl",
        "e.xfb_captures_data_from_correct_stage");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000165,
        "KHR-GLESEXT.tessellation_sha",
        "der.single.max_patch_vertices");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000166,
        "KHR-GLESEXT.tessellation_sha",
        "der.single.primitive_coverage");
