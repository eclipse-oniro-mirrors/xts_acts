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

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011569,
        "dEQP-GLES31.functional.image_load_s",
        "tore.3d.atomic.exchange_r32f_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011570,
        "dEQP-GLES31.functional.image_load_stor",
        "e.3d.atomic.exchange_r32f_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011571,
        "dEQP-GLES31.functional.image_load",
        "_store.3d.atomic.add_r32ui_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011572,
        "dEQP-GLES31.functional.image_load_st",
        "ore.3d.atomic.add_r32ui_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011573,
        "dEQP-GLES31.functional.image_load",
        "_store.3d.atomic.min_r32ui_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011574,
        "dEQP-GLES31.functional.image_load_st",
        "ore.3d.atomic.min_r32ui_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011575,
        "dEQP-GLES31.functional.image_load",
        "_store.3d.atomic.max_r32ui_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011576,
        "dEQP-GLES31.functional.image_load_st",
        "ore.3d.atomic.max_r32ui_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011577,
        "dEQP-GLES31.functional.image_load",
        "_store.3d.atomic.and_r32ui_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011578,
        "dEQP-GLES31.functional.image_load_st",
        "ore.3d.atomic.and_r32ui_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011579,
        "dEQP-GLES31.functional.image_loa",
        "d_store.3d.atomic.or_r32ui_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011580,
        "dEQP-GLES31.functional.image_load_s",
        "tore.3d.atomic.or_r32ui_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011581,
        "dEQP-GLES31.functional.image_load",
        "_store.3d.atomic.xor_r32ui_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011582,
        "dEQP-GLES31.functional.image_load_st",
        "ore.3d.atomic.xor_r32ui_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011583,
        "dEQP-GLES31.functional.image_load_s",
        "tore.3d.atomic.exchange_r32ui_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011584,
        "dEQP-GLES31.functional.image_load_stor",
        "e.3d.atomic.exchange_r32ui_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011585,
        "dEQP-GLES31.functional.image_load_st",
        "ore.3d.atomic.comp_swap_r32ui_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011586,
        "dEQP-GLES31.functional.image_loa",
        "d_store.3d.atomic.add_r32i_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011587,
        "dEQP-GLES31.functional.image_load_s",
        "tore.3d.atomic.add_r32i_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011588,
        "dEQP-GLES31.functional.image_loa",
        "d_store.3d.atomic.min_r32i_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011589,
        "dEQP-GLES31.functional.image_load_s",
        "tore.3d.atomic.min_r32i_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011590,
        "dEQP-GLES31.functional.image_loa",
        "d_store.3d.atomic.max_r32i_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011591,
        "dEQP-GLES31.functional.image_load_s",
        "tore.3d.atomic.max_r32i_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011592,
        "dEQP-GLES31.functional.image_loa",
        "d_store.3d.atomic.and_r32i_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011593,
        "dEQP-GLES31.functional.image_load_s",
        "tore.3d.atomic.and_r32i_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011594,
        "dEQP-GLES31.functional.image_loa",
        "d_store.3d.atomic.or_r32i_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011595,
        "dEQP-GLES31.functional.image_load_s",
        "tore.3d.atomic.or_r32i_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011596,
        "dEQP-GLES31.functional.image_loa",
        "d_store.3d.atomic.xor_r32i_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011597,
        "dEQP-GLES31.functional.image_load_s",
        "tore.3d.atomic.xor_r32i_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011598,
        "dEQP-GLES31.functional.image_load_s",
        "tore.3d.atomic.exchange_r32i_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011599,
        "dEQP-GLES31.functional.image_load_stor",
        "e.3d.atomic.exchange_r32i_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011600,
        "dEQP-GLES31.functional.image_load_s",
        "tore.3d.atomic.comp_swap_r32i_result");
