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

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008732,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.scalar_conversion.fragment.0");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008733,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.scalar_conversion.fragment.1");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008734,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.scalar_conversion.fragment.2");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008735,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.scalar_conversion.fragment.3");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008736,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.scalar_conversion.fragment.4");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008737,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.scalar_conversion.fragment.5");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008738,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.scalar_conversion.fragment.6");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008739,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.scalar_conversion.fragment.7");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008740,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.scalar_conversion.fragment.8");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008741,
        "dEQP-GLES2.functional.shaders.ra",
        "ndom.scalar_conversion.fragment.9");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008742,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.10");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008743,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.11");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008744,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.12");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008745,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.13");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008746,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.14");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008747,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.15");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008748,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.16");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008749,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.17");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008750,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.18");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008751,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.19");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008752,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.20");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008753,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.21");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008754,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.22");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008755,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.23");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008756,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.24");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008757,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.25");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008758,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.26");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008759,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.27");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008760,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.28");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008761,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.29");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008762,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.30");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008763,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.31");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008764,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.32");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008765,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.33");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008766,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.34");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008767,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.35");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008768,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.36");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008769,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.37");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008770,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.38");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008771,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.39");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008772,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.40");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008773,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.41");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008774,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.42");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008775,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.43");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008776,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.44");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008777,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.45");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008778,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.46");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008779,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.47");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008780,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.48");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008781,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.49");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008782,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.50");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008783,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.51");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008784,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.52");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008785,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.53");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008786,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.54");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008787,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.55");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008788,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.56");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008789,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.57");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008790,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.58");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008791,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.59");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008792,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.60");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008793,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.61");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008794,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.62");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008795,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.63");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008796,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.64");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008797,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.65");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008798,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.66");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008799,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.67");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008800,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.68");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008801,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.69");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008802,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.70");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008803,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.71");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008804,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.72");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008805,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.73");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008806,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.74");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008807,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.75");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008808,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.76");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008809,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.77");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008810,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.78");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008811,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.79");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008812,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.80");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008813,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.81");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008814,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.82");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008815,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.83");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008816,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.84");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008817,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.85");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008818,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.86");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008819,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.87");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008820,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.88");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008821,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.89");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008822,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.90");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008823,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.91");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008824,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.92");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008825,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.93");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008826,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.94");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008827,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.95");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008828,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.96");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008829,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.97");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008830,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.98");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008831,
        "dEQP-GLES2.functional.shaders.ran",
        "dom.scalar_conversion.fragment.99");
