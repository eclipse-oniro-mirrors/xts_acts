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
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310015TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014527,
        "dEQP-GLES31.functional.texture.border_clamp.formats.",
        "compressed_signed_r11_eac.nearest_size_tile_multiple");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014528,
        "dEQP-GLES31.functional.texture.border_clamp.formats.co",
        "mpressed_signed_r11_eac.nearest_size_not_tile_multiple");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014529,
        "dEQP-GLES31.functional.texture.border_clamp.formats",
        ".compressed_signed_r11_eac.linear_size_tile_multiple");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014530,
        "dEQP-GLES31.functional.texture.border_clamp.formats.c",
        "ompressed_signed_r11_eac.linear_size_not_tile_multiple");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014531,
        "dEQP-GLES31.functional.texture.border_clamp.formats",
        ".compressed_signed_r11_eac.gather_size_tile_multiple");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014532,
        "dEQP-GLES31.functional.texture.border_clamp.formats.c",
        "ompressed_signed_r11_eac.gather_size_not_tile_multiple");
