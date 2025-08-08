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
#include "../ActsDeqpgles310019TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018697,
        "dEQP-GLES31.functional.debug.negative_coverage.ca",
        "llbacks.atomic_counter.atomic_max_counter_bindings");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018698,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.callbacks.atomic_counter.atomic_precision");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018699,
        "dEQP-GLES31.functional.debug.negative_coverage.cal",
        "lbacks.atomic_counter.atomic_binding_offset_overlap");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018700,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "callbacks.atomic_counter.atomic_binding_omitted");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018701,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.callbacks.atomic_counter.atomic_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018702,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.callbacks.atomic_counter.atomic_body_write");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018703,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.callbacks.atomic_counter.atomic_body_declare");
