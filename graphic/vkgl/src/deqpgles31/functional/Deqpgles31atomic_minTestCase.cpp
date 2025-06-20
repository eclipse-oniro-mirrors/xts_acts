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

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007645,
        "dEQP-GLES31.functional.compute.",
        "shared_var.atomic.min.lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007646,
        "dEQP-GLES31.functional.compute",
        ".shared_var.atomic.min.lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007647,
        "dEQP-GLES31.functional.compute.s",
        "hared_var.atomic.min.mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007648,
        "dEQP-GLES31.functional.compute.s",
        "hared_var.atomic.min.mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007649,
        "dEQP-GLES31.functional.compute.",
        "shared_var.atomic.min.highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007650,
        "dEQP-GLES31.functional.compute.",
        "shared_var.atomic.min.highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010345,
        "dEQP-GLES31.functional.s",
        "sbo.atomic.min.lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010346,
        "dEQP-GLES31.functional.",
        "ssbo.atomic.min.lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010347,
        "dEQP-GLES31.functional.ss",
        "bo.atomic.min.mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010348,
        "dEQP-GLES31.functional.ss",
        "bo.atomic.min.mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010349,
        "dEQP-GLES31.functional.s",
        "sbo.atomic.min.highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010350,
        "dEQP-GLES31.functional.s",
        "sbo.atomic.min.highp_int");
