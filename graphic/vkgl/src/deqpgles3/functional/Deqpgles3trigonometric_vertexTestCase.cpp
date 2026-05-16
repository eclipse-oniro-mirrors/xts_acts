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

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021094,
        "dEQP-GLES3.functional.shaders",
        ".random.trigonometric.vertex.0");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021095,
        "dEQP-GLES3.functional.shaders",
        ".random.trigonometric.vertex.1");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021096,
        "dEQP-GLES3.functional.shaders",
        ".random.trigonometric.vertex.2");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021097,
        "dEQP-GLES3.functional.shaders",
        ".random.trigonometric.vertex.3");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021098,
        "dEQP-GLES3.functional.shaders",
        ".random.trigonometric.vertex.4");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021099,
        "dEQP-GLES3.functional.shaders",
        ".random.trigonometric.vertex.5");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021100,
        "dEQP-GLES3.functional.shaders",
        ".random.trigonometric.vertex.6");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021101,
        "dEQP-GLES3.functional.shaders",
        ".random.trigonometric.vertex.7");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021102,
        "dEQP-GLES3.functional.shaders",
        ".random.trigonometric.vertex.8");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021103,
        "dEQP-GLES3.functional.shaders",
        ".random.trigonometric.vertex.9");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021104,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.10");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021105,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.12");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021106,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.13");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021107,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.14");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021108,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.16");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021109,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.17");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021110,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.18");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021111,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.19");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021112,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.20");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021113,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.21");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021114,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.22");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021115,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.23");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021116,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.24");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021117,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.25");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021118,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.26");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021119,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.27");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021120,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.28");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021121,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.29");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021122,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.30");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021123,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.31");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021124,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.32");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021125,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.33");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021126,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.34");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021127,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.35");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021128,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.36");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021129,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.37");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021130,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.38");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021131,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.39");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021132,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.40");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021133,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.41");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021134,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.42");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021135,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.43");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021136,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.44");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021137,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.45");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021138,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.46");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021139,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.47");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021140,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.48");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021141,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.50");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021142,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.51");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021143,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.52");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021144,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.53");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021145,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.54");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021146,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.55");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021147,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.56");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021148,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.57");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021149,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.58");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021150,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.59");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021151,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.60");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021152,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.61");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021153,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.62");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021154,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.63");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021155,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.64");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021156,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.65");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021157,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.66");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021158,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.67");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021159,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.68");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021160,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.69");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021161,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.70");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021162,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.71");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021163,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.72");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021164,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.73");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021165,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.74");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021166,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.75");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021167,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.76");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021168,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.77");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021169,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.78");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021170,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.79");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021171,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.80");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021172,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.81");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021173,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.82");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021174,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.83");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021175,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.84");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021176,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.85");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021177,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.86");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021178,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.87");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021179,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.88");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021180,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.90");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021181,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.91");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021182,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.92");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021183,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.93");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021184,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.95");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021185,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.96");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021186,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.97");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021187,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.98");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021188,
        "dEQP-GLES3.functional.shaders.",
        "random.trigonometric.vertex.99");
