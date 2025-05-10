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

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002040,
        "KHR-GLES31.core.shader_imag",
        "e_size.basic-nonMS-vs-float");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002041,
        "KHR-GLES31.core.shader_ima",
        "ge_size.basic-nonMS-vs-int");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002042,
        "KHR-GLES31.core.shader_ima",
        "ge_size.basic-nonMS-vs-uint");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002043,
        "KHR-GLES31.core.shader_imag",
        "e_size.basic-nonMS-fs-float");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002044,
        "KHR-GLES31.core.shader_ima",
        "ge_size.basic-nonMS-fs-int");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002045,
        "KHR-GLES31.core.shader_ima",
        "ge_size.basic-nonMS-fs-uint");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002046,
        "KHR-GLES31.core.shader_imag",
        "e_size.basic-nonMS-cs-float");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002047,
        "KHR-GLES31.core.shader_ima",
        "ge_size.basic-nonMS-cs-int");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002048,
        "KHR-GLES31.core.shader_ima",
        "ge_size.basic-nonMS-cs-uint");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002049,
        "KHR-GLES31.core.shader_image",
        "_size.advanced-nonMS-vs-float");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002050,
        "KHR-GLES31.core.shader_imag",
        "e_size.advanced-nonMS-vs-int");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002051,
        "KHR-GLES31.core.shader_image",
        "_size.advanced-nonMS-vs-uint");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002052,
        "KHR-GLES31.core.shader_image",
        "_size.advanced-nonMS-fs-float");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002053,
        "KHR-GLES31.core.shader_imag",
        "e_size.advanced-nonMS-fs-int");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002054,
        "KHR-GLES31.core.shader_image",
        "_size.advanced-nonMS-fs-uint");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002055,
        "KHR-GLES31.core.shader_image",
        "_size.advanced-nonMS-cs-float");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002056,
        "KHR-GLES31.core.shader_imag",
        "e_size.advanced-nonMS-cs-int");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002057,
        "KHR-GLES31.core.shader_image",
        "_size.advanced-nonMS-cs-uint");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002058,
        "KHR-GLES31.core.shader_imag",
        "e_size.negative-compileTime");
