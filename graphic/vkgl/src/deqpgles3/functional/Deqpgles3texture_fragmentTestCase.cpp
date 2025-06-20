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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30022TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021535,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.fragment.0");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021536,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.fragment.1");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021537,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.fragment.2");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021538,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.fragment.3");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021539,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.fragment.4");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021540,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.fragment.5");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021541,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.fragment.6");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021542,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.fragment.7");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021543,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.fragment.8");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021544,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.fragment.9");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021545,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.10");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021546,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.11");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021547,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.12");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021548,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.13");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021549,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.14");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021550,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.15");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021551,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.16");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021552,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.17");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021553,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.18");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021554,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.19");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021555,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.20");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021556,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.21");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021557,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.22");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021558,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.23");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021559,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.24");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021560,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.25");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021561,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.26");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021562,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.27");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021563,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.28");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021564,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.29");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021565,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.30");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021566,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.31");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021567,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.32");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021568,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.33");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021569,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.34");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021570,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.35");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021571,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.36");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021572,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.37");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021573,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.38");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021574,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.39");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021575,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.40");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021576,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.41");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021577,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.42");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021578,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.43");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021579,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.44");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021580,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.45");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021581,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.46");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021582,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.47");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021583,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.48");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021584,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.49");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021585,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.50");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021586,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.51");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021587,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.52");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021588,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.53");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021589,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.54");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021590,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.55");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021591,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.56");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021592,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.57");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021593,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.58");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021594,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.59");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021595,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.60");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021596,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.61");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021597,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.62");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021598,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.63");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021599,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.64");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021600,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.65");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021601,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.66");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021602,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.67");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021603,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.68");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021604,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.69");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021605,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.70");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021606,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.71");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021607,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.72");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021608,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.73");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021609,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.74");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021610,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.75");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021611,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.76");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021612,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.77");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021613,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.78");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021614,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.79");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021615,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.80");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021616,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.81");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021617,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.82");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021618,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.83");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021619,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.84");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021620,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.85");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021621,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.86");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021622,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.87");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021623,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.88");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021624,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.89");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021625,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.90");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021626,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.91");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021627,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.92");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021628,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.93");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021629,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.94");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021630,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.95");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021631,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.96");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021632,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.97");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021633,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.98");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021634,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.99");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021635,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.100");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021636,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.101");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021637,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.102");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021638,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.103");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021639,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.104");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021640,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.105");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021641,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.106");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021642,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.107");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021643,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.108");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021644,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.109");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021645,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.110");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021646,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.111");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021647,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.112");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021648,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.113");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021649,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.114");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021650,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.115");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021651,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.116");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021652,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.117");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021653,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.118");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021654,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.119");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021655,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.120");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021656,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.121");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021657,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.122");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021658,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.123");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021659,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.124");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021660,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.125");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021661,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.126");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021662,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.127");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021663,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.128");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021664,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.129");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021665,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.130");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021666,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.131");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021667,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.132");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021668,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.133");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021669,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.134");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021670,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.135");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021671,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.136");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021672,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.137");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021673,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.138");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021674,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.139");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021675,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.140");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021676,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.141");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021677,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.142");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021678,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.143");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021679,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.144");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021680,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.145");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021681,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.146");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021682,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.147");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021683,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.148");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021684,
        "dEQP-GLES3.functional.shader",
        "s.random.texture.fragment.149");
