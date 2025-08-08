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

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011294,
        "dEQP-GLES31.functional.image_load_store",
        ".2d.format_reinterpret.rgba32f_rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011295,
        "dEQP-GLES31.functional.image_load_stor",
        "e.2d.format_reinterpret.rgba32f_rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011296,
        "dEQP-GLES31.functional.image_load_store",
        ".2d.format_reinterpret.rgba16f_rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011297,
        "dEQP-GLES31.functional.image_load_stor",
        "e.2d.format_reinterpret.rgba16f_rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011298,
        "dEQP-GLES31.functional.image_load_sto",
        "re.2d.format_reinterpret.r32f_rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011299,
        "dEQP-GLES31.functional.image_load_st",
        "ore.2d.format_reinterpret.r32f_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011300,
        "dEQP-GLES31.functional.image_load_st",
        "ore.2d.format_reinterpret.r32f_rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011301,
        "dEQP-GLES31.functional.image_load_s",
        "tore.2d.format_reinterpret.r32f_r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011302,
        "dEQP-GLES31.functional.image_load_st",
        "ore.2d.format_reinterpret.r32f_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011303,
        "dEQP-GLES31.functional.image_load_store",
        ".2d.format_reinterpret.r32f_rgba8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011304,
        "dEQP-GLES31.functional.image_load_store",
        ".2d.format_reinterpret.rgba32ui_rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011305,
        "dEQP-GLES31.functional.image_load_store",
        ".2d.format_reinterpret.rgba32ui_rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011306,
        "dEQP-GLES31.functional.image_load_store",
        ".2d.format_reinterpret.rgba16ui_rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011307,
        "dEQP-GLES31.functional.image_load_store",
        ".2d.format_reinterpret.rgba16ui_rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011308,
        "dEQP-GLES31.functional.image_load_sto",
        "re.2d.format_reinterpret.rgba8ui_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011309,
        "dEQP-GLES31.functional.image_load_sto",
        "re.2d.format_reinterpret.rgba8ui_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011310,
        "dEQP-GLES31.functional.image_load_stor",
        "e.2d.format_reinterpret.rgba8ui_rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011311,
        "dEQP-GLES31.functional.image_load_sto",
        "re.2d.format_reinterpret.rgba8ui_r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011312,
        "dEQP-GLES31.functional.image_load_sto",
        "re.2d.format_reinterpret.rgba8ui_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011313,
        "dEQP-GLES31.functional.image_load_store.",
        "2d.format_reinterpret.rgba8ui_rgba8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011314,
        "dEQP-GLES31.functional.image_load_st",
        "ore.2d.format_reinterpret.r32ui_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011315,
        "dEQP-GLES31.functional.image_load_sto",
        "re.2d.format_reinterpret.r32ui_rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011316,
        "dEQP-GLES31.functional.image_load_sto",
        "re.2d.format_reinterpret.r32ui_rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011317,
        "dEQP-GLES31.functional.image_load_st",
        "ore.2d.format_reinterpret.r32ui_r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011318,
        "dEQP-GLES31.functional.image_load_st",
        "ore.2d.format_reinterpret.r32ui_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011319,
        "dEQP-GLES31.functional.image_load_store",
        ".2d.format_reinterpret.r32ui_rgba8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011320,
        "dEQP-GLES31.functional.image_load_stor",
        "e.2d.format_reinterpret.rgba32i_rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011321,
        "dEQP-GLES31.functional.image_load_store",
        ".2d.format_reinterpret.rgba32i_rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011322,
        "dEQP-GLES31.functional.image_load_stor",
        "e.2d.format_reinterpret.rgba16i_rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011323,
        "dEQP-GLES31.functional.image_load_store",
        ".2d.format_reinterpret.rgba16i_rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011324,
        "dEQP-GLES31.functional.image_load_st",
        "ore.2d.format_reinterpret.rgba8i_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011325,
        "dEQP-GLES31.functional.image_load_stor",
        "e.2d.format_reinterpret.rgba8i_rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011326,
        "dEQP-GLES31.functional.image_load_sto",
        "re.2d.format_reinterpret.rgba8i_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011327,
        "dEQP-GLES31.functional.image_load_st",
        "ore.2d.format_reinterpret.rgba8i_r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011328,
        "dEQP-GLES31.functional.image_load_sto",
        "re.2d.format_reinterpret.rgba8i_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011329,
        "dEQP-GLES31.functional.image_load_store.",
        "2d.format_reinterpret.rgba8i_rgba8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011330,
        "dEQP-GLES31.functional.image_load_s",
        "tore.2d.format_reinterpret.r32i_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011331,
        "dEQP-GLES31.functional.image_load_sto",
        "re.2d.format_reinterpret.r32i_rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011332,
        "dEQP-GLES31.functional.image_load_st",
        "ore.2d.format_reinterpret.r32i_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011333,
        "dEQP-GLES31.functional.image_load_st",
        "ore.2d.format_reinterpret.r32i_rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011334,
        "dEQP-GLES31.functional.image_load_st",
        "ore.2d.format_reinterpret.r32i_rgba8");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011335,
        "dEQP-GLES31.functional.image_load_store",
        ".2d.format_reinterpret.r32i_rgba8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011336,
        "dEQP-GLES31.functional.image_load_st",
        "ore.2d.format_reinterpret.rgba8_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011337,
        "dEQP-GLES31.functional.image_load_sto",
        "re.2d.format_reinterpret.rgba8_rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011338,
        "dEQP-GLES31.functional.image_load_st",
        "ore.2d.format_reinterpret.rgba8_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011339,
        "dEQP-GLES31.functional.image_load_sto",
        "re.2d.format_reinterpret.rgba8_rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011340,
        "dEQP-GLES31.functional.image_load_st",
        "ore.2d.format_reinterpret.rgba8_r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011341,
        "dEQP-GLES31.functional.image_load_store",
        ".2d.format_reinterpret.rgba8_rgba8_snorm");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011342,
        "dEQP-GLES31.functional.image_load_store",
        ".2d.format_reinterpret.rgba8_snorm_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011343,
        "dEQP-GLES31.functional.image_load_store.",
        "2d.format_reinterpret.rgba8_snorm_rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011344,
        "dEQP-GLES31.functional.image_load_store",
        ".2d.format_reinterpret.rgba8_snorm_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011345,
        "dEQP-GLES31.functional.image_load_store.",
        "2d.format_reinterpret.rgba8_snorm_rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011346,
        "dEQP-GLES31.functional.image_load_store",
        ".2d.format_reinterpret.rgba8_snorm_r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011347,
        "dEQP-GLES31.functional.image_load_store",
        ".2d.format_reinterpret.rgba8_snorm_rgba8");
