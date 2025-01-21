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
#include "../ActsDeqpgles20009TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008832,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.scalar_conversion.combined.0");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008833,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.scalar_conversion.combined.1");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008834,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.scalar_conversion.combined.2");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008835,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.scalar_conversion.combined.3");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008836,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.scalar_conversion.combined.4");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008837,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.scalar_conversion.combined.5");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008838,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.scalar_conversion.combined.6");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008839,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.scalar_conversion.combined.7");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008840,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.scalar_conversion.combined.8");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008841,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.scalar_conversion.combined.9");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008842,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.10");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008843,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.11");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008844,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.12");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008845,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.13");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008846,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.14");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008847,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.15");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008848,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.16");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008849,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.17");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008850,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.18");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008851,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.19");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008852,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.20");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008853,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.21");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008854,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.22");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008855,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.23");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008856,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.24");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008857,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.25");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008858,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.26");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008859,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.27");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008860,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.28");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008861,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.29");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008862,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.30");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008863,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.31");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008864,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.32");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008865,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.33");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008866,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.34");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008867,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.35");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008868,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.36");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008869,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.37");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008870,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.38");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008871,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.39");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008872,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.40");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008873,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.41");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008874,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.42");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008875,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.43");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008876,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.44");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008877,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.45");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008878,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.46");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008879,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.47");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008880,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.48");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008881,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.49");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008882,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.50");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008883,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.51");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008884,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.52");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008885,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.53");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008886,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.54");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008887,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.55");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008888,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.56");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008889,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.57");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008890,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.58");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008891,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.59");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008892,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.60");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008893,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.61");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008894,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.62");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008895,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.63");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008896,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.64");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008897,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.65");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008898,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.66");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008899,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.67");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008900,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.68");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008901,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.69");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008902,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.70");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008903,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.71");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008904,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.72");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008905,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.73");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008906,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.74");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008907,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.75");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008908,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.76");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008909,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.77");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008910,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.78");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008911,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.79");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008912,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.80");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008913,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.81");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008914,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.82");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008915,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.83");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008916,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.84");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008917,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.85");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008918,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.86");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008919,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.87");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008920,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.88");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008921,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.89");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008922,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.90");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008923,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.91");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008924,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.92");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008925,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.93");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008926,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.94");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008927,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.95");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008928,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.96");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008929,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.97");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008930,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.98");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008931,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.combined.99");
