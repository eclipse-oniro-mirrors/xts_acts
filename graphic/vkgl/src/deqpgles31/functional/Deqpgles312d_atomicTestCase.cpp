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

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011255,
        "dEQP-GLES31.functional.image_load_s",
        "tore.2d.atomic.exchange_r32f_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011256,
        "dEQP-GLES31.functional.image_load_stor",
        "e.2d.atomic.exchange_r32f_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011257,
        "dEQP-GLES31.functional.image_load",
        "_store.2d.atomic.add_r32ui_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011258,
        "dEQP-GLES31.functional.image_load_st",
        "ore.2d.atomic.add_r32ui_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011259,
        "dEQP-GLES31.functional.image_load",
        "_store.2d.atomic.min_r32ui_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011260,
        "dEQP-GLES31.functional.image_load_st",
        "ore.2d.atomic.min_r32ui_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011261,
        "dEQP-GLES31.functional.image_load",
        "_store.2d.atomic.max_r32ui_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011262,
        "dEQP-GLES31.functional.image_load_st",
        "ore.2d.atomic.max_r32ui_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011263,
        "dEQP-GLES31.functional.image_load",
        "_store.2d.atomic.and_r32ui_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011264,
        "dEQP-GLES31.functional.image_load_st",
        "ore.2d.atomic.and_r32ui_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011265,
        "dEQP-GLES31.functional.image_loa",
        "d_store.2d.atomic.or_r32ui_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011266,
        "dEQP-GLES31.functional.image_load_s",
        "tore.2d.atomic.or_r32ui_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011267,
        "dEQP-GLES31.functional.image_load",
        "_store.2d.atomic.xor_r32ui_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011268,
        "dEQP-GLES31.functional.image_load_st",
        "ore.2d.atomic.xor_r32ui_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011269,
        "dEQP-GLES31.functional.image_load_s",
        "tore.2d.atomic.exchange_r32ui_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011270,
        "dEQP-GLES31.functional.image_load_stor",
        "e.2d.atomic.exchange_r32ui_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011271,
        "dEQP-GLES31.functional.image_load_st",
        "ore.2d.atomic.comp_swap_r32ui_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011272,
        "dEQP-GLES31.functional.image_loa",
        "d_store.2d.atomic.add_r32i_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011273,
        "dEQP-GLES31.functional.image_load_s",
        "tore.2d.atomic.add_r32i_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011274,
        "dEQP-GLES31.functional.image_loa",
        "d_store.2d.atomic.min_r32i_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011275,
        "dEQP-GLES31.functional.image_load_s",
        "tore.2d.atomic.min_r32i_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011276,
        "dEQP-GLES31.functional.image_loa",
        "d_store.2d.atomic.max_r32i_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011277,
        "dEQP-GLES31.functional.image_load_s",
        "tore.2d.atomic.max_r32i_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011278,
        "dEQP-GLES31.functional.image_loa",
        "d_store.2d.atomic.and_r32i_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011279,
        "dEQP-GLES31.functional.image_load_s",
        "tore.2d.atomic.and_r32i_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011280,
        "dEQP-GLES31.functional.image_loa",
        "d_store.2d.atomic.or_r32i_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011281,
        "dEQP-GLES31.functional.image_load_s",
        "tore.2d.atomic.or_r32i_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011282,
        "dEQP-GLES31.functional.image_loa",
        "d_store.2d.atomic.xor_r32i_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011283,
        "dEQP-GLES31.functional.image_load_s",
        "tore.2d.atomic.xor_r32i_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011284,
        "dEQP-GLES31.functional.image_load_s",
        "tore.2d.atomic.exchange_r32i_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011285,
        "dEQP-GLES31.functional.image_load_stor",
        "e.2d.atomic.exchange_r32i_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011286,
        "dEQP-GLES31.functional.image_load_s",
        "tore.2d.atomic.comp_swap_r32i_result");
