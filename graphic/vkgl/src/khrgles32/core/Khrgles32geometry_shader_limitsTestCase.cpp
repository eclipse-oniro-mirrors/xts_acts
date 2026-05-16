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
#include "../Khrgles32BaseFunc.h"
#include "../ActsKhrgles320001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000118,
        "KHR-GLES32.core.geometry_shade",
        "r.limits.max_uniform_components");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000119,
        "KHR-GLES32.core.geometry_sha",
        "der.limits.max_uniform_blocks");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000120,
        "KHR-GLES32.core.geometry_shad",
        "er.limits.max_input_components");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000121,
        "KHR-GLES32.core.geometry_shade",
        "r.limits.max_output_components");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000122,
        "KHR-GLES32.core.geometry_shad",
        "er.limits.max_output_vertices");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000123,
        "KHR-GLES32.core.geometry_shader.limi",
        "ts.max_output_components_single_point");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000124,
        "KHR-GLES32.core.geometry_sha",
        "der.limits.max_texture_units");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000125,
        "KHR-GLES32.core.geometry_sh",
        "ader.limits.max_invocations");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000126,
        "KHR-GLES32.core.geometry_shader.",
        "limits.max_combined_texture_units");
