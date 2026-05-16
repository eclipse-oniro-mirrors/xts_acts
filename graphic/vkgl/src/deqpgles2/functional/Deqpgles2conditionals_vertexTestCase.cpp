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

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009132,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.0");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009133,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.1");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009134,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.2");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009135,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.3");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009136,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.4");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009137,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.5");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009138,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.6");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009139,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.7");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009140,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.8");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009141,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.9");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009142,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.10");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009143,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.11");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009144,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.12");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009145,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.13");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009146,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.14");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009147,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.15");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009148,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.16");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009149,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.17");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009150,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.18");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009151,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.19");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009152,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.20");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009153,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.21");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009154,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.22");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009155,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.23");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009156,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.24");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009157,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.25");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009158,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.26");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009159,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.27");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009160,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.28");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009161,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.29");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009162,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.30");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009163,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.31");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009164,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.32");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009165,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.33");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009166,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.34");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009167,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.35");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009168,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.36");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009169,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.37");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009170,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.38");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009171,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.39");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009172,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.40");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009173,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.41");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009174,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.42");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009175,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.43");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009176,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.44");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009177,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.45");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009178,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.46");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009179,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.47");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009180,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.48");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009181,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.49");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009182,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.50");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009183,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.51");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009184,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.52");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009185,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.53");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009186,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.54");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009187,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.55");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009188,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.56");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009189,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.57");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009190,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.58");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009191,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.59");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009192,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.60");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009193,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.61");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009194,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.62");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009195,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.63");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009196,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.64");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009197,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.65");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009198,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.66");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009199,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.67");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009200,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.68");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009201,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.69");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009202,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.70");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009203,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.71");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009204,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.72");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009205,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.73");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009206,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.74");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009207,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.75");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009208,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.76");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009209,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.77");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009210,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.78");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009211,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.79");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009212,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.80");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009213,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.81");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009214,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.82");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009215,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.83");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009216,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.84");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009217,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.85");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009218,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.86");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009219,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.87");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009220,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.88");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009221,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.89");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009222,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.90");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009223,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.91");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009224,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.92");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009225,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.93");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009226,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.94");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009227,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.95");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009228,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.96");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009229,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.97");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009230,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.98");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009231,
        "dEQP-GLES2.functional.shaders",
        ".random.conditionals.vertex.99");
