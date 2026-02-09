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
#include "../ActsKhrgles320002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001180,
        "KHR-GLES32.core.compressed",
        "_format.api.invalid_target");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001181,
        "KHR-GLES32.core.compressed_for",
        "mat.api.invalid_width_or_height");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001182,
        "KHR-GLES32.core.compressed_format",
        ".api.invalid_width_or_height_array");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001183,
        "KHR-GLES32.core.compressed_forma",
        "t.api.invalid_size_value_negative");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001184,
        "KHR-GLES32.core.compressed_for",
        "mat.api.invalid_border_nonzero");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001185,
        "KHR-GLES32.core.compressed_format",
        ".api.invalid_border_nonzero_array");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001186,
        "KHR-GLES32.core.compressed_for",
        "mat.api.invalid_format_mismatch");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001187,
        "KHR-GLES32.core.compressed_",
        "format.api.invalid_target_3d");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001188,
        "KHR-GLES32.core.compressed_format.api",
        ".texstorage_accepts_compressed_format");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001189,
        "KHR-GLES32.core.compressed_format.api.",
        "invalid_teximage_with_compressed_format");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001190,
        "KHR-GLES32.core.compressed",
        "_format.api.invalid_format");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001191,
        "KHR-GLES32.core.compressed_fo",
        "rmat.api.invalid_format_array");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001192,
        "KHR-GLES32.core.compressed_format.",
        "api.invalid_too_small_unpack_buffer");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001193,
        "KHR-GLES32.core.compressed_format.",
        "api.invalid_inconsistent_data_size");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001194,
        "KHR-GLES32.core.compressed_format.api",
        ".invalid_inconsistent_data_size_array");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001195,
        "KHR-GLES32.core.compressed_for",
        "mat.api.invalid_offset_or_size");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001196,
        "KHR-GLES32.core.compressed_format.",
        "api.copy_compressed_to_uncompressed");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001197,
        "KHR-GLES32.core.compressed_format.",
        "api.copy_uncompressed_to_compressed");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001198,
        "KHR-GLES32.core.compressed_format",
        ".api.copy_compressed_to_compressed");
