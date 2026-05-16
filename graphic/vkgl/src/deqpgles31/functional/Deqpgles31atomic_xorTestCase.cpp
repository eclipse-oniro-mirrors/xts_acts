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

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007669,
        "dEQP-GLES31.functional.compute.",
        "shared_var.atomic.xor.lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007670,
        "dEQP-GLES31.functional.compute",
        ".shared_var.atomic.xor.lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007671,
        "dEQP-GLES31.functional.compute.s",
        "hared_var.atomic.xor.mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007672,
        "dEQP-GLES31.functional.compute.s",
        "hared_var.atomic.xor.mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007673,
        "dEQP-GLES31.functional.compute.",
        "shared_var.atomic.xor.highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007674,
        "dEQP-GLES31.functional.compute.",
        "shared_var.atomic.xor.highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010369,
        "dEQP-GLES31.functional.s",
        "sbo.atomic.xor.lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010370,
        "dEQP-GLES31.functional.",
        "ssbo.atomic.xor.lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010371,
        "dEQP-GLES31.functional.ss",
        "bo.atomic.xor.mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010372,
        "dEQP-GLES31.functional.ss",
        "bo.atomic.xor.mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010373,
        "dEQP-GLES31.functional.s",
        "sbo.atomic.xor.highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010374,
        "dEQP-GLES31.functional.s",
        "sbo.atomic.xor.highp_int");
