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
#include "../ActsDeqpgles310012TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011765,
        "dEQP-GLES31.functional.image_load_store.2d",
        "_array.format_reinterpret.rgba32f_rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011766,
        "dEQP-GLES31.functional.image_load_store.2",
        "d_array.format_reinterpret.rgba32f_rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011767,
        "dEQP-GLES31.functional.image_load_store.2d",
        "_array.format_reinterpret.rgba16f_rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011768,
        "dEQP-GLES31.functional.image_load_store.2",
        "d_array.format_reinterpret.rgba16f_rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011769,
        "dEQP-GLES31.functional.image_load_store.",
        "2d_array.format_reinterpret.r32f_rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011770,
        "dEQP-GLES31.functional.image_load_store",
        ".2d_array.format_reinterpret.r32f_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011771,
        "dEQP-GLES31.functional.image_load_store",
        ".2d_array.format_reinterpret.r32f_rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011772,
        "dEQP-GLES31.functional.image_load_stor",
        "e.2d_array.format_reinterpret.r32f_r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011773,
        "dEQP-GLES31.functional.image_load_store",
        ".2d_array.format_reinterpret.r32f_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011774,
        "dEQP-GLES31.functional.image_load_store.2d",
        "_array.format_reinterpret.r32f_rgba8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011775,
        "dEQP-GLES31.functional.image_load_store.2d",
        "_array.format_reinterpret.rgba32ui_rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011776,
        "dEQP-GLES31.functional.image_load_store.2d",
        "_array.format_reinterpret.rgba32ui_rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011777,
        "dEQP-GLES31.functional.image_load_store.2d",
        "_array.format_reinterpret.rgba16ui_rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011778,
        "dEQP-GLES31.functional.image_load_store.2d",
        "_array.format_reinterpret.rgba16ui_rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011779,
        "dEQP-GLES31.functional.image_load_store.",
        "2d_array.format_reinterpret.rgba8ui_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011780,
        "dEQP-GLES31.functional.image_load_store.",
        "2d_array.format_reinterpret.rgba8ui_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011781,
        "dEQP-GLES31.functional.image_load_store.2",
        "d_array.format_reinterpret.rgba8ui_rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011782,
        "dEQP-GLES31.functional.image_load_store.",
        "2d_array.format_reinterpret.rgba8ui_r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011783,
        "dEQP-GLES31.functional.image_load_store.",
        "2d_array.format_reinterpret.rgba8ui_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011784,
        "dEQP-GLES31.functional.image_load_store.2d_",
        "array.format_reinterpret.rgba8ui_rgba8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011785,
        "dEQP-GLES31.functional.image_load_store",
        ".2d_array.format_reinterpret.r32ui_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011786,
        "dEQP-GLES31.functional.image_load_store.",
        "2d_array.format_reinterpret.r32ui_rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011787,
        "dEQP-GLES31.functional.image_load_store.",
        "2d_array.format_reinterpret.r32ui_rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011788,
        "dEQP-GLES31.functional.image_load_store",
        ".2d_array.format_reinterpret.r32ui_r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011789,
        "dEQP-GLES31.functional.image_load_store",
        ".2d_array.format_reinterpret.r32ui_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011790,
        "dEQP-GLES31.functional.image_load_store.2d",
        "_array.format_reinterpret.r32ui_rgba8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011791,
        "dEQP-GLES31.functional.image_load_store.2",
        "d_array.format_reinterpret.rgba32i_rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011792,
        "dEQP-GLES31.functional.image_load_store.2d",
        "_array.format_reinterpret.rgba32i_rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011793,
        "dEQP-GLES31.functional.image_load_store.2",
        "d_array.format_reinterpret.rgba16i_rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011794,
        "dEQP-GLES31.functional.image_load_store.2d",
        "_array.format_reinterpret.rgba16i_rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011795,
        "dEQP-GLES31.functional.image_load_store",
        ".2d_array.format_reinterpret.rgba8i_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011796,
        "dEQP-GLES31.functional.image_load_store.2",
        "d_array.format_reinterpret.rgba8i_rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011797,
        "dEQP-GLES31.functional.image_load_store.",
        "2d_array.format_reinterpret.rgba8i_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011798,
        "dEQP-GLES31.functional.image_load_store",
        ".2d_array.format_reinterpret.rgba8i_r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011799,
        "dEQP-GLES31.functional.image_load_store.",
        "2d_array.format_reinterpret.rgba8i_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011800,
        "dEQP-GLES31.functional.image_load_store.2d_",
        "array.format_reinterpret.rgba8i_rgba8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011801,
        "dEQP-GLES31.functional.image_load_stor",
        "e.2d_array.format_reinterpret.r32i_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011802,
        "dEQP-GLES31.functional.image_load_store.",
        "2d_array.format_reinterpret.r32i_rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011803,
        "dEQP-GLES31.functional.image_load_store",
        ".2d_array.format_reinterpret.r32i_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011804,
        "dEQP-GLES31.functional.image_load_store",
        ".2d_array.format_reinterpret.r32i_rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011805,
        "dEQP-GLES31.functional.image_load_store",
        ".2d_array.format_reinterpret.r32i_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011806,
        "dEQP-GLES31.functional.image_load_store.2d",
        "_array.format_reinterpret.r32i_rgba8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011807,
        "dEQP-GLES31.functional.image_load_store",
        ".2d_array.format_reinterpret.rgba8_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011808,
        "dEQP-GLES31.functional.image_load_store.",
        "2d_array.format_reinterpret.rgba8_rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011809,
        "dEQP-GLES31.functional.image_load_store",
        ".2d_array.format_reinterpret.rgba8_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011810,
        "dEQP-GLES31.functional.image_load_store.",
        "2d_array.format_reinterpret.rgba8_rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011811,
        "dEQP-GLES31.functional.image_load_store",
        ".2d_array.format_reinterpret.rgba8_r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011812,
        "dEQP-GLES31.functional.image_load_store.2d",
        "_array.format_reinterpret.rgba8_rgba8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011813,
        "dEQP-GLES31.functional.image_load_store.2d",
        "_array.format_reinterpret.rgba8_snorm_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011814,
        "dEQP-GLES31.functional.image_load_store.2d_",
        "array.format_reinterpret.rgba8_snorm_rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011815,
        "dEQP-GLES31.functional.image_load_store.2d",
        "_array.format_reinterpret.rgba8_snorm_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011816,
        "dEQP-GLES31.functional.image_load_store.2d_",
        "array.format_reinterpret.rgba8_snorm_rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011817,
        "dEQP-GLES31.functional.image_load_store.2d",
        "_array.format_reinterpret.rgba8_snorm_r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011818,
        "dEQP-GLES31.functional.image_load_store.2d",
        "_array.format_reinterpret.rgba8_snorm_rgba8");
