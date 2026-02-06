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
#include "../ActsDeqpgles30040TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039560,
        "dEQP-GLES3.functional",
        ".fragment_out.random.0");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039561,
        "dEQP-GLES3.functional",
        ".fragment_out.random.1");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039562,
        "dEQP-GLES3.functional",
        ".fragment_out.random.2");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039563,
        "dEQP-GLES3.functional",
        ".fragment_out.random.3");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039564,
        "dEQP-GLES3.functional",
        ".fragment_out.random.4");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039565,
        "dEQP-GLES3.functional",
        ".fragment_out.random.5");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039566,
        "dEQP-GLES3.functional",
        ".fragment_out.random.6");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039567,
        "dEQP-GLES3.functional",
        ".fragment_out.random.7");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039568,
        "dEQP-GLES3.functional",
        ".fragment_out.random.8");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039569,
        "dEQP-GLES3.functional",
        ".fragment_out.random.9");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039570,
        "dEQP-GLES3.functional.",
        "fragment_out.random.10");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039571,
        "dEQP-GLES3.functional.",
        "fragment_out.random.11");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039572,
        "dEQP-GLES3.functional.",
        "fragment_out.random.12");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039573,
        "dEQP-GLES3.functional.",
        "fragment_out.random.13");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039574,
        "dEQP-GLES3.functional.",
        "fragment_out.random.14");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039575,
        "dEQP-GLES3.functional.",
        "fragment_out.random.15");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039576,
        "dEQP-GLES3.functional.",
        "fragment_out.random.16");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039577,
        "dEQP-GLES3.functional.",
        "fragment_out.random.17");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039578,
        "dEQP-GLES3.functional.",
        "fragment_out.random.18");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039579,
        "dEQP-GLES3.functional.",
        "fragment_out.random.19");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039580,
        "dEQP-GLES3.functional.",
        "fragment_out.random.20");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039581,
        "dEQP-GLES3.functional.",
        "fragment_out.random.21");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039582,
        "dEQP-GLES3.functional.",
        "fragment_out.random.22");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039583,
        "dEQP-GLES3.functional.",
        "fragment_out.random.23");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039584,
        "dEQP-GLES3.functional.",
        "fragment_out.random.24");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039585,
        "dEQP-GLES3.functional.",
        "fragment_out.random.25");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039586,
        "dEQP-GLES3.functional.",
        "fragment_out.random.26");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039587,
        "dEQP-GLES3.functional.",
        "fragment_out.random.27");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039588,
        "dEQP-GLES3.functional.",
        "fragment_out.random.28");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039589,
        "dEQP-GLES3.functional.",
        "fragment_out.random.29");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039590,
        "dEQP-GLES3.functional.",
        "fragment_out.random.30");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039591,
        "dEQP-GLES3.functional.",
        "fragment_out.random.31");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039592,
        "dEQP-GLES3.functional.",
        "fragment_out.random.32");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039593,
        "dEQP-GLES3.functional.",
        "fragment_out.random.33");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039594,
        "dEQP-GLES3.functional.",
        "fragment_out.random.34");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039595,
        "dEQP-GLES3.functional.",
        "fragment_out.random.35");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039596,
        "dEQP-GLES3.functional.",
        "fragment_out.random.36");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039597,
        "dEQP-GLES3.functional.",
        "fragment_out.random.37");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039598,
        "dEQP-GLES3.functional.",
        "fragment_out.random.38");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039599,
        "dEQP-GLES3.functional.",
        "fragment_out.random.39");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039600,
        "dEQP-GLES3.functional.",
        "fragment_out.random.40");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039601,
        "dEQP-GLES3.functional.",
        "fragment_out.random.41");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039602,
        "dEQP-GLES3.functional.",
        "fragment_out.random.42");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039603,
        "dEQP-GLES3.functional.",
        "fragment_out.random.43");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039604,
        "dEQP-GLES3.functional.",
        "fragment_out.random.44");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039605,
        "dEQP-GLES3.functional.",
        "fragment_out.random.45");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039606,
        "dEQP-GLES3.functional.",
        "fragment_out.random.46");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039607,
        "dEQP-GLES3.functional.",
        "fragment_out.random.47");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039608,
        "dEQP-GLES3.functional.",
        "fragment_out.random.48");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039609,
        "dEQP-GLES3.functional.",
        "fragment_out.random.49");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039610,
        "dEQP-GLES3.functional.",
        "fragment_out.random.50");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039611,
        "dEQP-GLES3.functional.",
        "fragment_out.random.51");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039612,
        "dEQP-GLES3.functional.",
        "fragment_out.random.52");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039613,
        "dEQP-GLES3.functional.",
        "fragment_out.random.53");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039614,
        "dEQP-GLES3.functional.",
        "fragment_out.random.54");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039615,
        "dEQP-GLES3.functional.",
        "fragment_out.random.55");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039616,
        "dEQP-GLES3.functional.",
        "fragment_out.random.56");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039617,
        "dEQP-GLES3.functional.",
        "fragment_out.random.57");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039618,
        "dEQP-GLES3.functional.",
        "fragment_out.random.58");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039619,
        "dEQP-GLES3.functional.",
        "fragment_out.random.59");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039620,
        "dEQP-GLES3.functional.",
        "fragment_out.random.60");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039621,
        "dEQP-GLES3.functional.",
        "fragment_out.random.61");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039622,
        "dEQP-GLES3.functional.",
        "fragment_out.random.62");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039623,
        "dEQP-GLES3.functional.",
        "fragment_out.random.63");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039624,
        "dEQP-GLES3.functional.",
        "fragment_out.random.64");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039625,
        "dEQP-GLES3.functional.",
        "fragment_out.random.65");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039626,
        "dEQP-GLES3.functional.",
        "fragment_out.random.66");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039627,
        "dEQP-GLES3.functional.",
        "fragment_out.random.67");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039628,
        "dEQP-GLES3.functional.",
        "fragment_out.random.68");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039629,
        "dEQP-GLES3.functional.",
        "fragment_out.random.69");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039630,
        "dEQP-GLES3.functional.",
        "fragment_out.random.70");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039631,
        "dEQP-GLES3.functional.",
        "fragment_out.random.71");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039632,
        "dEQP-GLES3.functional.",
        "fragment_out.random.72");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039633,
        "dEQP-GLES3.functional.",
        "fragment_out.random.73");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039634,
        "dEQP-GLES3.functional.",
        "fragment_out.random.74");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039635,
        "dEQP-GLES3.functional.",
        "fragment_out.random.75");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039636,
        "dEQP-GLES3.functional.",
        "fragment_out.random.76");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039637,
        "dEQP-GLES3.functional.",
        "fragment_out.random.77");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039638,
        "dEQP-GLES3.functional.",
        "fragment_out.random.78");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039639,
        "dEQP-GLES3.functional.",
        "fragment_out.random.79");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039640,
        "dEQP-GLES3.functional.",
        "fragment_out.random.80");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039641,
        "dEQP-GLES3.functional.",
        "fragment_out.random.81");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039642,
        "dEQP-GLES3.functional.",
        "fragment_out.random.82");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039643,
        "dEQP-GLES3.functional.",
        "fragment_out.random.83");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039644,
        "dEQP-GLES3.functional.",
        "fragment_out.random.84");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039645,
        "dEQP-GLES3.functional.",
        "fragment_out.random.85");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039646,
        "dEQP-GLES3.functional.",
        "fragment_out.random.86");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039647,
        "dEQP-GLES3.functional.",
        "fragment_out.random.87");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039648,
        "dEQP-GLES3.functional.",
        "fragment_out.random.88");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039649,
        "dEQP-GLES3.functional.",
        "fragment_out.random.89");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039650,
        "dEQP-GLES3.functional.",
        "fragment_out.random.90");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039651,
        "dEQP-GLES3.functional.",
        "fragment_out.random.91");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039652,
        "dEQP-GLES3.functional.",
        "fragment_out.random.92");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039653,
        "dEQP-GLES3.functional.",
        "fragment_out.random.93");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039654,
        "dEQP-GLES3.functional.",
        "fragment_out.random.94");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039655,
        "dEQP-GLES3.functional.",
        "fragment_out.random.95");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039656,
        "dEQP-GLES3.functional.",
        "fragment_out.random.96");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039657,
        "dEQP-GLES3.functional.",
        "fragment_out.random.97");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039658,
        "dEQP-GLES3.functional.",
        "fragment_out.random.98");

static SHRINK_HWTEST_F(ActsDeqpgles30040TestSuite, TestCase_039659,
        "dEQP-GLES3.functional.",
        "fragment_out.random.99");
