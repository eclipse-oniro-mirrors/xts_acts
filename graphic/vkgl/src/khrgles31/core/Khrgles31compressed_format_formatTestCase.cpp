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

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002397,
        "KHR-GLES31.core.compress",
        "ed_format.format.r11_eac");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002398,
        "KHR-GLES31.core.compressed_",
        "format.format.signed_r11_eac");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002399,
        "KHR-GLES31.core.compress",
        "ed_format.format.rg11_eac");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002400,
        "KHR-GLES31.core.compressed_f",
        "ormat.format.signed_rg11_eac");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002401,
        "KHR-GLES31.core.compresse",
        "d_format.format.rgb8_etc2");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002402,
        "KHR-GLES31.core.compresse",
        "d_format.format.srgb8_etc2");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002403,
        "KHR-GLES31.core.compressed_format.f",
        "ormat.rgb8_punchthrough_alpha1_etc2");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002404,
        "KHR-GLES31.core.compressed_format.f",
        "ormat.srgb8_punchthrough_alpha1_etc2");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002405,
        "KHR-GLES31.core.compressed_",
        "format.format.rgba8_etc2_eac");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002406,
        "KHR-GLES31.core.compressed_form",
        "at.format.srgb8_alpha8_etc2_eac");
