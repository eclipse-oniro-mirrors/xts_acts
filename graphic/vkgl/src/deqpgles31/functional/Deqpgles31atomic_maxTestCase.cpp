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

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007651,
        "dEQP-GLES31.functional.compute.",
        "shared_var.atomic.max.lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007652,
        "dEQP-GLES31.functional.compute",
        ".shared_var.atomic.max.lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007653,
        "dEQP-GLES31.functional.compute.s",
        "hared_var.atomic.max.mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007654,
        "dEQP-GLES31.functional.compute.s",
        "hared_var.atomic.max.mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007655,
        "dEQP-GLES31.functional.compute.",
        "shared_var.atomic.max.highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007656,
        "dEQP-GLES31.functional.compute.",
        "shared_var.atomic.max.highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010351,
        "dEQP-GLES31.functional.s",
        "sbo.atomic.max.lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010352,
        "dEQP-GLES31.functional.",
        "ssbo.atomic.max.lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010353,
        "dEQP-GLES31.functional.ss",
        "bo.atomic.max.mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010354,
        "dEQP-GLES31.functional.ss",
        "bo.atomic.max.mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010355,
        "dEQP-GLES31.functional.s",
        "sbo.atomic.max.highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010356,
        "dEQP-GLES31.functional.s",
        "sbo.atomic.max.highp_int");
