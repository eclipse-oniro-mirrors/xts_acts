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
#include "../ActsDeqpgles20016TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015149,
        "dEQP-GLES2.functional",
        ".uniform_api.random.0");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015150,
        "dEQP-GLES2.functional",
        ".uniform_api.random.1");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015151,
        "dEQP-GLES2.functional",
        ".uniform_api.random.2");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015152,
        "dEQP-GLES2.functional",
        ".uniform_api.random.3");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015153,
        "dEQP-GLES2.functional",
        ".uniform_api.random.4");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015154,
        "dEQP-GLES2.functional",
        ".uniform_api.random.5");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015155,
        "dEQP-GLES2.functional",
        ".uniform_api.random.6");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015156,
        "dEQP-GLES2.functional",
        ".uniform_api.random.7");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015157,
        "dEQP-GLES2.functional",
        ".uniform_api.random.8");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015158,
        "dEQP-GLES2.functional",
        ".uniform_api.random.9");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015159,
        "dEQP-GLES2.functional",
        ".uniform_api.random.10");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015160,
        "dEQP-GLES2.functional",
        ".uniform_api.random.11");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015161,
        "dEQP-GLES2.functional",
        ".uniform_api.random.12");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015162,
        "dEQP-GLES2.functional",
        ".uniform_api.random.13");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015163,
        "dEQP-GLES2.functional",
        ".uniform_api.random.14");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015164,
        "dEQP-GLES2.functional",
        ".uniform_api.random.15");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015165,
        "dEQP-GLES2.functional",
        ".uniform_api.random.16");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015166,
        "dEQP-GLES2.functional",
        ".uniform_api.random.17");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015167,
        "dEQP-GLES2.functional",
        ".uniform_api.random.18");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015168,
        "dEQP-GLES2.functional",
        ".uniform_api.random.19");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015169,
        "dEQP-GLES2.functional",
        ".uniform_api.random.20");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015170,
        "dEQP-GLES2.functional",
        ".uniform_api.random.21");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015171,
        "dEQP-GLES2.functional",
        ".uniform_api.random.22");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015172,
        "dEQP-GLES2.functional",
        ".uniform_api.random.23");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015173,
        "dEQP-GLES2.functional",
        ".uniform_api.random.24");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015174,
        "dEQP-GLES2.functional",
        ".uniform_api.random.25");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015175,
        "dEQP-GLES2.functional",
        ".uniform_api.random.26");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015176,
        "dEQP-GLES2.functional",
        ".uniform_api.random.27");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015177,
        "dEQP-GLES2.functional",
        ".uniform_api.random.28");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015178,
        "dEQP-GLES2.functional",
        ".uniform_api.random.29");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015179,
        "dEQP-GLES2.functional",
        ".uniform_api.random.30");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015180,
        "dEQP-GLES2.functional",
        ".uniform_api.random.31");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015181,
        "dEQP-GLES2.functional",
        ".uniform_api.random.32");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015182,
        "dEQP-GLES2.functional",
        ".uniform_api.random.33");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015183,
        "dEQP-GLES2.functional",
        ".uniform_api.random.34");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015184,
        "dEQP-GLES2.functional",
        ".uniform_api.random.35");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015185,
        "dEQP-GLES2.functional",
        ".uniform_api.random.36");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015186,
        "dEQP-GLES2.functional",
        ".uniform_api.random.37");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015187,
        "dEQP-GLES2.functional",
        ".uniform_api.random.38");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015188,
        "dEQP-GLES2.functional",
        ".uniform_api.random.39");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015189,
        "dEQP-GLES2.functional",
        ".uniform_api.random.40");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015190,
        "dEQP-GLES2.functional",
        ".uniform_api.random.41");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015191,
        "dEQP-GLES2.functional",
        ".uniform_api.random.42");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015192,
        "dEQP-GLES2.functional",
        ".uniform_api.random.43");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015193,
        "dEQP-GLES2.functional",
        ".uniform_api.random.44");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015194,
        "dEQP-GLES2.functional",
        ".uniform_api.random.45");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015195,
        "dEQP-GLES2.functional",
        ".uniform_api.random.46");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015196,
        "dEQP-GLES2.functional",
        ".uniform_api.random.47");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015197,
        "dEQP-GLES2.functional",
        ".uniform_api.random.48");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015198,
        "dEQP-GLES2.functional",
        ".uniform_api.random.49");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015199,
        "dEQP-GLES2.functional",
        ".uniform_api.random.50");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015200,
        "dEQP-GLES2.functional",
        ".uniform_api.random.51");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015201,
        "dEQP-GLES2.functional",
        ".uniform_api.random.52");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015202,
        "dEQP-GLES2.functional",
        ".uniform_api.random.53");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015203,
        "dEQP-GLES2.functional",
        ".uniform_api.random.54");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015204,
        "dEQP-GLES2.functional",
        ".uniform_api.random.55");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015205,
        "dEQP-GLES2.functional",
        ".uniform_api.random.56");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015206,
        "dEQP-GLES2.functional",
        ".uniform_api.random.57");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015207,
        "dEQP-GLES2.functional",
        ".uniform_api.random.58");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015208,
        "dEQP-GLES2.functional",
        ".uniform_api.random.59");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015209,
        "dEQP-GLES2.functional",
        ".uniform_api.random.60");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015210,
        "dEQP-GLES2.functional",
        ".uniform_api.random.61");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015211,
        "dEQP-GLES2.functional",
        ".uniform_api.random.62");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015212,
        "dEQP-GLES2.functional",
        ".uniform_api.random.63");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015213,
        "dEQP-GLES2.functional",
        ".uniform_api.random.64");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015214,
        "dEQP-GLES2.functional",
        ".uniform_api.random.65");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015215,
        "dEQP-GLES2.functional",
        ".uniform_api.random.66");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015216,
        "dEQP-GLES2.functional",
        ".uniform_api.random.67");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015217,
        "dEQP-GLES2.functional",
        ".uniform_api.random.68");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015218,
        "dEQP-GLES2.functional",
        ".uniform_api.random.69");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015219,
        "dEQP-GLES2.functional",
        ".uniform_api.random.70");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015220,
        "dEQP-GLES2.functional",
        ".uniform_api.random.71");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015221,
        "dEQP-GLES2.functional",
        ".uniform_api.random.72");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015222,
        "dEQP-GLES2.functional",
        ".uniform_api.random.73");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015223,
        "dEQP-GLES2.functional",
        ".uniform_api.random.74");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015224,
        "dEQP-GLES2.functional",
        ".uniform_api.random.75");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015225,
        "dEQP-GLES2.functional",
        ".uniform_api.random.76");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015226,
        "dEQP-GLES2.functional",
        ".uniform_api.random.77");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015227,
        "dEQP-GLES2.functional",
        ".uniform_api.random.78");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015228,
        "dEQP-GLES2.functional",
        ".uniform_api.random.79");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015229,
        "dEQP-GLES2.functional",
        ".uniform_api.random.80");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015230,
        "dEQP-GLES2.functional",
        ".uniform_api.random.81");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015231,
        "dEQP-GLES2.functional",
        ".uniform_api.random.82");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015232,
        "dEQP-GLES2.functional",
        ".uniform_api.random.83");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015233,
        "dEQP-GLES2.functional",
        ".uniform_api.random.84");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015234,
        "dEQP-GLES2.functional",
        ".uniform_api.random.85");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015235,
        "dEQP-GLES2.functional",
        ".uniform_api.random.86");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015236,
        "dEQP-GLES2.functional",
        ".uniform_api.random.87");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015237,
        "dEQP-GLES2.functional",
        ".uniform_api.random.88");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015238,
        "dEQP-GLES2.functional",
        ".uniform_api.random.89");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015239,
        "dEQP-GLES2.functional",
        ".uniform_api.random.90");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015240,
        "dEQP-GLES2.functional",
        ".uniform_api.random.91");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015241,
        "dEQP-GLES2.functional",
        ".uniform_api.random.92");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015242,
        "dEQP-GLES2.functional",
        ".uniform_api.random.93");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015243,
        "dEQP-GLES2.functional",
        ".uniform_api.random.94");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015244,
        "dEQP-GLES2.functional",
        ".uniform_api.random.95");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015245,
        "dEQP-GLES2.functional",
        ".uniform_api.random.96");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015246,
        "dEQP-GLES2.functional",
        ".uniform_api.random.97");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015247,
        "dEQP-GLES2.functional",
        ".uniform_api.random.98");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015248,
        "dEQP-GLES2.functional",
        ".uniform_api.random.99");
