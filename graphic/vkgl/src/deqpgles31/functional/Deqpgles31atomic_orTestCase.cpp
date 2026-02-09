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

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007663,
        "dEQP-GLES31.functional.compute",
        ".shared_var.atomic.or.lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007664,
        "dEQP-GLES31.functional.compute",
        ".shared_var.atomic.or.lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007665,
        "dEQP-GLES31.functional.compute.s",
        "hared_var.atomic.or.mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007666,
        "dEQP-GLES31.functional.compute.",
        "shared_var.atomic.or.mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007667,
        "dEQP-GLES31.functional.compute.",
        "shared_var.atomic.or.highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007668,
        "dEQP-GLES31.functional.compute",
        ".shared_var.atomic.or.highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010363,
        "dEQP-GLES31.functional.",
        "ssbo.atomic.or.lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010364,
        "dEQP-GLES31.functional.",
        "ssbo.atomic.or.lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010365,
        "dEQP-GLES31.functional.ss",
        "bo.atomic.or.mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010366,
        "dEQP-GLES31.functional.s",
        "sbo.atomic.or.mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010367,
        "dEQP-GLES31.functional.s",
        "sbo.atomic.or.highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_010368,
        "dEQP-GLES31.functional.",
        "ssbo.atomic.or.highp_int");
