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

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002385,
        "KHR-GLES31.core.compressed",
        "_format.api.invalid_target");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002386,
        "KHR-GLES31.core.compressed_for",
        "mat.api.invalid_width_or_height");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002387,
        "KHR-GLES31.core.compressed_forma",
        "t.api.invalid_size_value_negative");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002388,
        "KHR-GLES31.core.compressed_for",
        "mat.api.invalid_border_nonzero");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002389,
        "KHR-GLES31.core.compressed_for",
        "mat.api.invalid_format_mismatch");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002390,
        "KHR-GLES31.core.compressed_",
        "format.api.invalid_target_3d");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002391,
        "KHR-GLES31.core.compressed_format.api",
        ".texstorage_accepts_compressed_format");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002392,
        "KHR-GLES31.core.compressed_format.api.",
        "invalid_teximage_with_compressed_format");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002393,
        "KHR-GLES31.core.compressed",
        "_format.api.invalid_format");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002394,
        "KHR-GLES31.core.compressed_format.",
        "api.invalid_too_small_unpack_buffer");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002395,
        "KHR-GLES31.core.compressed_format.",
        "api.invalid_inconsistent_data_size");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002396,
        "KHR-GLES31.core.compressed_for",
        "mat.api.invalid_offset_or_size");
