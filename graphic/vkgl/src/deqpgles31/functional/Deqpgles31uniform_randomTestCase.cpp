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
#include "../ActsDeqpgles310022TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021570,
        "dEQP-GLES31.functional.program_",
        "interface_query.uniform.random.0");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021571,
        "dEQP-GLES31.functional.program_",
        "interface_query.uniform.random.1");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021572,
        "dEQP-GLES31.functional.program_",
        "interface_query.uniform.random.2");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021573,
        "dEQP-GLES31.functional.program_",
        "interface_query.uniform.random.3");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021574,
        "dEQP-GLES31.functional.program_",
        "interface_query.uniform.random.4");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021575,
        "dEQP-GLES31.functional.program_",
        "interface_query.uniform.random.5");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021576,
        "dEQP-GLES31.functional.program_",
        "interface_query.uniform.random.6");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021577,
        "dEQP-GLES31.functional.program_",
        "interface_query.uniform.random.7");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021578,
        "dEQP-GLES31.functional.program_",
        "interface_query.uniform.random.8");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021579,
        "dEQP-GLES31.functional.program_",
        "interface_query.uniform.random.9");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021580,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.10");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021581,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.11");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021582,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.12");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021583,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.13");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021584,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.14");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021585,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.15");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021586,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.16");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021587,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.17");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021588,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.18");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021589,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.19");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021590,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.20");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021591,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.21");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021592,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.22");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021593,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.23");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021594,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.24");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021595,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.25");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021596,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.26");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021597,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.27");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021598,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.28");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021599,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.29");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021600,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.30");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021601,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.31");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021602,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.32");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021603,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.33");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021604,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.34");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021605,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.35");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021606,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.36");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021607,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.37");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021608,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.38");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021609,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.39");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021610,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.40");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021611,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.41");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021612,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.42");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021613,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.43");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021614,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.44");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021615,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.45");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021616,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.46");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021617,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.47");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021618,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.48");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021619,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.49");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021620,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.50");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021621,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.51");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021622,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.52");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021623,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.53");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021624,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.54");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021625,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.55");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021626,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.56");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021627,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.57");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021628,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.58");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021629,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.59");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021630,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.60");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021631,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.61");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021632,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.62");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021633,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.63");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021634,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.64");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021635,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.65");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021636,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.66");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021637,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.67");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021638,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.68");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021639,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.69");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021640,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.70");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021641,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.71");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021642,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.72");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021643,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.73");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021644,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.74");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021645,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.75");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021646,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.76");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021647,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.77");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021648,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.78");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021649,
        "dEQP-GLES31.functional.program_i",
        "nterface_query.uniform.random.79");
