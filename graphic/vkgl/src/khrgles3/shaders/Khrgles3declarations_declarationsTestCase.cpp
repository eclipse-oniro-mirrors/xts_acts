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
#include "../Khrgles3BaseFunc.h"
#include "../ActsKhrgles30001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000001,
        "KHR-GLES3.shaders.declarations.decla",
        "rations.missing_variable_name_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000002,
        "KHR-GLES3.shaders.declarations.declar",
        "ations.missing_variable_name_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000003,
        "KHR-GLES3.shaders.declarations.declar",
        "ations.comma_preceding_variable_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000004,
        "KHR-GLES3.shaders.declarations.declara",
        "tions.comma_preceding_variable_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000005,
        "KHR-GLES3.shaders.declarations.declar",
        "ations.comma_following_variable_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000006,
        "KHR-GLES3.shaders.declarations.declara",
        "tions.comma_following_variable_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000007,
        "KHR-GLES3.shaders.declarations.declarati",
        "ons.struct_missing_attribute_name_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000008,
        "KHR-GLES3.shaders.declarations.declaratio",
        "ns.struct_missing_attribute_name_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000009,
        "KHR-GLES3.shaders.declarations.declaratio",
        "ns.struct_comma_preceding_attribute_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000010,
        "KHR-GLES3.shaders.declarations.declaration",
        "s.struct_comma_preceding_attribute_fragment");
