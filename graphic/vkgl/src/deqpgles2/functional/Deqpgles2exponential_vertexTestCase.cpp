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

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009632,
        "dEQP-GLES2.functional.shader",
        "s.random.exponential.vertex.0");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009633,
        "dEQP-GLES2.functional.shader",
        "s.random.exponential.vertex.1");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009634,
        "dEQP-GLES2.functional.shader",
        "s.random.exponential.vertex.2");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009635,
        "dEQP-GLES2.functional.shader",
        "s.random.exponential.vertex.3");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009636,
        "dEQP-GLES2.functional.shader",
        "s.random.exponential.vertex.4");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009637,
        "dEQP-GLES2.functional.shader",
        "s.random.exponential.vertex.5");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009638,
        "dEQP-GLES2.functional.shader",
        "s.random.exponential.vertex.6");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009639,
        "dEQP-GLES2.functional.shader",
        "s.random.exponential.vertex.7");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009640,
        "dEQP-GLES2.functional.shader",
        "s.random.exponential.vertex.8");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009641,
        "dEQP-GLES2.functional.shader",
        "s.random.exponential.vertex.9");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009642,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.10");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009643,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.11");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009644,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.12");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009645,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.13");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009646,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.14");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009647,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.15");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009648,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.16");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009649,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.17");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009650,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.18");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009651,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.19");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009652,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.20");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009653,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.21");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009654,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.22");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009655,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.23");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009656,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.24");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009657,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.25");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009658,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.26");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009659,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.27");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009660,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.28");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009661,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.29");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009662,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.30");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009663,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.31");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009664,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.32");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009665,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.33");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009666,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.34");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009667,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.35");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009668,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.36");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009669,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.37");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009670,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.38");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009671,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.39");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009672,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.40");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009673,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.41");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009674,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.42");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009675,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.43");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009676,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.44");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009677,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.45");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009678,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.46");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009679,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.47");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009680,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.48");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009681,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.49");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009682,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.50");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009683,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.51");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009684,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.52");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009685,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.53");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009686,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.54");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009687,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.55");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009688,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.56");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009689,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.57");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009690,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.58");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009691,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.59");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009692,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.60");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009693,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.61");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009694,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.62");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009695,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.63");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009696,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.64");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009697,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.65");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009698,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.66");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009699,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.67");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009700,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.68");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009701,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.69");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009702,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.70");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009703,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.71");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009704,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.72");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009705,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.73");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009706,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.74");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009707,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.75");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009708,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.76");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009709,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.77");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009710,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.78");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009711,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.79");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009712,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.80");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009713,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.81");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009714,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.82");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009715,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.83");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009716,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.84");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009717,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.85");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009718,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.86");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009719,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.87");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009720,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.88");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009721,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.89");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009722,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.90");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009723,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.91");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009724,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.92");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009725,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.93");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009726,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.94");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009727,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.95");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009728,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.96");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009729,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.97");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009730,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.98");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009731,
        "dEQP-GLES2.functional.shaders",
        ".random.exponential.vertex.99");
