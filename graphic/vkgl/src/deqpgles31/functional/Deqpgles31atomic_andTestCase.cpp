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

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007657,
        "dEQP-GLES31.functional.compute.",
        "shared_var.atomic.and.lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007658,
        "dEQP-GLES31.functional.compute",
        ".shared_var.atomic.and.lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007659,
        "dEQP-GLES31.functional.compute.s",
        "hared_var.atomic.and.mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007660,
        "dEQP-GLES31.functional.compute.s",
        "hared_var.atomic.and.mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007661,
        "dEQP-GLES31.functional.compute.",
        "shared_var.atomic.and.highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007662,
        "dEQP-GLES31.functional.compute.",
        "shared_var.atomic.and.highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010357,
        "dEQP-GLES31.functional.s",
        "sbo.atomic.and.lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010358,
        "dEQP-GLES31.functional.",
        "ssbo.atomic.and.lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010359,
        "dEQP-GLES31.functional.ss",
        "bo.atomic.and.mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010360,
        "dEQP-GLES31.functional.ss",
        "bo.atomic.and.mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010361,
        "dEQP-GLES31.functional.s",
        "sbo.atomic.and.highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010362,
        "dEQP-GLES31.functional.s",
        "sbo.atomic.and.highp_int");
