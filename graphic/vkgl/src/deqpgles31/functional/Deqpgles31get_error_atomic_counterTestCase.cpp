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
#include "../ActsDeqpgles310020TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019691,
        "dEQP-GLES31.functional.debug.negative_coverage.ge",
        "t_error.atomic_counter.atomic_max_counter_bindings");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019692,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.get_error.atomic_counter.atomic_precision");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019693,
        "dEQP-GLES31.functional.debug.negative_coverage.get",
        "_error.atomic_counter.atomic_binding_offset_overlap");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019694,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "get_error.atomic_counter.atomic_binding_omitted");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019695,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.get_error.atomic_counter.atomic_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019696,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.get_error.atomic_counter.atomic_body_write");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019697,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.get_error.atomic_counter.atomic_body_declare");
