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

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007681,
        "dEQP-GLES31.functional.compute.sh",
        "ared_var.atomic.compswap.lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007682,
        "dEQP-GLES31.functional.compute.sh",
        "ared_var.atomic.compswap.lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007683,
        "dEQP-GLES31.functional.compute.shar",
        "ed_var.atomic.compswap.mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007684,
        "dEQP-GLES31.functional.compute.sha",
        "red_var.atomic.compswap.mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007685,
        "dEQP-GLES31.functional.compute.sha",
        "red_var.atomic.compswap.highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007686,
        "dEQP-GLES31.functional.compute.sh",
        "ared_var.atomic.compswap.highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010381,
        "dEQP-GLES31.functional.ssb",
        "o.atomic.compswap.lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010382,
        "dEQP-GLES31.functional.ssb",
        "o.atomic.compswap.lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010383,
        "dEQP-GLES31.functional.ssbo.",
        "atomic.compswap.mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010384,
        "dEQP-GLES31.functional.ssbo",
        ".atomic.compswap.mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010385,
        "dEQP-GLES31.functional.ssbo",
        ".atomic.compswap.highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010386,
        "dEQP-GLES31.functional.ssb",
        "o.atomic.compswap.highp_int");
