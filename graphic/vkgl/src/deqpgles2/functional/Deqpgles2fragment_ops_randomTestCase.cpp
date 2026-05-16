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
#include "../ActsDeqpgles20013TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012212,
        "dEQP-GLES2.functional",
        ".fragment_ops.random.0");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012213,
        "dEQP-GLES2.functional",
        ".fragment_ops.random.1");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012214,
        "dEQP-GLES2.functional",
        ".fragment_ops.random.2");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012215,
        "dEQP-GLES2.functional",
        ".fragment_ops.random.3");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012216,
        "dEQP-GLES2.functional",
        ".fragment_ops.random.4");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012217,
        "dEQP-GLES2.functional",
        ".fragment_ops.random.5");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012218,
        "dEQP-GLES2.functional",
        ".fragment_ops.random.6");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012219,
        "dEQP-GLES2.functional",
        ".fragment_ops.random.7");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012220,
        "dEQP-GLES2.functional",
        ".fragment_ops.random.8");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012221,
        "dEQP-GLES2.functional",
        ".fragment_ops.random.9");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012222,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.10");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012223,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.11");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012224,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.12");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012225,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.13");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012226,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.14");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012227,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.15");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012228,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.16");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012229,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.17");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012230,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.18");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012231,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.19");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012232,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.20");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012233,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.21");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012234,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.22");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012235,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.23");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012236,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.24");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012237,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.25");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012238,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.26");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012239,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.27");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012240,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.28");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012241,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.29");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012242,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.30");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012243,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.31");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012244,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.32");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012245,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.33");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012246,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.34");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012247,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.35");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012248,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.36");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012249,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.37");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012250,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.38");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012251,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.39");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012252,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.40");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012253,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.41");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012254,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.42");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012255,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.43");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012256,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.44");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012257,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.45");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012258,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.46");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012259,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.47");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012260,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.48");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012261,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.49");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012262,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.50");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012263,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.51");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012264,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.52");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012265,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.53");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012266,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.54");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012267,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.55");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012268,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.56");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012269,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.57");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012270,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.58");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012271,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.59");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012272,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.60");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012273,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.61");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012274,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.62");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012275,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.63");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012276,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.64");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012277,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.65");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012278,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.66");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012279,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.67");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012280,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.68");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012281,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.69");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012282,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.70");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012283,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.71");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012284,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.72");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012285,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.73");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012286,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.74");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012287,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.75");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012288,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.76");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012289,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.77");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012290,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.78");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012291,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.79");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012292,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.80");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012293,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.81");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012294,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.82");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012295,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.83");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012296,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.84");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012297,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.85");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012298,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.86");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012299,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.87");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012300,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.88");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012301,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.89");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012302,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.90");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012303,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.91");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012304,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.92");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012305,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.93");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012306,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.94");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012307,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.95");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012308,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.96");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012309,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.97");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012310,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.98");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012311,
        "dEQP-GLES2.functional.",
        "fragment_ops.random.99");
