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

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019849,
        "dEQP-GLES31.functional.d",
        "ebug.error_filters.case_0");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019850,
        "dEQP-GLES31.functional.d",
        "ebug.error_filters.case_1");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019851,
        "dEQP-GLES31.functional.d",
        "ebug.error_filters.case_2");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019852,
        "dEQP-GLES31.functional.d",
        "ebug.error_filters.case_3");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019853,
        "dEQP-GLES31.functional.d",
        "ebug.error_filters.case_4");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019854,
        "dEQP-GLES31.functional.d",
        "ebug.error_filters.case_5");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019855,
        "dEQP-GLES31.functional.d",
        "ebug.error_filters.case_6");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019856,
        "dEQP-GLES31.functional.d",
        "ebug.error_filters.case_7");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019857,
        "dEQP-GLES31.functional.d",
        "ebug.error_filters.case_8");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019858,
        "dEQP-GLES31.functional.d",
        "ebug.error_filters.case_9");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019859,
        "dEQP-GLES31.functional.de",
        "bug.error_filters.case_10");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019860,
        "dEQP-GLES31.functional.de",
        "bug.error_filters.case_11");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019861,
        "dEQP-GLES31.functional.de",
        "bug.error_filters.case_12");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019862,
        "dEQP-GLES31.functional.de",
        "bug.error_filters.case_13");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019863,
        "dEQP-GLES31.functional.de",
        "bug.error_filters.case_14");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019864,
        "dEQP-GLES31.functional.de",
        "bug.error_filters.case_15");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019865,
        "dEQP-GLES31.functional.de",
        "bug.error_filters.case_16");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019866,
        "dEQP-GLES31.functional.de",
        "bug.error_filters.case_17");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019867,
        "dEQP-GLES31.functional.de",
        "bug.error_filters.case_18");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019868,
        "dEQP-GLES31.functional.de",
        "bug.error_filters.case_19");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019869,
        "dEQP-GLES31.functional.de",
        "bug.error_filters.case_20");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019870,
        "dEQP-GLES31.functional.de",
        "bug.error_filters.case_21");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019871,
        "dEQP-GLES31.functional.de",
        "bug.error_filters.case_22");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019872,
        "dEQP-GLES31.functional.de",
        "bug.error_filters.case_23");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019873,
        "dEQP-GLES31.functional.de",
        "bug.error_filters.case_24");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019874,
        "dEQP-GLES31.functional.de",
        "bug.error_filters.case_25");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019875,
        "dEQP-GLES31.functional.de",
        "bug.error_filters.case_26");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019876,
        "dEQP-GLES31.functional.de",
        "bug.error_filters.case_27");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019877,
        "dEQP-GLES31.functional.de",
        "bug.error_filters.case_28");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019878,
        "dEQP-GLES31.functional.de",
        "bug.error_filters.case_29");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019879,
        "dEQP-GLES31.functional.de",
        "bug.error_filters.case_30");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019880,
        "dEQP-GLES31.functional.de",
        "bug.error_filters.case_31");
