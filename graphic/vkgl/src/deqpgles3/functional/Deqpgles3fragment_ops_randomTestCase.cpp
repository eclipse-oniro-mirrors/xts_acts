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

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030618,
        "dEQP-GLES3.functional",
        ".fragment_ops.random.0");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030619,
        "dEQP-GLES3.functional",
        ".fragment_ops.random.1");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030620,
        "dEQP-GLES3.functional",
        ".fragment_ops.random.2");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030621,
        "dEQP-GLES3.functional",
        ".fragment_ops.random.3");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030622,
        "dEQP-GLES3.functional",
        ".fragment_ops.random.4");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030623,
        "dEQP-GLES3.functional",
        ".fragment_ops.random.5");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030624,
        "dEQP-GLES3.functional",
        ".fragment_ops.random.6");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030625,
        "dEQP-GLES3.functional",
        ".fragment_ops.random.7");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030626,
        "dEQP-GLES3.functional",
        ".fragment_ops.random.8");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030627,
        "dEQP-GLES3.functional",
        ".fragment_ops.random.9");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030628,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.10");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030629,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.11");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030630,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.12");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030631,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.13");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030632,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.14");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030633,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.15");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030634,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.16");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030635,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.17");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030636,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.18");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030637,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.19");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030638,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.20");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030639,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.21");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030640,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.22");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030641,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.23");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030642,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.24");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030643,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.25");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030644,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.26");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030645,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.27");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030646,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.28");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030647,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.29");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030648,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.30");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030649,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.31");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030650,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.32");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030651,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.33");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030652,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.34");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030653,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.35");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030654,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.36");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030655,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.37");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030656,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.38");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030657,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.39");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030658,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.40");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030659,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.41");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030660,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.42");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030661,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.43");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030662,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.44");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030663,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.45");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030664,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.46");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030665,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.47");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030666,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.48");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030667,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.49");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030668,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.50");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030669,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.51");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030670,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.52");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030671,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.53");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030672,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.54");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030673,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.55");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030674,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.56");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030675,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.57");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030676,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.58");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030677,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.59");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030678,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.60");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030679,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.61");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030680,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.62");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030681,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.63");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030682,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.64");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030683,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.65");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030684,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.66");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030685,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.67");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030686,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.68");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030687,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.69");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030688,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.70");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030689,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.71");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030690,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.72");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030691,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.73");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030692,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.74");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030693,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.75");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030694,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.76");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030695,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.77");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030696,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.78");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030697,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.79");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030698,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.80");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030699,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.81");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030700,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.82");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030701,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.83");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030702,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.84");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030703,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.85");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030704,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.86");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030705,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.87");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030706,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.88");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030707,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.89");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030708,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.90");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030709,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.91");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030710,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.92");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030711,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.93");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030712,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.94");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030713,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.95");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030714,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.96");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030715,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.97");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030716,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.98");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030717,
        "dEQP-GLES3.functional.",
        "fragment_ops.random.99");
