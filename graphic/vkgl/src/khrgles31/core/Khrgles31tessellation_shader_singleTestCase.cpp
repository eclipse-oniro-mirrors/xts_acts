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

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002566,
        "KHR-GLES31.core.tessellation_shader.single",
        ".default_values_of_context_wide_properties");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002567,
        "KHR-GLES31.core.tessellation_sha",
        "der.single.isolines_tessellation");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002568,
        "KHR-GLES31.core.tessellation_shader.sing",
        "le.ext_program_interface_query_dependency");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002569,
        "KHR-GLES31.core.tessellation_shade",
        "r.single.program_object_properties");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002570,
        "KHR-GLES31.core.tessellation_shader.sin",
        "gle.xfb_captures_data_from_correct_stage");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002571,
        "KHR-GLES31.core.tessellation_s",
        "hader.single.max_patch_vertices");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002572,
        "KHR-GLES31.core.tessellation_s",
        "hader.single.primitive_coverage");