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

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011894,
        "dEQP-GLES31.functional.image_load_store.b",
        "uffer.format_reinterpret.rgba32f_rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011895,
        "dEQP-GLES31.functional.image_load_store.",
        "buffer.format_reinterpret.rgba32f_rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011896,
        "dEQP-GLES31.functional.image_load_store.b",
        "uffer.format_reinterpret.rgba16f_rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011897,
        "dEQP-GLES31.functional.image_load_store.",
        "buffer.format_reinterpret.rgba16f_rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011898,
        "dEQP-GLES31.functional.image_load_store",
        ".buffer.format_reinterpret.r32f_rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011899,
        "dEQP-GLES31.functional.image_load_stor",
        "e.buffer.format_reinterpret.r32f_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011900,
        "dEQP-GLES31.functional.image_load_stor",
        "e.buffer.format_reinterpret.r32f_rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011901,
        "dEQP-GLES31.functional.image_load_sto",
        "re.buffer.format_reinterpret.r32f_r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011902,
        "dEQP-GLES31.functional.image_load_stor",
        "e.buffer.format_reinterpret.r32f_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011903,
        "dEQP-GLES31.functional.image_load_store.b",
        "uffer.format_reinterpret.r32f_rgba8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011904,
        "dEQP-GLES31.functional.image_load_store.b",
        "uffer.format_reinterpret.rgba32ui_rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011905,
        "dEQP-GLES31.functional.image_load_store.b",
        "uffer.format_reinterpret.rgba32ui_rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011906,
        "dEQP-GLES31.functional.image_load_store.b",
        "uffer.format_reinterpret.rgba16ui_rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011907,
        "dEQP-GLES31.functional.image_load_store.b",
        "uffer.format_reinterpret.rgba16ui_rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011908,
        "dEQP-GLES31.functional.image_load_store",
        ".buffer.format_reinterpret.rgba8ui_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011909,
        "dEQP-GLES31.functional.image_load_store",
        ".buffer.format_reinterpret.rgba8ui_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011910,
        "dEQP-GLES31.functional.image_load_store.",
        "buffer.format_reinterpret.rgba8ui_rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011911,
        "dEQP-GLES31.functional.image_load_store",
        ".buffer.format_reinterpret.rgba8ui_r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011912,
        "dEQP-GLES31.functional.image_load_store",
        ".buffer.format_reinterpret.rgba8ui_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011913,
        "dEQP-GLES31.functional.image_load_store.bu",
        "ffer.format_reinterpret.rgba8ui_rgba8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011914,
        "dEQP-GLES31.functional.image_load_stor",
        "e.buffer.format_reinterpret.r32ui_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011915,
        "dEQP-GLES31.functional.image_load_store",
        ".buffer.format_reinterpret.r32ui_rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011916,
        "dEQP-GLES31.functional.image_load_store",
        ".buffer.format_reinterpret.r32ui_rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011917,
        "dEQP-GLES31.functional.image_load_stor",
        "e.buffer.format_reinterpret.r32ui_r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011918,
        "dEQP-GLES31.functional.image_load_stor",
        "e.buffer.format_reinterpret.r32ui_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011919,
        "dEQP-GLES31.functional.image_load_store.b",
        "uffer.format_reinterpret.r32ui_rgba8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011920,
        "dEQP-GLES31.functional.image_load_store.",
        "buffer.format_reinterpret.rgba32i_rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011921,
        "dEQP-GLES31.functional.image_load_store.b",
        "uffer.format_reinterpret.rgba32i_rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011922,
        "dEQP-GLES31.functional.image_load_store.",
        "buffer.format_reinterpret.rgba16i_rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011923,
        "dEQP-GLES31.functional.image_load_store.b",
        "uffer.format_reinterpret.rgba16i_rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011924,
        "dEQP-GLES31.functional.image_load_stor",
        "e.buffer.format_reinterpret.rgba8i_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011925,
        "dEQP-GLES31.functional.image_load_store.",
        "buffer.format_reinterpret.rgba8i_rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011926,
        "dEQP-GLES31.functional.image_load_store",
        ".buffer.format_reinterpret.rgba8i_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011927,
        "dEQP-GLES31.functional.image_load_stor",
        "e.buffer.format_reinterpret.rgba8i_r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011928,
        "dEQP-GLES31.functional.image_load_store",
        ".buffer.format_reinterpret.rgba8i_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011929,
        "dEQP-GLES31.functional.image_load_store.bu",
        "ffer.format_reinterpret.rgba8i_rgba8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011930,
        "dEQP-GLES31.functional.image_load_sto",
        "re.buffer.format_reinterpret.r32i_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011931,
        "dEQP-GLES31.functional.image_load_store",
        ".buffer.format_reinterpret.r32i_rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011932,
        "dEQP-GLES31.functional.image_load_stor",
        "e.buffer.format_reinterpret.r32i_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011933,
        "dEQP-GLES31.functional.image_load_stor",
        "e.buffer.format_reinterpret.r32i_rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011934,
        "dEQP-GLES31.functional.image_load_stor",
        "e.buffer.format_reinterpret.r32i_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011935,
        "dEQP-GLES31.functional.image_load_store.b",
        "uffer.format_reinterpret.r32i_rgba8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011936,
        "dEQP-GLES31.functional.image_load_stor",
        "e.buffer.format_reinterpret.rgba8_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011937,
        "dEQP-GLES31.functional.image_load_store",
        ".buffer.format_reinterpret.rgba8_rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011938,
        "dEQP-GLES31.functional.image_load_stor",
        "e.buffer.format_reinterpret.rgba8_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011939,
        "dEQP-GLES31.functional.image_load_store",
        ".buffer.format_reinterpret.rgba8_rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011940,
        "dEQP-GLES31.functional.image_load_stor",
        "e.buffer.format_reinterpret.rgba8_r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011941,
        "dEQP-GLES31.functional.image_load_store.b",
        "uffer.format_reinterpret.rgba8_rgba8_snorm");
