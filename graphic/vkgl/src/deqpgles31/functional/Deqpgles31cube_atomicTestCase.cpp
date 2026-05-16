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

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011412,
        "dEQP-GLES31.functional.image_load_st",
        "ore.cube.atomic.exchange_r32f_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011413,
        "dEQP-GLES31.functional.image_load_store",
        ".cube.atomic.exchange_r32f_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011414,
        "dEQP-GLES31.functional.image_load_",
        "store.cube.atomic.add_r32ui_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011415,
        "dEQP-GLES31.functional.image_load_sto",
        "re.cube.atomic.add_r32ui_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011416,
        "dEQP-GLES31.functional.image_load_",
        "store.cube.atomic.min_r32ui_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011417,
        "dEQP-GLES31.functional.image_load_sto",
        "re.cube.atomic.min_r32ui_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011418,
        "dEQP-GLES31.functional.image_load_",
        "store.cube.atomic.max_r32ui_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011419,
        "dEQP-GLES31.functional.image_load_sto",
        "re.cube.atomic.max_r32ui_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011420,
        "dEQP-GLES31.functional.image_load_",
        "store.cube.atomic.and_r32ui_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011421,
        "dEQP-GLES31.functional.image_load_sto",
        "re.cube.atomic.and_r32ui_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011422,
        "dEQP-GLES31.functional.image_load",
        "_store.cube.atomic.or_r32ui_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011423,
        "dEQP-GLES31.functional.image_load_st",
        "ore.cube.atomic.or_r32ui_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011424,
        "dEQP-GLES31.functional.image_load_",
        "store.cube.atomic.xor_r32ui_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011425,
        "dEQP-GLES31.functional.image_load_sto",
        "re.cube.atomic.xor_r32ui_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011426,
        "dEQP-GLES31.functional.image_load_st",
        "ore.cube.atomic.exchange_r32ui_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011427,
        "dEQP-GLES31.functional.image_load_store",
        ".cube.atomic.exchange_r32ui_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011428,
        "dEQP-GLES31.functional.image_load_sto",
        "re.cube.atomic.comp_swap_r32ui_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011429,
        "dEQP-GLES31.functional.image_load",
        "_store.cube.atomic.add_r32i_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011430,
        "dEQP-GLES31.functional.image_load_st",
        "ore.cube.atomic.add_r32i_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011431,
        "dEQP-GLES31.functional.image_load",
        "_store.cube.atomic.min_r32i_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011432,
        "dEQP-GLES31.functional.image_load_st",
        "ore.cube.atomic.min_r32i_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011433,
        "dEQP-GLES31.functional.image_load",
        "_store.cube.atomic.max_r32i_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011434,
        "dEQP-GLES31.functional.image_load_st",
        "ore.cube.atomic.max_r32i_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011435,
        "dEQP-GLES31.functional.image_load",
        "_store.cube.atomic.and_r32i_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011436,
        "dEQP-GLES31.functional.image_load_st",
        "ore.cube.atomic.and_r32i_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011437,
        "dEQP-GLES31.functional.image_load",
        "_store.cube.atomic.or_r32i_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011438,
        "dEQP-GLES31.functional.image_load_st",
        "ore.cube.atomic.or_r32i_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011439,
        "dEQP-GLES31.functional.image_load",
        "_store.cube.atomic.xor_r32i_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011440,
        "dEQP-GLES31.functional.image_load_st",
        "ore.cube.atomic.xor_r32i_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011441,
        "dEQP-GLES31.functional.image_load_st",
        "ore.cube.atomic.exchange_r32i_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011442,
        "dEQP-GLES31.functional.image_load_store",
        ".cube.atomic.exchange_r32i_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011443,
        "dEQP-GLES31.functional.image_load_st",
        "ore.cube.atomic.comp_swap_r32i_result");
