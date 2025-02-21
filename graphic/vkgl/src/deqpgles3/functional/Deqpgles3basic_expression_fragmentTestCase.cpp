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

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020094,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.0");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020095,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.1");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020096,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.2");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020097,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.3");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020098,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.4");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020099,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.5");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020100,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.6");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020101,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.7");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020102,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.8");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020103,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.9");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020104,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.10");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020105,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.11");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020106,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.12");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020107,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.13");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020108,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.14");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020109,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.15");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020110,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.16");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020111,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.17");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020112,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.18");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020113,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.19");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020114,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.20");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020115,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.21");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020116,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.22");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020117,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.23");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020118,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.24");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020119,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.25");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020120,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.26");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020121,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.27");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020122,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.28");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020123,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.29");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020124,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.30");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020125,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.31");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020126,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.32");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020127,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.33");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020128,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.34");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020129,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.35");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020130,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.36");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020131,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.37");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020132,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.38");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020133,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.39");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020134,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.40");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020135,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.41");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020136,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.42");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020137,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.43");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020138,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.44");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020139,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.45");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020140,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.46");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020141,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.47");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020142,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.48");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020143,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.49");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020144,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.50");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020145,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.51");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020146,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.52");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020147,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.53");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020148,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.54");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020149,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.55");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020150,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.56");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020151,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.57");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020152,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.58");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020153,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.59");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020154,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.60");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020155,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.61");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020156,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.62");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020157,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.63");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020158,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.64");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020159,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.65");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020160,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.66");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020161,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.67");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020162,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.68");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020163,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.69");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020164,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.70");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020165,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.71");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020166,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.72");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020167,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.73");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020168,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.74");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020169,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.75");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020170,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.76");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020171,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.77");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020172,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.78");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020173,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.79");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020174,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.80");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020175,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.81");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020176,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.82");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020177,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.83");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020178,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.84");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020179,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.85");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020180,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.86");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020181,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.87");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020182,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.88");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020183,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.89");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020184,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.90");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020185,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.91");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020186,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.92");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020187,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.93");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020188,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.94");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020189,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.95");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020190,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.96");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020191,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.97");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020192,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.98");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020193,
        "dEQP-GLES3.functional.shaders.ra",
        "ndom.basic_expression.fragment.99");
