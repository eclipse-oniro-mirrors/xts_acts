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
#include "../ActsDeqpgles310018TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017710,
        "dEQP-GLES31.functional.",
        "separate_shader.random.0");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017711,
        "dEQP-GLES31.functional.",
        "separate_shader.random.1");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017712,
        "dEQP-GLES31.functional.",
        "separate_shader.random.2");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017713,
        "dEQP-GLES31.functional.",
        "separate_shader.random.3");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017714,
        "dEQP-GLES31.functional.",
        "separate_shader.random.4");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017715,
        "dEQP-GLES31.functional.",
        "separate_shader.random.5");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017716,
        "dEQP-GLES31.functional.",
        "separate_shader.random.6");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017717,
        "dEQP-GLES31.functional.",
        "separate_shader.random.7");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017718,
        "dEQP-GLES31.functional.",
        "separate_shader.random.8");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017719,
        "dEQP-GLES31.functional.",
        "separate_shader.random.9");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017720,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.10");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017721,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.11");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017722,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.12");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017723,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.13");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017724,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.14");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017725,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.15");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017726,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.16");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017727,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.17");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017728,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.18");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017729,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.19");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017730,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.20");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017731,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.21");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017732,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.22");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017733,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.23");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017734,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.24");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017735,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.25");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017736,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.26");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017737,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.27");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017738,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.28");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017739,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.29");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017740,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.30");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017741,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.31");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017742,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.32");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017743,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.33");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017744,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.34");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017745,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.35");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017746,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.36");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017747,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.37");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017748,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.38");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017749,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.39");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017750,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.40");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017751,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.41");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017752,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.42");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017753,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.43");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017754,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.44");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017755,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.45");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017756,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.46");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017757,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.47");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017758,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.48");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017759,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.49");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017760,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.50");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017761,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.51");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017762,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.52");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017763,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.53");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017764,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.54");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017765,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.55");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017766,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.56");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017767,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.57");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017768,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.58");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017769,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.59");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017770,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.60");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017771,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.61");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017772,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.62");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017773,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.63");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017774,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.64");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017775,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.65");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017776,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.66");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017777,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.67");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017778,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.68");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017779,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.69");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017780,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.70");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017781,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.71");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017782,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.72");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017783,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.73");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017784,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.74");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017785,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.75");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017786,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.76");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017787,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.77");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017788,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.78");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017789,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.79");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017790,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.80");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017791,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.81");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017792,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.82");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017793,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.83");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017794,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.84");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017795,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.85");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017796,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.86");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017797,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.87");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017798,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.88");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017799,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.89");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017800,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.90");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017801,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.91");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017802,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.92");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017803,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.93");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017804,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.94");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017805,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.95");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017806,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.96");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017807,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.97");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017808,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.98");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017809,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.99");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017810,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.100");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017811,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.101");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017812,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.102");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017813,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.103");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017814,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.104");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017815,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.105");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017816,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.106");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017817,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.107");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017818,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.108");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017819,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.109");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017820,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.110");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017821,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.111");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017822,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.112");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017823,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.113");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017824,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.114");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017825,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.115");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017826,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.116");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017827,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.117");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017828,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.118");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017829,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.119");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017830,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.120");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017831,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.121");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017832,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.122");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017833,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.123");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017834,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.124");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017835,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.125");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017836,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.126");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017837,
        "dEQP-GLES31.functional.s",
        "eparate_shader.random.127");
