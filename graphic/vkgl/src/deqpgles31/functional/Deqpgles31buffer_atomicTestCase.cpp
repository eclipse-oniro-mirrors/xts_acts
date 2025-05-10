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

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011855,
        "dEQP-GLES31.functional.image_load_sto",
        "re.buffer.atomic.exchange_r32f_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011856,
        "dEQP-GLES31.functional.image_load_store.",
        "buffer.atomic.exchange_r32f_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011857,
        "dEQP-GLES31.functional.image_load_s",
        "tore.buffer.atomic.add_r32ui_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011858,
        "dEQP-GLES31.functional.image_load_stor",
        "e.buffer.atomic.add_r32ui_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011859,
        "dEQP-GLES31.functional.image_load_s",
        "tore.buffer.atomic.min_r32ui_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011860,
        "dEQP-GLES31.functional.image_load_stor",
        "e.buffer.atomic.min_r32ui_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011861,
        "dEQP-GLES31.functional.image_load_s",
        "tore.buffer.atomic.max_r32ui_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011862,
        "dEQP-GLES31.functional.image_load_stor",
        "e.buffer.atomic.max_r32ui_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011863,
        "dEQP-GLES31.functional.image_load_s",
        "tore.buffer.atomic.and_r32ui_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011864,
        "dEQP-GLES31.functional.image_load_stor",
        "e.buffer.atomic.and_r32ui_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011865,
        "dEQP-GLES31.functional.image_load_",
        "store.buffer.atomic.or_r32ui_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011866,
        "dEQP-GLES31.functional.image_load_sto",
        "re.buffer.atomic.or_r32ui_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011867,
        "dEQP-GLES31.functional.image_load_s",
        "tore.buffer.atomic.xor_r32ui_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011868,
        "dEQP-GLES31.functional.image_load_stor",
        "e.buffer.atomic.xor_r32ui_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011869,
        "dEQP-GLES31.functional.image_load_sto",
        "re.buffer.atomic.exchange_r32ui_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011870,
        "dEQP-GLES31.functional.image_load_store.",
        "buffer.atomic.exchange_r32ui_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011871,
        "dEQP-GLES31.functional.image_load_stor",
        "e.buffer.atomic.comp_swap_r32ui_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011872,
        "dEQP-GLES31.functional.image_load_",
        "store.buffer.atomic.add_r32i_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011873,
        "dEQP-GLES31.functional.image_load_sto",
        "re.buffer.atomic.add_r32i_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011874,
        "dEQP-GLES31.functional.image_load_",
        "store.buffer.atomic.min_r32i_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011875,
        "dEQP-GLES31.functional.image_load_sto",
        "re.buffer.atomic.min_r32i_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011876,
        "dEQP-GLES31.functional.image_load_",
        "store.buffer.atomic.max_r32i_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011877,
        "dEQP-GLES31.functional.image_load_sto",
        "re.buffer.atomic.max_r32i_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011878,
        "dEQP-GLES31.functional.image_load_",
        "store.buffer.atomic.and_r32i_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011879,
        "dEQP-GLES31.functional.image_load_sto",
        "re.buffer.atomic.and_r32i_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011880,
        "dEQP-GLES31.functional.image_load_",
        "store.buffer.atomic.or_r32i_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011881,
        "dEQP-GLES31.functional.image_load_sto",
        "re.buffer.atomic.or_r32i_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011882,
        "dEQP-GLES31.functional.image_load_",
        "store.buffer.atomic.xor_r32i_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011883,
        "dEQP-GLES31.functional.image_load_sto",
        "re.buffer.atomic.xor_r32i_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011884,
        "dEQP-GLES31.functional.image_load_sto",
        "re.buffer.atomic.exchange_r32i_result");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011885,
        "dEQP-GLES31.functional.image_load_store.",
        "buffer.atomic.exchange_r32i_return_value");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011886,
        "dEQP-GLES31.functional.image_load_sto",
        "re.buffer.atomic.comp_swap_r32i_result");
