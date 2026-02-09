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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20010TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009732,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.fragment.0");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009733,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.fragment.1");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009734,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.fragment.2");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009735,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.fragment.3");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009736,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.fragment.4");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009737,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.fragment.5");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009738,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.fragment.6");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009739,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.fragment.7");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009740,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.fragment.8");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009741,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.fragment.9");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009742,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.10");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009743,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.11");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009744,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.12");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009745,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.13");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009746,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.14");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009747,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.15");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009748,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.16");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009749,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.17");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009750,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.18");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009751,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.19");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009752,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.20");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009753,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.21");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009754,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.22");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009755,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.23");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009756,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.24");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009757,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.25");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009758,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.26");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009759,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.27");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009760,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.28");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009761,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.29");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009762,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.30");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009763,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.31");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009764,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.32");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009765,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.33");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009766,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.34");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009767,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.35");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009768,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.36");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009769,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.37");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009770,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.38");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009771,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.39");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009772,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.40");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009773,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.41");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009774,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.42");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009775,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.43");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009776,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.44");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009777,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.45");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009778,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.46");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009779,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.47");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009780,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.48");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009781,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.49");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009782,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.50");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009783,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.51");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009784,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.52");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009785,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.53");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009786,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.54");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009787,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.55");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009788,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.56");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009789,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.57");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009790,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.58");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009791,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.59");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009792,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.60");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009793,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.61");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009794,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.62");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009795,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.63");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009796,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.64");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009797,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.65");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009798,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.66");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009799,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.67");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009800,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.68");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009801,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.69");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009802,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.70");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009803,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.71");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009804,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.72");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009805,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.73");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009806,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.74");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009807,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.75");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009808,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.76");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009809,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.77");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009810,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.78");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009811,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.79");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009812,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.80");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009813,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.81");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009814,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.82");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009815,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.83");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009816,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.84");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009817,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.85");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009818,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.86");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009819,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.87");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009820,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.88");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009821,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.89");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009822,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.90");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009823,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.91");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009824,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.92");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009825,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.93");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009826,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.94");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009827,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.95");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009828,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.96");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009829,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.97");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009830,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.98");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009831,
        "dEQP-GLES2.functional.shaders.",
        "random.exponential.fragment.99");
