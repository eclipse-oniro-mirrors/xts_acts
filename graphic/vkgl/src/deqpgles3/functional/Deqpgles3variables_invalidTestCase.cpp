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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30005TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004854,
        "dEQP-GLES3.functional.shaders.qualification_order.v",
        "ariables.invalid.invariant_interp_precision_storage");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004855,
        "dEQP-GLES3.functional.shaders.qualification_order.v",
        "ariables.invalid.invariant_storage_interp_precision");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004856,
        "dEQP-GLES3.functional.shaders.qualification_order.v",
        "ariables.invalid.invariant_storage_precision_interp");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004857,
        "dEQP-GLES3.functional.shaders.qualification_order.v",
        "ariables.invalid.invariant_precision_interp_storage");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004858,
        "dEQP-GLES3.functional.shaders.qualification_order.v",
        "ariables.invalid.invariant_precision_storage_interp");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004859,
        "dEQP-GLES3.functional.shaders.qualification_order.v",
        "ariables.invalid.interp_invariant_storage_precision");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004860,
        "dEQP-GLES3.functional.shaders.qualification_order.v",
        "ariables.invalid.interp_invariant_precision_storage");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004861,
        "dEQP-GLES3.functional.shaders.qualification_order.v",
        "ariables.invalid.interp_storage_invariant_precision");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004862,
        "dEQP-GLES3.functional.shaders.qualification_order.v",
        "ariables.invalid.interp_storage_precision_invariant");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004863,
        "dEQP-GLES3.functional.shaders.qualification_order.v",
        "ariables.invalid.interp_precision_invariant_storage");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004864,
        "dEQP-GLES3.functional.shaders.qualification_order.v",
        "ariables.invalid.interp_precision_storage_invariant");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004865,
        "dEQP-GLES3.functional.shaders.qualification_order.v",
        "ariables.invalid.storage_invariant_interp_precision");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004866,
        "dEQP-GLES3.functional.shaders.qualification_order.v",
        "ariables.invalid.storage_invariant_precision_interp");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004867,
        "dEQP-GLES3.functional.shaders.qualification_order.v",
        "ariables.invalid.storage_interp_invariant_precision");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004868,
        "dEQP-GLES3.functional.shaders.qualification_order.v",
        "ariables.invalid.storage_interp_precision_invariant");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004869,
        "dEQP-GLES3.functional.shaders.qualification_order.v",
        "ariables.invalid.storage_precision_invariant_interp");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004870,
        "dEQP-GLES3.functional.shaders.qualification_order.v",
        "ariables.invalid.storage_precision_interp_invariant");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004871,
        "dEQP-GLES3.functional.shaders.qualification_order.v",
        "ariables.invalid.precision_invariant_interp_storage");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004872,
        "dEQP-GLES3.functional.shaders.qualification_order.v",
        "ariables.invalid.precision_invariant_storage_interp");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004873,
        "dEQP-GLES3.functional.shaders.qualification_order.v",
        "ariables.invalid.precision_interp_invariant_storage");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004874,
        "dEQP-GLES3.functional.shaders.qualification_order.v",
        "ariables.invalid.precision_interp_storage_invariant");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004875,
        "dEQP-GLES3.functional.shaders.qualification_order.v",
        "ariables.invalid.precision_storage_invariant_interp");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004876,
        "dEQP-GLES3.functional.shaders.qualification_order.v",
        "ariables.invalid.precision_storage_interp_invariant");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004877,
        "dEQP-GLES3.functional.shaders.qualification_or",
        "der.variables.invalid.interp_precision_storage");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004878,
        "dEQP-GLES3.functional.shaders.qualification_or",
        "der.variables.invalid.storage_interp_precision");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004879,
        "dEQP-GLES3.functional.shaders.qualification_or",
        "der.variables.invalid.storage_precision_interp");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004880,
        "dEQP-GLES3.functional.shaders.qualification_or",
        "der.variables.invalid.precision_interp_storage");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004881,
        "dEQP-GLES3.functional.shaders.qualification_or",
        "der.variables.invalid.precision_storage_interp");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004882,
        "dEQP-GLES3.functional.shaders.qualification_or",
        "der.variables.invalid.invariant_storage_interp");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004883,
        "dEQP-GLES3.functional.shaders.qualification_or",
        "der.variables.invalid.interp_invariant_storage");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004884,
        "dEQP-GLES3.functional.shaders.qualification_or",
        "der.variables.invalid.interp_storage_invariant");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004885,
        "dEQP-GLES3.functional.shaders.qualification_or",
        "der.variables.invalid.storage_invariant_interp");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004886,
        "dEQP-GLES3.functional.shaders.qualification_or",
        "der.variables.invalid.storage_interp_invariant");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004887,
        "dEQP-GLES3.functional.shaders.qualification_ord",
        "er.variables.invalid.invariant_precision_storage");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004888,
        "dEQP-GLES3.functional.shaders.qualification_ord",
        "er.variables.invalid.storage_invariant_precision");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004889,
        "dEQP-GLES3.functional.shaders.qualification_ord",
        "er.variables.invalid.storage_precision_invariant");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004890,
        "dEQP-GLES3.functional.shaders.qualification_ord",
        "er.variables.invalid.precision_invariant_storage");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004891,
        "dEQP-GLES3.functional.shaders.qualification_ord",
        "er.variables.invalid.precision_storage_invariant");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004892,
        "dEQP-GLES3.functional.shaders.qualificatio",
        "n_order.variables.invalid.precision_storage");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004893,
        "dEQP-GLES3.functional.shaders.qualificati",
        "on_order.variables.invalid.storage_interp");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004894,
        "dEQP-GLES3.functional.shaders.qualificatio",
        "n_order.variables.invalid.storage_invariant");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004895,
        "dEQP-GLES3.functional.shaders.qualification_order.variables",
        ".invalid.invariant_interp_storage_precision_invariant_input");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004896,
        "dEQP-GLES3.functional.shaders.qualification_order.vari",
        "ables.invalid.interp_storage_precision_invariant_input");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004897,
        "dEQP-GLES3.functional.shaders.qualification_order.vari",
        "ables.invalid.invariant_interp_storage_invariant_input");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004898,
        "dEQP-GLES3.functional.shaders.qualification_order.varia",
        "bles.invalid.invariant_storage_precision_invariant_input");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004899,
        "dEQP-GLES3.functional.shaders.qualification_order.",
        "variables.invalid.storage_precision_invariant_input");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004900,
        "dEQP-GLES3.functional.shaders.qualification_order",
        ".variables.invalid.interp_storage_invariant_input");

static SHRINK_HWTEST_F(ActsDeqpgles30005TestSuite, TestCase_004901,
        "dEQP-GLES3.functional.shaders.qualification_order.",
        "variables.invalid.invariant_storage_invariant_input");
