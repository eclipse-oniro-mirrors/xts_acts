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
#include "../ActsGles32KhrSingleUncover0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000007,
        "KHR-Single-GLES32.subgroups.builtin",
        "_var.framebuffer.subgroupsize_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000008,
        "KHR-Single-GLES32.subgroups.builtin_v",
        "ar.framebuffer.subgroupsize_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000009,
        "KHR-Single-GLES32.subgroups.builtin_va",
        "r.framebuffer.subgroupsize_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000010,
        "KHR-Single-GLES32.subgroups.builtin_",
        "var.framebuffer.subgroupsize_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000011,
        "KHR-Single-GLES32.subgroups.builtin_var",
        ".framebuffer.subgroupinvocationid_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000012,
        "KHR-Single-GLES32.subgroups.builtin_var.f",
        "ramebuffer.subgroupinvocationid_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000013,
        "KHR-Single-GLES32.subgroups.builtin_var.fr",
        "amebuffer.subgroupinvocationid_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000014,
        "KHR-Single-GLES32.subgroups.builtin_var.",
        "framebuffer.subgroupinvocationid_geometry");
