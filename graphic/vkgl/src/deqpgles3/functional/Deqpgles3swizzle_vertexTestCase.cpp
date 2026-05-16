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

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020594,
        "dEQP-GLES3.functional.shad",
        "ers.random.swizzle.vertex.0");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020595,
        "dEQP-GLES3.functional.shad",
        "ers.random.swizzle.vertex.1");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020596,
        "dEQP-GLES3.functional.shad",
        "ers.random.swizzle.vertex.2");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020597,
        "dEQP-GLES3.functional.shad",
        "ers.random.swizzle.vertex.3");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020598,
        "dEQP-GLES3.functional.shad",
        "ers.random.swizzle.vertex.4");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020599,
        "dEQP-GLES3.functional.shad",
        "ers.random.swizzle.vertex.5");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020600,
        "dEQP-GLES3.functional.shad",
        "ers.random.swizzle.vertex.6");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020601,
        "dEQP-GLES3.functional.shad",
        "ers.random.swizzle.vertex.7");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020602,
        "dEQP-GLES3.functional.shad",
        "ers.random.swizzle.vertex.8");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020603,
        "dEQP-GLES3.functional.shad",
        "ers.random.swizzle.vertex.9");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020604,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.vertex.10");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020605,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.vertex.11");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020606,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.vertex.12");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020607,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.vertex.13");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020608,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.vertex.14");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020609,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.vertex.15");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020610,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.vertex.16");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020611,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.vertex.17");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020612,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.vertex.18");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020613,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.vertex.19");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020614,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.vertex.20");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020615,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.vertex.21");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020616,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.vertex.22");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020617,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.vertex.23");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020618,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.vertex.24");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020619,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.vertex.25");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020620,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.vertex.26");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020621,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.vertex.27");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020622,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.vertex.28");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020623,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.vertex.29");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020624,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.vertex.30");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020625,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.vertex.31");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020626,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.vertex.32");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020627,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.vertex.33");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020628,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.vertex.34");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020629,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.vertex.35");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020630,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.vertex.36");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020631,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.vertex.37");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020632,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.vertex.38");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020633,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.vertex.39");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020634,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.vertex.40");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020635,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.vertex.41");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020636,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.vertex.42");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020637,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.vertex.43");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020638,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.vertex.44");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020639,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.vertex.45");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020640,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.vertex.46");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020641,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.vertex.47");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020642,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.vertex.48");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020643,
        "dEQP-GLES3.functional.shade",
        "rs.random.swizzle.vertex.49");
