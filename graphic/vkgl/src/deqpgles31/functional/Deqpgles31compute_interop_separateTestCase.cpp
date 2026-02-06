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
#include "../ActsDeqpgles310008TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007783,
        "dEQP-GLES31.functional.draw_indirect.compu",
        "te_interop.separate.drawarrays_compute_cmd");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007784,
        "dEQP-GLES31.functional.draw_indirect.compu",
        "te_interop.separate.drawarrays_compute_data");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007785,
        "dEQP-GLES31.functional.draw_indirect.compute_i",
        "nterop.separate.drawarrays_compute_cmd_and_data");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007786,
        "dEQP-GLES31.functional.draw_indirect.comput",
        "e_interop.separate.drawelements_compute_cmd");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007787,
        "dEQP-GLES31.functional.draw_indirect.comput",
        "e_interop.separate.drawelements_compute_data");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007788,
        "dEQP-GLES31.functional.draw_indirect.compute_",
        "interop.separate.drawelements_compute_indices");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007789,
        "dEQP-GLES31.functional.draw_indirect.compute_in",
        "terop.separate.drawelements_compute_cmd_and_data");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007790,
        "dEQP-GLES31.functional.draw_indirect.compute_inte",
        "rop.separate.drawelements_compute_cmd_and_indices");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007791,
        "dEQP-GLES31.functional.draw_indirect.compute_inte",
        "rop.separate.drawelements_compute_data_and_indices");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007792,
        "dEQP-GLES31.functional.draw_indirect.compute_interop.",
        "separate.drawelements_compute_cmd_and_data_and_indices");
