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

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021189,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.fragment.0");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021190,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.fragment.1");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021191,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.fragment.2");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021192,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.fragment.3");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021193,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.fragment.4");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021194,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.fragment.5");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021195,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.fragment.6");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021196,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.fragment.7");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021197,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.fragment.8");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021198,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.fragment.9");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021199,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.10");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021200,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.11");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021201,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.12");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021202,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.13");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021203,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.14");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021204,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.15");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021205,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.16");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021206,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.17");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021207,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.18");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021208,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.19");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021209,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.20");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021210,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.21");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021211,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.22");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021212,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.23");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021213,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.24");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021214,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.25");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021215,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.26");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021216,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.27");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021217,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.28");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021218,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.29");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021219,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.30");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021220,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.31");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021221,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.32");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021222,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.33");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021223,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.34");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021224,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.35");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021225,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.36");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021226,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.38");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021227,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.39");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021228,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.40");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021229,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.41");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021230,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.42");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021231,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.43");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021232,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.44");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021233,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.45");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021234,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.46");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021235,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.47");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021236,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.48");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021237,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.50");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021238,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.51");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021239,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.52");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021240,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.53");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021241,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.54");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021242,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.55");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021243,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.56");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021244,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.57");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021245,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.58");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021246,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.59");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021247,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.60");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021248,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.61");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021249,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.62");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021250,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.63");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021251,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.64");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021252,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.65");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021253,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.66");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021254,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.67");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021255,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.68");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021256,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.69");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021257,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.70");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021258,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.71");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021259,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.72");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021260,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.73");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021261,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.74");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021262,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.75");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021263,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.76");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021264,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.77");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021265,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.78");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021266,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.79");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021267,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.80");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021268,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.81");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021269,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.82");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021270,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.83");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021271,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.84");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021272,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.85");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021273,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.86");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021274,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.87");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021275,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.88");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021276,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.90");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021277,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.91");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021278,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.92");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021279,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.93");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021280,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.95");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021281,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.96");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021282,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.97");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021283,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.98");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021284,
        "dEQP-GLES3.functional.shaders.r",
        "andom.trigonometric.fragment.99");
