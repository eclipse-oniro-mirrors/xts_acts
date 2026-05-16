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

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007639,
        "dEQP-GLES31.functional.compute.",
        "shared_var.atomic.add.lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007640,
        "dEQP-GLES31.functional.compute",
        ".shared_var.atomic.add.lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007641,
        "dEQP-GLES31.functional.compute.s",
        "hared_var.atomic.add.mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007642,
        "dEQP-GLES31.functional.compute.s",
        "hared_var.atomic.add.mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007643,
        "dEQP-GLES31.functional.compute.",
        "shared_var.atomic.add.highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007644,
        "dEQP-GLES31.functional.compute.",
        "shared_var.atomic.add.highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010339,
        "dEQP-GLES31.functional.s",
        "sbo.atomic.add.lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010340,
        "dEQP-GLES31.functional.",
        "ssbo.atomic.add.lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010341,
        "dEQP-GLES31.functional.ss",
        "bo.atomic.add.mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010342,
        "dEQP-GLES31.functional.ss",
        "bo.atomic.add.mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010343,
        "dEQP-GLES31.functional.s",
        "sbo.atomic.add.highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010344,
        "dEQP-GLES31.functional.s",
        "sbo.atomic.add.highp_int");
