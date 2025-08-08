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
#include "../ActsDeqpgles30037TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036191,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.0");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036192,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.1");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036193,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.2");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036194,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.3");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036195,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.4");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036196,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.5");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036197,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.6");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036198,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.7");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036199,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.8");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036200,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.9");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036201,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.10");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036202,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.11");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036203,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.12");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036204,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.13");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036205,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.14");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036206,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.15");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036207,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.16");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036208,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.17");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036209,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.18");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036210,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.19");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036211,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.20");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036212,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.21");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036213,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.22");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036214,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.23");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036215,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.24");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036216,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.25");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036217,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.26");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036218,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.27");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036219,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.28");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036220,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.29");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036221,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.30");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036222,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.31");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036223,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.32");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036224,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.33");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036225,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.34");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036226,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.35");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036227,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.36");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036228,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.37");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036229,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.38");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036230,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.39");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036231,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.40");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036232,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.41");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036233,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.42");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036234,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.43");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036235,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.44");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036236,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.45");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036237,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.46");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036238,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.47");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036239,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.48");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036240,
        "dEQP-GLES3.functional.ubo.",
        "random.all_shared_buffer.49");
