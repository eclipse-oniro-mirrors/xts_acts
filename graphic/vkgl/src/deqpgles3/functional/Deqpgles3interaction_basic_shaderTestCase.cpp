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
#include "../ActsDeqpgles30031TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030718,
        "dEQP-GLES3.functional.fragment",
        "_ops.interaction.basic_shader.0");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030719,
        "dEQP-GLES3.functional.fragment",
        "_ops.interaction.basic_shader.1");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030720,
        "dEQP-GLES3.functional.fragment",
        "_ops.interaction.basic_shader.2");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030721,
        "dEQP-GLES3.functional.fragment",
        "_ops.interaction.basic_shader.3");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030722,
        "dEQP-GLES3.functional.fragment",
        "_ops.interaction.basic_shader.5");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030723,
        "dEQP-GLES3.functional.fragment",
        "_ops.interaction.basic_shader.6");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030724,
        "dEQP-GLES3.functional.fragment",
        "_ops.interaction.basic_shader.7");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030725,
        "dEQP-GLES3.functional.fragment",
        "_ops.interaction.basic_shader.8");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030726,
        "dEQP-GLES3.functional.fragment",
        "_ops.interaction.basic_shader.9");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030727,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.10");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030728,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.11");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030729,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.12");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030730,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.13");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030731,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.14");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030732,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.15");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030733,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.16");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030734,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.17");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030735,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.18");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030736,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.19");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030737,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.21");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030738,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.22");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030739,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.23");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030740,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.24");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030741,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.25");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030742,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.26");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030743,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.27");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030744,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.28");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030745,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.29");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030746,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.30");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030747,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.31");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030748,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.32");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030749,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.33");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030750,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.34");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030751,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.35");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030752,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.36");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030753,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.37");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030754,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.38");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030755,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.39");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030756,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.40");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030757,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.41");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030758,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.42");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030759,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.43");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030760,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.44");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030761,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.45");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030762,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.46");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030763,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.47");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030764,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.48");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030765,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.49");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030766,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.50");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030767,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.51");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030768,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.52");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030769,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.53");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030770,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.54");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030771,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.55");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030772,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.56");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030773,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.57");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030774,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.58");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030775,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.59");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030776,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.60");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030777,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.61");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030778,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.62");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030779,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.63");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030780,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.64");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030781,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.65");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030782,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.66");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030783,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.67");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030784,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.68");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030785,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.69");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030786,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.70");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030787,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.71");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030788,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.72");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030789,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.73");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030790,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.74");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030791,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.75");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030792,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.76");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030793,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.77");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030794,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.78");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030795,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.79");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030796,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.80");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030797,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.81");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030798,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.82");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030799,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.83");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030800,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.84");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030801,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.85");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030802,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.86");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030803,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.87");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030804,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.88");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030805,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.89");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030806,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.90");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030807,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.91");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030808,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.92");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030809,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.93");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030810,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.94");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030811,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.95");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030812,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.96");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030813,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.97");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030814,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.98");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030815,
        "dEQP-GLES3.functional.fragment_",
        "ops.interaction.basic_shader.99");
