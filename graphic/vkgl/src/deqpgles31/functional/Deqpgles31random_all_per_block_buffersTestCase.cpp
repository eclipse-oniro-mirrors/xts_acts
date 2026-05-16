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

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010239,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.random.all_per_block_buffers.0");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010240,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.random.all_per_block_buffers.1");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010241,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.random.all_per_block_buffers.2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010242,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.random.all_per_block_buffers.3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010243,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.random.all_per_block_buffers.4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010244,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.random.all_per_block_buffers.5");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010245,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.random.all_per_block_buffers.6");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010246,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.random.all_per_block_buffers.7");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010247,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.random.all_per_block_buffers.8");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010248,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.random.all_per_block_buffers.9");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010249,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.random.all_per_block_buffers.10");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010250,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.random.all_per_block_buffers.11");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010251,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.random.all_per_block_buffers.12");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010252,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.random.all_per_block_buffers.13");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010253,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.random.all_per_block_buffers.14");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010254,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.random.all_per_block_buffers.15");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010255,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.random.all_per_block_buffers.16");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010256,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.random.all_per_block_buffers.17");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010257,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.random.all_per_block_buffers.18");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010258,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.random.all_per_block_buffers.19");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010259,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.random.all_per_block_buffers.20");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010260,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.random.all_per_block_buffers.21");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010261,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.random.all_per_block_buffers.22");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010262,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.random.all_per_block_buffers.23");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010263,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.random.all_per_block_buffers.24");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010264,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.random.all_per_block_buffers.25");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010265,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.random.all_per_block_buffers.26");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010266,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.random.all_per_block_buffers.27");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010267,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.random.all_per_block_buffers.28");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010268,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.random.all_per_block_buffers.29");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010269,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.random.all_per_block_buffers.30");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010270,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.random.all_per_block_buffers.31");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010271,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.random.all_per_block_buffers.32");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010272,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.random.all_per_block_buffers.33");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010273,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.random.all_per_block_buffers.34");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010274,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.random.all_per_block_buffers.35");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010275,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.random.all_per_block_buffers.36");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010276,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.random.all_per_block_buffers.37");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010277,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.random.all_per_block_buffers.38");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010278,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.random.all_per_block_buffers.39");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010279,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.random.all_per_block_buffers.40");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010280,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.random.all_per_block_buffers.41");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010281,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.random.all_per_block_buffers.42");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010282,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.random.all_per_block_buffers.43");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010283,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.random.all_per_block_buffers.44");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010284,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.random.all_per_block_buffers.45");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010285,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.random.all_per_block_buffers.46");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010286,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.random.all_per_block_buffers.47");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010287,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.random.all_per_block_buffers.48");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010288,
        "dEQP-GLES31.functional.ssbo.layou",
        "t.random.all_per_block_buffers.49");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011130,
        "dEQP-GLES31.functional.ubo.r",
        "andom.all_per_block_buffers.0");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011131,
        "dEQP-GLES31.functional.ubo.r",
        "andom.all_per_block_buffers.1");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011132,
        "dEQP-GLES31.functional.ubo.r",
        "andom.all_per_block_buffers.2");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011133,
        "dEQP-GLES31.functional.ubo.r",
        "andom.all_per_block_buffers.3");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011134,
        "dEQP-GLES31.functional.ubo.r",
        "andom.all_per_block_buffers.4");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011135,
        "dEQP-GLES31.functional.ubo.r",
        "andom.all_per_block_buffers.5");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011136,
        "dEQP-GLES31.functional.ubo.r",
        "andom.all_per_block_buffers.6");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011137,
        "dEQP-GLES31.functional.ubo.r",
        "andom.all_per_block_buffers.7");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011138,
        "dEQP-GLES31.functional.ubo.r",
        "andom.all_per_block_buffers.8");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011139,
        "dEQP-GLES31.functional.ubo.r",
        "andom.all_per_block_buffers.9");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011140,
        "dEQP-GLES31.functional.ubo.ra",
        "ndom.all_per_block_buffers.10");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011141,
        "dEQP-GLES31.functional.ubo.ra",
        "ndom.all_per_block_buffers.11");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011142,
        "dEQP-GLES31.functional.ubo.ra",
        "ndom.all_per_block_buffers.12");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011143,
        "dEQP-GLES31.functional.ubo.ra",
        "ndom.all_per_block_buffers.13");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011144,
        "dEQP-GLES31.functional.ubo.ra",
        "ndom.all_per_block_buffers.14");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011145,
        "dEQP-GLES31.functional.ubo.ra",
        "ndom.all_per_block_buffers.15");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011146,
        "dEQP-GLES31.functional.ubo.ra",
        "ndom.all_per_block_buffers.16");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011147,
        "dEQP-GLES31.functional.ubo.ra",
        "ndom.all_per_block_buffers.17");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011148,
        "dEQP-GLES31.functional.ubo.ra",
        "ndom.all_per_block_buffers.18");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011149,
        "dEQP-GLES31.functional.ubo.ra",
        "ndom.all_per_block_buffers.19");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011150,
        "dEQP-GLES31.functional.ubo.ra",
        "ndom.all_per_block_buffers.20");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011151,
        "dEQP-GLES31.functional.ubo.ra",
        "ndom.all_per_block_buffers.21");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011152,
        "dEQP-GLES31.functional.ubo.ra",
        "ndom.all_per_block_buffers.22");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011153,
        "dEQP-GLES31.functional.ubo.ra",
        "ndom.all_per_block_buffers.23");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011154,
        "dEQP-GLES31.functional.ubo.ra",
        "ndom.all_per_block_buffers.24");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011155,
        "dEQP-GLES31.functional.ubo.ra",
        "ndom.all_per_block_buffers.25");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011156,
        "dEQP-GLES31.functional.ubo.ra",
        "ndom.all_per_block_buffers.26");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011157,
        "dEQP-GLES31.functional.ubo.ra",
        "ndom.all_per_block_buffers.27");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011158,
        "dEQP-GLES31.functional.ubo.ra",
        "ndom.all_per_block_buffers.28");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011159,
        "dEQP-GLES31.functional.ubo.ra",
        "ndom.all_per_block_buffers.29");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011160,
        "dEQP-GLES31.functional.ubo.ra",
        "ndom.all_per_block_buffers.30");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011161,
        "dEQP-GLES31.functional.ubo.ra",
        "ndom.all_per_block_buffers.31");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011162,
        "dEQP-GLES31.functional.ubo.ra",
        "ndom.all_per_block_buffers.32");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011163,
        "dEQP-GLES31.functional.ubo.ra",
        "ndom.all_per_block_buffers.33");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011164,
        "dEQP-GLES31.functional.ubo.ra",
        "ndom.all_per_block_buffers.34");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011165,
        "dEQP-GLES31.functional.ubo.ra",
        "ndom.all_per_block_buffers.35");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011166,
        "dEQP-GLES31.functional.ubo.ra",
        "ndom.all_per_block_buffers.36");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011167,
        "dEQP-GLES31.functional.ubo.ra",
        "ndom.all_per_block_buffers.37");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011168,
        "dEQP-GLES31.functional.ubo.ra",
        "ndom.all_per_block_buffers.38");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011169,
        "dEQP-GLES31.functional.ubo.ra",
        "ndom.all_per_block_buffers.39");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011170,
        "dEQP-GLES31.functional.ubo.ra",
        "ndom.all_per_block_buffers.40");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011171,
        "dEQP-GLES31.functional.ubo.ra",
        "ndom.all_per_block_buffers.42");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011172,
        "dEQP-GLES31.functional.ubo.ra",
        "ndom.all_per_block_buffers.43");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011173,
        "dEQP-GLES31.functional.ubo.ra",
        "ndom.all_per_block_buffers.44");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011174,
        "dEQP-GLES31.functional.ubo.ra",
        "ndom.all_per_block_buffers.45");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011175,
        "dEQP-GLES31.functional.ubo.ra",
        "ndom.all_per_block_buffers.46");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011176,
        "dEQP-GLES31.functional.ubo.ra",
        "ndom.all_per_block_buffers.47");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011177,
        "dEQP-GLES31.functional.ubo.ra",
        "ndom.all_per_block_buffers.48");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_011178,
        "dEQP-GLES31.functional.ubo.ra",
        "ndom.all_per_block_buffers.49");
