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

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011451,
        "dEQP-GLES31.functional.image_load_store.",
        "cube.format_reinterpret.rgba32f_rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011452,
        "dEQP-GLES31.functional.image_load_store",
        ".cube.format_reinterpret.rgba32f_rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011453,
        "dEQP-GLES31.functional.image_load_store.",
        "cube.format_reinterpret.rgba16f_rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011454,
        "dEQP-GLES31.functional.image_load_store",
        ".cube.format_reinterpret.rgba16f_rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011455,
        "dEQP-GLES31.functional.image_load_stor",
        "e.cube.format_reinterpret.r32f_rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011456,
        "dEQP-GLES31.functional.image_load_sto",
        "re.cube.format_reinterpret.r32f_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011457,
        "dEQP-GLES31.functional.image_load_sto",
        "re.cube.format_reinterpret.r32f_rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011458,
        "dEQP-GLES31.functional.image_load_st",
        "ore.cube.format_reinterpret.r32f_r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011459,
        "dEQP-GLES31.functional.image_load_sto",
        "re.cube.format_reinterpret.r32f_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011460,
        "dEQP-GLES31.functional.image_load_store.",
        "cube.format_reinterpret.r32f_rgba8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011461,
        "dEQP-GLES31.functional.image_load_store.",
        "cube.format_reinterpret.rgba32ui_rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011462,
        "dEQP-GLES31.functional.image_load_store.",
        "cube.format_reinterpret.rgba32ui_rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011463,
        "dEQP-GLES31.functional.image_load_store.",
        "cube.format_reinterpret.rgba16ui_rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011464,
        "dEQP-GLES31.functional.image_load_store.",
        "cube.format_reinterpret.rgba16ui_rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011465,
        "dEQP-GLES31.functional.image_load_stor",
        "e.cube.format_reinterpret.rgba8ui_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011466,
        "dEQP-GLES31.functional.image_load_stor",
        "e.cube.format_reinterpret.rgba8ui_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011467,
        "dEQP-GLES31.functional.image_load_store",
        ".cube.format_reinterpret.rgba8ui_rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011468,
        "dEQP-GLES31.functional.image_load_stor",
        "e.cube.format_reinterpret.rgba8ui_r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011469,
        "dEQP-GLES31.functional.image_load_stor",
        "e.cube.format_reinterpret.rgba8ui_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011470,
        "dEQP-GLES31.functional.image_load_store.c",
        "ube.format_reinterpret.rgba8ui_rgba8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011471,
        "dEQP-GLES31.functional.image_load_sto",
        "re.cube.format_reinterpret.r32ui_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011472,
        "dEQP-GLES31.functional.image_load_stor",
        "e.cube.format_reinterpret.r32ui_rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011473,
        "dEQP-GLES31.functional.image_load_stor",
        "e.cube.format_reinterpret.r32ui_rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011474,
        "dEQP-GLES31.functional.image_load_sto",
        "re.cube.format_reinterpret.r32ui_r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011475,
        "dEQP-GLES31.functional.image_load_sto",
        "re.cube.format_reinterpret.r32ui_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011476,
        "dEQP-GLES31.functional.image_load_store.",
        "cube.format_reinterpret.r32ui_rgba8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011477,
        "dEQP-GLES31.functional.image_load_store",
        ".cube.format_reinterpret.rgba32i_rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011478,
        "dEQP-GLES31.functional.image_load_store.",
        "cube.format_reinterpret.rgba32i_rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011479,
        "dEQP-GLES31.functional.image_load_store",
        ".cube.format_reinterpret.rgba16i_rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011480,
        "dEQP-GLES31.functional.image_load_store.",
        "cube.format_reinterpret.rgba16i_rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011481,
        "dEQP-GLES31.functional.image_load_sto",
        "re.cube.format_reinterpret.rgba8i_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011482,
        "dEQP-GLES31.functional.image_load_store",
        ".cube.format_reinterpret.rgba8i_rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011483,
        "dEQP-GLES31.functional.image_load_stor",
        "e.cube.format_reinterpret.rgba8i_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011484,
        "dEQP-GLES31.functional.image_load_sto",
        "re.cube.format_reinterpret.rgba8i_r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011485,
        "dEQP-GLES31.functional.image_load_stor",
        "e.cube.format_reinterpret.rgba8i_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011486,
        "dEQP-GLES31.functional.image_load_store.c",
        "ube.format_reinterpret.rgba8i_rgba8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011487,
        "dEQP-GLES31.functional.image_load_st",
        "ore.cube.format_reinterpret.r32i_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011488,
        "dEQP-GLES31.functional.image_load_stor",
        "e.cube.format_reinterpret.r32i_rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011489,
        "dEQP-GLES31.functional.image_load_sto",
        "re.cube.format_reinterpret.r32i_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011490,
        "dEQP-GLES31.functional.image_load_sto",
        "re.cube.format_reinterpret.r32i_rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011491,
        "dEQP-GLES31.functional.image_load_sto",
        "re.cube.format_reinterpret.r32i_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011492,
        "dEQP-GLES31.functional.image_load_store.",
        "cube.format_reinterpret.r32i_rgba8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011493,
        "dEQP-GLES31.functional.image_load_sto",
        "re.cube.format_reinterpret.rgba8_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011494,
        "dEQP-GLES31.functional.image_load_stor",
        "e.cube.format_reinterpret.rgba8_rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011495,
        "dEQP-GLES31.functional.image_load_sto",
        "re.cube.format_reinterpret.rgba8_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011496,
        "dEQP-GLES31.functional.image_load_stor",
        "e.cube.format_reinterpret.rgba8_rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011497,
        "dEQP-GLES31.functional.image_load_sto",
        "re.cube.format_reinterpret.rgba8_r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011498,
        "dEQP-GLES31.functional.image_load_store.",
        "cube.format_reinterpret.rgba8_rgba8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011499,
        "dEQP-GLES31.functional.image_load_store.",
        "cube.format_reinterpret.rgba8_snorm_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011500,
        "dEQP-GLES31.functional.image_load_store.c",
        "ube.format_reinterpret.rgba8_snorm_rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011501,
        "dEQP-GLES31.functional.image_load_store.",
        "cube.format_reinterpret.rgba8_snorm_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011502,
        "dEQP-GLES31.functional.image_load_store.c",
        "ube.format_reinterpret.rgba8_snorm_rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011503,
        "dEQP-GLES31.functional.image_load_store.",
        "cube.format_reinterpret.rgba8_snorm_r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011504,
        "dEQP-GLES31.functional.image_load_store.",
        "cube.format_reinterpret.rgba8_snorm_rgba8");
