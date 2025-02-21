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

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011726,
        "dEQP-GLES31.functional.image_load_stor",
        "e.2d_array.atomic.exchange_r32f_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011727,
        "dEQP-GLES31.functional.image_load_store.2",
        "d_array.atomic.exchange_r32f_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011728,
        "dEQP-GLES31.functional.image_load_st",
        "ore.2d_array.atomic.add_r32ui_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011729,
        "dEQP-GLES31.functional.image_load_store",
        ".2d_array.atomic.add_r32ui_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011730,
        "dEQP-GLES31.functional.image_load_st",
        "ore.2d_array.atomic.min_r32ui_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011731,
        "dEQP-GLES31.functional.image_load_store",
        ".2d_array.atomic.min_r32ui_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011732,
        "dEQP-GLES31.functional.image_load_st",
        "ore.2d_array.atomic.max_r32ui_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011733,
        "dEQP-GLES31.functional.image_load_store",
        ".2d_array.atomic.max_r32ui_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011734,
        "dEQP-GLES31.functional.image_load_st",
        "ore.2d_array.atomic.and_r32ui_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011735,
        "dEQP-GLES31.functional.image_load_store",
        ".2d_array.atomic.and_r32ui_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011736,
        "dEQP-GLES31.functional.image_load_s",
        "tore.2d_array.atomic.or_r32ui_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011737,
        "dEQP-GLES31.functional.image_load_stor",
        "e.2d_array.atomic.or_r32ui_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011738,
        "dEQP-GLES31.functional.image_load_st",
        "ore.2d_array.atomic.xor_r32ui_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011739,
        "dEQP-GLES31.functional.image_load_store",
        ".2d_array.atomic.xor_r32ui_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011740,
        "dEQP-GLES31.functional.image_load_stor",
        "e.2d_array.atomic.exchange_r32ui_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011741,
        "dEQP-GLES31.functional.image_load_store.2",
        "d_array.atomic.exchange_r32ui_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011742,
        "dEQP-GLES31.functional.image_load_store",
        ".2d_array.atomic.comp_swap_r32ui_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011743,
        "dEQP-GLES31.functional.image_load_s",
        "tore.2d_array.atomic.add_r32i_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011744,
        "dEQP-GLES31.functional.image_load_stor",
        "e.2d_array.atomic.add_r32i_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011745,
        "dEQP-GLES31.functional.image_load_s",
        "tore.2d_array.atomic.min_r32i_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011746,
        "dEQP-GLES31.functional.image_load_stor",
        "e.2d_array.atomic.min_r32i_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011747,
        "dEQP-GLES31.functional.image_load_s",
        "tore.2d_array.atomic.max_r32i_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011748,
        "dEQP-GLES31.functional.image_load_stor",
        "e.2d_array.atomic.max_r32i_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011749,
        "dEQP-GLES31.functional.image_load_s",
        "tore.2d_array.atomic.and_r32i_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011750,
        "dEQP-GLES31.functional.image_load_stor",
        "e.2d_array.atomic.and_r32i_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011751,
        "dEQP-GLES31.functional.image_load_s",
        "tore.2d_array.atomic.or_r32i_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011752,
        "dEQP-GLES31.functional.image_load_stor",
        "e.2d_array.atomic.or_r32i_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011753,
        "dEQP-GLES31.functional.image_load_s",
        "tore.2d_array.atomic.xor_r32i_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011754,
        "dEQP-GLES31.functional.image_load_stor",
        "e.2d_array.atomic.xor_r32i_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011755,
        "dEQP-GLES31.functional.image_load_stor",
        "e.2d_array.atomic.exchange_r32i_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011756,
        "dEQP-GLES31.functional.image_load_store.2",
        "d_array.atomic.exchange_r32i_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011757,
        "dEQP-GLES31.functional.image_load_stor",
        "e.2d_array.atomic.comp_swap_r32i_result");
