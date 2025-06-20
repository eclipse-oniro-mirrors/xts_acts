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

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002496,
        "KHR-GLES31.core.geometry_shade",
        "r.limits.max_uniform_components");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002497,
        "KHR-GLES31.core.geometry_sha",
        "der.limits.max_uniform_blocks");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002498,
        "KHR-GLES31.core.geometry_shad",
        "er.limits.max_input_components");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002499,
        "KHR-GLES31.core.geometry_shade",
        "r.limits.max_output_components");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002500,
        "KHR-GLES31.core.geometry_shad",
        "er.limits.max_output_vertices");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002501,
        "KHR-GLES31.core.geometry_shader.limi",
        "ts.max_output_components_single_point");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002502,
        "KHR-GLES31.core.geometry_sha",
        "der.limits.max_texture_units");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002503,
        "KHR-GLES31.core.geometry_sh",
        "ader.limits.max_invocations");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002504,
        "KHR-GLES31.core.geometry_shader.",
        "limits.max_combined_texture_units");
