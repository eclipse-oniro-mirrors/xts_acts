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

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007675,
        "dEQP-GLES31.functional.compute.sh",
        "ared_var.atomic.exchange.lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007676,
        "dEQP-GLES31.functional.compute.sh",
        "ared_var.atomic.exchange.lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007677,
        "dEQP-GLES31.functional.compute.shar",
        "ed_var.atomic.exchange.mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007678,
        "dEQP-GLES31.functional.compute.sha",
        "red_var.atomic.exchange.mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007679,
        "dEQP-GLES31.functional.compute.sha",
        "red_var.atomic.exchange.highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007680,
        "dEQP-GLES31.functional.compute.sh",
        "ared_var.atomic.exchange.highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010375,
        "dEQP-GLES31.functional.ssb",
        "o.atomic.exchange.lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010376,
        "dEQP-GLES31.functional.ssb",
        "o.atomic.exchange.lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010377,
        "dEQP-GLES31.functional.ssbo.",
        "atomic.exchange.mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010378,
        "dEQP-GLES31.functional.ssbo",
        ".atomic.exchange.mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010379,
        "dEQP-GLES31.functional.ssbo",
        ".atomic.exchange.highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010380,
        "dEQP-GLES31.functional.ssb",
        "o.atomic.exchange.highp_int");
