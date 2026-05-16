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

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009232,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.0");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009233,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.1");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009234,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.2");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009235,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.3");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009236,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.4");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009237,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.5");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009238,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.6");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009239,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.7");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009240,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.8");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009241,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.9");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009242,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.10");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009243,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.11");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009244,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.12");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009245,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.13");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009246,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.14");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009247,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.15");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009248,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.16");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009249,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.17");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009250,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.18");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009251,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.19");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009252,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.20");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009253,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.21");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009254,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.22");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009255,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.23");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009256,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.24");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009257,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.25");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009258,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.26");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009259,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.27");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009260,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.28");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009261,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.29");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009262,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.30");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009263,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.31");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009264,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.32");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009265,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.33");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009266,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.34");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009267,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.35");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009268,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.36");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009269,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.37");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009270,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.38");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009271,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.39");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009272,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.40");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009273,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.41");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009274,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.42");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009275,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.43");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009276,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.44");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009277,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.45");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009278,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.46");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009279,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.47");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009280,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.48");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009281,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.49");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009282,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.50");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009283,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.51");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009284,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.52");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009285,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.53");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009286,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.54");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009287,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.55");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009288,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.56");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009289,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.57");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009290,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.58");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009291,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.59");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009292,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.60");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009293,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.61");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009294,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.62");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009295,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.63");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009296,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.64");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009297,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.65");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009298,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.66");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009299,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.67");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009300,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.68");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009301,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.69");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009302,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.70");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009303,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.71");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009304,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.72");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009305,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.73");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009306,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.74");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009307,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.75");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009308,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.76");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009309,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.77");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009310,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.78");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009311,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.79");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009312,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.80");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009313,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.81");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009314,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.82");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009315,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.83");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009316,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.84");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009317,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.85");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009318,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.86");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009319,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.87");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009320,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.88");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009321,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.89");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009322,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.90");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009323,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.91");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009324,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.92");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009325,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.93");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009326,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.94");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009327,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.95");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009328,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.96");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009329,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.97");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009330,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.98");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009331,
        "dEQP-GLES2.functional.shaders.",
        "random.conditionals.fragment.99");
