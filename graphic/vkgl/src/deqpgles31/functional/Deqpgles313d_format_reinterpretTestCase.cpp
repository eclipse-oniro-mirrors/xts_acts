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

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011608,
        "dEQP-GLES31.functional.image_load_store",
        ".3d.format_reinterpret.rgba32f_rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011609,
        "dEQP-GLES31.functional.image_load_stor",
        "e.3d.format_reinterpret.rgba32f_rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011610,
        "dEQP-GLES31.functional.image_load_store",
        ".3d.format_reinterpret.rgba16f_rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011611,
        "dEQP-GLES31.functional.image_load_stor",
        "e.3d.format_reinterpret.rgba16f_rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011612,
        "dEQP-GLES31.functional.image_load_sto",
        "re.3d.format_reinterpret.r32f_rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011613,
        "dEQP-GLES31.functional.image_load_st",
        "ore.3d.format_reinterpret.r32f_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011614,
        "dEQP-GLES31.functional.image_load_st",
        "ore.3d.format_reinterpret.r32f_rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011615,
        "dEQP-GLES31.functional.image_load_s",
        "tore.3d.format_reinterpret.r32f_r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011616,
        "dEQP-GLES31.functional.image_load_st",
        "ore.3d.format_reinterpret.r32f_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011617,
        "dEQP-GLES31.functional.image_load_store",
        ".3d.format_reinterpret.r32f_rgba8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011618,
        "dEQP-GLES31.functional.image_load_store",
        ".3d.format_reinterpret.rgba32ui_rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011619,
        "dEQP-GLES31.functional.image_load_store",
        ".3d.format_reinterpret.rgba32ui_rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011620,
        "dEQP-GLES31.functional.image_load_store",
        ".3d.format_reinterpret.rgba16ui_rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011621,
        "dEQP-GLES31.functional.image_load_store",
        ".3d.format_reinterpret.rgba16ui_rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011622,
        "dEQP-GLES31.functional.image_load_sto",
        "re.3d.format_reinterpret.rgba8ui_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011623,
        "dEQP-GLES31.functional.image_load_sto",
        "re.3d.format_reinterpret.rgba8ui_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011624,
        "dEQP-GLES31.functional.image_load_stor",
        "e.3d.format_reinterpret.rgba8ui_rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011625,
        "dEQP-GLES31.functional.image_load_sto",
        "re.3d.format_reinterpret.rgba8ui_r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011626,
        "dEQP-GLES31.functional.image_load_sto",
        "re.3d.format_reinterpret.rgba8ui_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011627,
        "dEQP-GLES31.functional.image_load_store.",
        "3d.format_reinterpret.rgba8ui_rgba8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011628,
        "dEQP-GLES31.functional.image_load_st",
        "ore.3d.format_reinterpret.r32ui_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011629,
        "dEQP-GLES31.functional.image_load_sto",
        "re.3d.format_reinterpret.r32ui_rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011630,
        "dEQP-GLES31.functional.image_load_sto",
        "re.3d.format_reinterpret.r32ui_rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011631,
        "dEQP-GLES31.functional.image_load_st",
        "ore.3d.format_reinterpret.r32ui_r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011632,
        "dEQP-GLES31.functional.image_load_st",
        "ore.3d.format_reinterpret.r32ui_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011633,
        "dEQP-GLES31.functional.image_load_store",
        ".3d.format_reinterpret.r32ui_rgba8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011634,
        "dEQP-GLES31.functional.image_load_stor",
        "e.3d.format_reinterpret.rgba32i_rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011635,
        "dEQP-GLES31.functional.image_load_store",
        ".3d.format_reinterpret.rgba32i_rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011636,
        "dEQP-GLES31.functional.image_load_stor",
        "e.3d.format_reinterpret.rgba16i_rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011637,
        "dEQP-GLES31.functional.image_load_store",
        ".3d.format_reinterpret.rgba16i_rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011638,
        "dEQP-GLES31.functional.image_load_st",
        "ore.3d.format_reinterpret.rgba8i_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011639,
        "dEQP-GLES31.functional.image_load_stor",
        "e.3d.format_reinterpret.rgba8i_rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011640,
        "dEQP-GLES31.functional.image_load_sto",
        "re.3d.format_reinterpret.rgba8i_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011641,
        "dEQP-GLES31.functional.image_load_st",
        "ore.3d.format_reinterpret.rgba8i_r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011642,
        "dEQP-GLES31.functional.image_load_sto",
        "re.3d.format_reinterpret.rgba8i_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011643,
        "dEQP-GLES31.functional.image_load_store.",
        "3d.format_reinterpret.rgba8i_rgba8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011644,
        "dEQP-GLES31.functional.image_load_s",
        "tore.3d.format_reinterpret.r32i_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011645,
        "dEQP-GLES31.functional.image_load_sto",
        "re.3d.format_reinterpret.r32i_rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011646,
        "dEQP-GLES31.functional.image_load_st",
        "ore.3d.format_reinterpret.r32i_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011647,
        "dEQP-GLES31.functional.image_load_st",
        "ore.3d.format_reinterpret.r32i_rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011648,
        "dEQP-GLES31.functional.image_load_st",
        "ore.3d.format_reinterpret.r32i_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011649,
        "dEQP-GLES31.functional.image_load_store",
        ".3d.format_reinterpret.r32i_rgba8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011650,
        "dEQP-GLES31.functional.image_load_st",
        "ore.3d.format_reinterpret.rgba8_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011651,
        "dEQP-GLES31.functional.image_load_sto",
        "re.3d.format_reinterpret.rgba8_rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011652,
        "dEQP-GLES31.functional.image_load_st",
        "ore.3d.format_reinterpret.rgba8_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011653,
        "dEQP-GLES31.functional.image_load_sto",
        "re.3d.format_reinterpret.rgba8_rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011654,
        "dEQP-GLES31.functional.image_load_st",
        "ore.3d.format_reinterpret.rgba8_r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011655,
        "dEQP-GLES31.functional.image_load_store",
        ".3d.format_reinterpret.rgba8_rgba8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011656,
        "dEQP-GLES31.functional.image_load_store",
        ".3d.format_reinterpret.rgba8_snorm_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011657,
        "dEQP-GLES31.functional.image_load_store.",
        "3d.format_reinterpret.rgba8_snorm_rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011658,
        "dEQP-GLES31.functional.image_load_store",
        ".3d.format_reinterpret.rgba8_snorm_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011659,
        "dEQP-GLES31.functional.image_load_store.",
        "3d.format_reinterpret.rgba8_snorm_rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011660,
        "dEQP-GLES31.functional.image_load_store",
        ".3d.format_reinterpret.rgba8_snorm_r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011661,
        "dEQP-GLES31.functional.image_load_store",
        ".3d.format_reinterpret.rgba8_snorm_rgba8");
