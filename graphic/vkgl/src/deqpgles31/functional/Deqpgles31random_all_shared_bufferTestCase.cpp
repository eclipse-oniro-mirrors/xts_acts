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
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310011TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010289,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.random.all_shared_buffer.0");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010290,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.random.all_shared_buffer.1");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010291,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.random.all_shared_buffer.2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010292,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.random.all_shared_buffer.3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010293,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.random.all_shared_buffer.4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010294,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.random.all_shared_buffer.5");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010295,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.random.all_shared_buffer.6");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010296,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.random.all_shared_buffer.7");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010297,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.random.all_shared_buffer.8");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010298,
        "dEQP-GLES31.functional.ssbo.la",
        "yout.random.all_shared_buffer.9");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010299,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.random.all_shared_buffer.10");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010300,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.random.all_shared_buffer.11");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010301,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.random.all_shared_buffer.12");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010302,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.random.all_shared_buffer.13");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010303,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.random.all_shared_buffer.14");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010304,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.random.all_shared_buffer.15");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010305,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.random.all_shared_buffer.16");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010306,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.random.all_shared_buffer.17");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010307,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.random.all_shared_buffer.18");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010308,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.random.all_shared_buffer.19");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010309,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.random.all_shared_buffer.20");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010310,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.random.all_shared_buffer.21");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010311,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.random.all_shared_buffer.22");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010312,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.random.all_shared_buffer.23");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010313,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.random.all_shared_buffer.24");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010314,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.random.all_shared_buffer.25");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010315,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.random.all_shared_buffer.26");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010316,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.random.all_shared_buffer.27");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010317,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.random.all_shared_buffer.28");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010318,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.random.all_shared_buffer.29");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010319,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.random.all_shared_buffer.30");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010320,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.random.all_shared_buffer.31");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010321,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.random.all_shared_buffer.32");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010322,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.random.all_shared_buffer.33");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010323,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.random.all_shared_buffer.34");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010324,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.random.all_shared_buffer.35");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010325,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.random.all_shared_buffer.36");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010326,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.random.all_shared_buffer.37");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010327,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.random.all_shared_buffer.38");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010328,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.random.all_shared_buffer.39");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010329,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.random.all_shared_buffer.40");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010330,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.random.all_shared_buffer.41");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010331,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.random.all_shared_buffer.42");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010332,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.random.all_shared_buffer.43");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010333,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.random.all_shared_buffer.44");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010334,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.random.all_shared_buffer.45");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010335,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.random.all_shared_buffer.46");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010336,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.random.all_shared_buffer.47");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010337,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.random.all_shared_buffer.48");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010338,
        "dEQP-GLES31.functional.ssbo.lay",
        "out.random.all_shared_buffer.49");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011179,
        "dEQP-GLES31.functional.ubo",
        ".random.all_shared_buffer.0");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011180,
        "dEQP-GLES31.functional.ubo",
        ".random.all_shared_buffer.1");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011181,
        "dEQP-GLES31.functional.ubo",
        ".random.all_shared_buffer.2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011182,
        "dEQP-GLES31.functional.ubo",
        ".random.all_shared_buffer.3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011183,
        "dEQP-GLES31.functional.ubo",
        ".random.all_shared_buffer.4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011184,
        "dEQP-GLES31.functional.ubo",
        ".random.all_shared_buffer.5");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011185,
        "dEQP-GLES31.functional.ubo",
        ".random.all_shared_buffer.6");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011186,
        "dEQP-GLES31.functional.ubo",
        ".random.all_shared_buffer.7");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011187,
        "dEQP-GLES31.functional.ubo",
        ".random.all_shared_buffer.8");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011188,
        "dEQP-GLES31.functional.ubo",
        ".random.all_shared_buffer.9");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011189,
        "dEQP-GLES31.functional.ubo.",
        "random.all_shared_buffer.10");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011190,
        "dEQP-GLES31.functional.ubo.",
        "random.all_shared_buffer.11");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011191,
        "dEQP-GLES31.functional.ubo.",
        "random.all_shared_buffer.12");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011192,
        "dEQP-GLES31.functional.ubo.",
        "random.all_shared_buffer.13");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011193,
        "dEQP-GLES31.functional.ubo.",
        "random.all_shared_buffer.14");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011194,
        "dEQP-GLES31.functional.ubo.",
        "random.all_shared_buffer.15");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011195,
        "dEQP-GLES31.functional.ubo.",
        "random.all_shared_buffer.16");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011196,
        "dEQP-GLES31.functional.ubo.",
        "random.all_shared_buffer.17");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011197,
        "dEQP-GLES31.functional.ubo.",
        "random.all_shared_buffer.18");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011198,
        "dEQP-GLES31.functional.ubo.",
        "random.all_shared_buffer.19");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011199,
        "dEQP-GLES31.functional.ubo.",
        "random.all_shared_buffer.20");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011200,
        "dEQP-GLES31.functional.ubo.",
        "random.all_shared_buffer.21");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011201,
        "dEQP-GLES31.functional.ubo.",
        "random.all_shared_buffer.22");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011202,
        "dEQP-GLES31.functional.ubo.",
        "random.all_shared_buffer.23");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011203,
        "dEQP-GLES31.functional.ubo.",
        "random.all_shared_buffer.24");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011204,
        "dEQP-GLES31.functional.ubo.",
        "random.all_shared_buffer.25");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011205,
        "dEQP-GLES31.functional.ubo.",
        "random.all_shared_buffer.26");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011206,
        "dEQP-GLES31.functional.ubo.",
        "random.all_shared_buffer.27");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011207,
        "dEQP-GLES31.functional.ubo.",
        "random.all_shared_buffer.28");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011208,
        "dEQP-GLES31.functional.ubo.",
        "random.all_shared_buffer.29");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011209,
        "dEQP-GLES31.functional.ubo.",
        "random.all_shared_buffer.30");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011210,
        "dEQP-GLES31.functional.ubo.",
        "random.all_shared_buffer.31");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011211,
        "dEQP-GLES31.functional.ubo.",
        "random.all_shared_buffer.32");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011212,
        "dEQP-GLES31.functional.ubo.",
        "random.all_shared_buffer.33");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011213,
        "dEQP-GLES31.functional.ubo.",
        "random.all_shared_buffer.34");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011214,
        "dEQP-GLES31.functional.ubo.",
        "random.all_shared_buffer.35");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011215,
        "dEQP-GLES31.functional.ubo.",
        "random.all_shared_buffer.36");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011216,
        "dEQP-GLES31.functional.ubo.",
        "random.all_shared_buffer.37");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011217,
        "dEQP-GLES31.functional.ubo.",
        "random.all_shared_buffer.38");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011218,
        "dEQP-GLES31.functional.ubo.",
        "random.all_shared_buffer.39");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011219,
        "dEQP-GLES31.functional.ubo.",
        "random.all_shared_buffer.40");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011220,
        "dEQP-GLES31.functional.ubo.",
        "random.all_shared_buffer.41");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011221,
        "dEQP-GLES31.functional.ubo.",
        "random.all_shared_buffer.42");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011222,
        "dEQP-GLES31.functional.ubo.",
        "random.all_shared_buffer.43");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011223,
        "dEQP-GLES31.functional.ubo.",
        "random.all_shared_buffer.44");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011224,
        "dEQP-GLES31.functional.ubo.",
        "random.all_shared_buffer.45");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011225,
        "dEQP-GLES31.functional.ubo.",
        "random.all_shared_buffer.46");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011226,
        "dEQP-GLES31.functional.ubo.",
        "random.all_shared_buffer.47");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011227,
        "dEQP-GLES31.functional.ubo.",
        "random.all_shared_buffer.48");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011228,
        "dEQP-GLES31.functional.ubo.",
        "random.all_shared_buffer.49");
