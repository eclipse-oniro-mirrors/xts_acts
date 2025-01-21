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
#include "../ActsDeqpgles30021TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020794,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.0");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020795,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.1");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020796,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.2");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020797,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.3");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020798,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.4");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020799,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.5");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020800,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.6");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020801,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.7");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020802,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.8");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020803,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.9");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020804,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.10");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020805,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.11");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020806,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.12");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020807,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.13");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020808,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.14");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020809,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.15");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020810,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.16");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020811,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.17");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020812,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.18");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020813,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.19");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020814,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.20");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020815,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.21");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020816,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.22");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020817,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.23");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020818,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.24");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020819,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.25");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020820,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.26");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020821,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.27");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020822,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.28");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020823,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.29");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020824,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.30");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020825,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.31");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020826,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.32");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020827,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.33");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020828,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.34");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020829,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.35");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020830,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.36");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020831,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.37");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020832,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.38");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020833,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.39");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020834,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.40");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020835,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.41");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020836,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.42");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020837,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.43");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020838,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.44");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020839,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.45");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020840,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.46");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020841,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.47");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020842,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.48");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020843,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.49");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020844,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.50");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020845,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.51");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020846,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.52");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020847,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.53");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020848,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.54");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020849,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.55");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020850,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.56");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020851,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.57");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020852,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.58");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020853,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.59");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020854,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.60");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020855,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.61");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020856,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.62");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020857,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.63");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020858,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.64");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020859,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.65");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020860,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.66");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020861,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.67");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020862,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.68");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020863,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.69");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020864,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.70");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020865,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.71");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020866,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.72");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020867,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.73");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020868,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.74");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020869,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.75");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020870,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.76");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020871,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.77");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020872,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.78");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020873,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.79");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020874,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.80");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020875,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.81");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020876,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.82");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020877,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.83");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020878,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.84");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020879,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.85");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020880,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.86");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020881,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.87");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020882,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.88");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020883,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.89");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020884,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.90");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020885,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.91");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020886,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.92");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020887,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.93");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020888,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.94");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020889,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.95");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020890,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.96");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020891,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.97");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020892,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.98");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020893,
        "dEQP-GLES3.functional.shaders",
        ".random.conditionals.vertex.99");
