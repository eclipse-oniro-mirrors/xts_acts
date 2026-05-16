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
#include "../ActsDeqpgles30045TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044094,
        "dEQP-GLES3.functi",
        "onal.draw.random.0");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044095,
        "dEQP-GLES3.functi",
        "onal.draw.random.2");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044096,
        "dEQP-GLES3.functi",
        "onal.draw.random.5");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044097,
        "dEQP-GLES3.functi",
        "onal.draw.random.7");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044098,
        "dEQP-GLES3.functi",
        "onal.draw.random.9");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044099,
        "dEQP-GLES3.functio",
        "nal.draw.random.11");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044100,
        "dEQP-GLES3.functio",
        "nal.draw.random.12");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044101,
        "dEQP-GLES3.functio",
        "nal.draw.random.14");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044102,
        "dEQP-GLES3.functio",
        "nal.draw.random.15");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044103,
        "dEQP-GLES3.functio",
        "nal.draw.random.16");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044104,
        "dEQP-GLES3.functio",
        "nal.draw.random.17");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044105,
        "dEQP-GLES3.functio",
        "nal.draw.random.18");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044106,
        "dEQP-GLES3.functio",
        "nal.draw.random.19");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044107,
        "dEQP-GLES3.functio",
        "nal.draw.random.20");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044108,
        "dEQP-GLES3.functio",
        "nal.draw.random.21");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044109,
        "dEQP-GLES3.functio",
        "nal.draw.random.23");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044110,
        "dEQP-GLES3.functio",
        "nal.draw.random.25");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044111,
        "dEQP-GLES3.functio",
        "nal.draw.random.27");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044112,
        "dEQP-GLES3.functio",
        "nal.draw.random.29");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044113,
        "dEQP-GLES3.functio",
        "nal.draw.random.30");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044114,
        "dEQP-GLES3.functio",
        "nal.draw.random.31");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044115,
        "dEQP-GLES3.functio",
        "nal.draw.random.32");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044116,
        "dEQP-GLES3.functio",
        "nal.draw.random.33");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044117,
        "dEQP-GLES3.functio",
        "nal.draw.random.36");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044118,
        "dEQP-GLES3.functio",
        "nal.draw.random.37");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044119,
        "dEQP-GLES3.functio",
        "nal.draw.random.38");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044120,
        "dEQP-GLES3.functio",
        "nal.draw.random.39");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044121,
        "dEQP-GLES3.functio",
        "nal.draw.random.40");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044122,
        "dEQP-GLES3.functio",
        "nal.draw.random.41");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044123,
        "dEQP-GLES3.functio",
        "nal.draw.random.42");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044124,
        "dEQP-GLES3.functio",
        "nal.draw.random.43");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044125,
        "dEQP-GLES3.functio",
        "nal.draw.random.44");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044126,
        "dEQP-GLES3.functio",
        "nal.draw.random.45");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044127,
        "dEQP-GLES3.functio",
        "nal.draw.random.48");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044128,
        "dEQP-GLES3.functio",
        "nal.draw.random.49");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044129,
        "dEQP-GLES3.functio",
        "nal.draw.random.50");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044130,
        "dEQP-GLES3.functio",
        "nal.draw.random.51");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044131,
        "dEQP-GLES3.functio",
        "nal.draw.random.52");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044132,
        "dEQP-GLES3.functio",
        "nal.draw.random.55");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044133,
        "dEQP-GLES3.functio",
        "nal.draw.random.56");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044134,
        "dEQP-GLES3.functio",
        "nal.draw.random.57");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044135,
        "dEQP-GLES3.functio",
        "nal.draw.random.58");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044136,
        "dEQP-GLES3.functio",
        "nal.draw.random.60");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044137,
        "dEQP-GLES3.functio",
        "nal.draw.random.61");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044138,
        "dEQP-GLES3.functio",
        "nal.draw.random.63");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044139,
        "dEQP-GLES3.functio",
        "nal.draw.random.68");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044140,
        "dEQP-GLES3.functio",
        "nal.draw.random.69");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044141,
        "dEQP-GLES3.functio",
        "nal.draw.random.70");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044142,
        "dEQP-GLES3.functio",
        "nal.draw.random.71");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044143,
        "dEQP-GLES3.functio",
        "nal.draw.random.72");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044144,
        "dEQP-GLES3.functio",
        "nal.draw.random.73");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044145,
        "dEQP-GLES3.functio",
        "nal.draw.random.74");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044146,
        "dEQP-GLES3.functio",
        "nal.draw.random.77");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044147,
        "dEQP-GLES3.functio",
        "nal.draw.random.78");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044148,
        "dEQP-GLES3.functio",
        "nal.draw.random.80");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044149,
        "dEQP-GLES3.functio",
        "nal.draw.random.81");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044150,
        "dEQP-GLES3.functio",
        "nal.draw.random.82");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044151,
        "dEQP-GLES3.functio",
        "nal.draw.random.83");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044152,
        "dEQP-GLES3.functio",
        "nal.draw.random.84");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044153,
        "dEQP-GLES3.functio",
        "nal.draw.random.85");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044154,
        "dEQP-GLES3.functio",
        "nal.draw.random.86");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044155,
        "dEQP-GLES3.functio",
        "nal.draw.random.87");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044156,
        "dEQP-GLES3.functio",
        "nal.draw.random.88");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044157,
        "dEQP-GLES3.functio",
        "nal.draw.random.89");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044158,
        "dEQP-GLES3.functio",
        "nal.draw.random.90");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044159,
        "dEQP-GLES3.functio",
        "nal.draw.random.91");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044160,
        "dEQP-GLES3.functio",
        "nal.draw.random.92");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044161,
        "dEQP-GLES3.functio",
        "nal.draw.random.93");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044162,
        "dEQP-GLES3.functio",
        "nal.draw.random.94");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044163,
        "dEQP-GLES3.functio",
        "nal.draw.random.95");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044164,
        "dEQP-GLES3.functio",
        "nal.draw.random.96");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044165,
        "dEQP-GLES3.functio",
        "nal.draw.random.97");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044166,
        "dEQP-GLES3.functio",
        "nal.draw.random.101");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044167,
        "dEQP-GLES3.functio",
        "nal.draw.random.103");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044168,
        "dEQP-GLES3.functio",
        "nal.draw.random.104");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044169,
        "dEQP-GLES3.functio",
        "nal.draw.random.105");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044170,
        "dEQP-GLES3.functio",
        "nal.draw.random.106");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044171,
        "dEQP-GLES3.functio",
        "nal.draw.random.107");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044172,
        "dEQP-GLES3.functio",
        "nal.draw.random.108");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044173,
        "dEQP-GLES3.functio",
        "nal.draw.random.109");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044174,
        "dEQP-GLES3.functio",
        "nal.draw.random.112");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044175,
        "dEQP-GLES3.functio",
        "nal.draw.random.113");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044176,
        "dEQP-GLES3.functio",
        "nal.draw.random.114");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044177,
        "dEQP-GLES3.functio",
        "nal.draw.random.115");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044178,
        "dEQP-GLES3.functio",
        "nal.draw.random.116");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044179,
        "dEQP-GLES3.functio",
        "nal.draw.random.117");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044180,
        "dEQP-GLES3.functio",
        "nal.draw.random.118");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044181,
        "dEQP-GLES3.functio",
        "nal.draw.random.119");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044182,
        "dEQP-GLES3.functio",
        "nal.draw.random.120");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044183,
        "dEQP-GLES3.functio",
        "nal.draw.random.124");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044184,
        "dEQP-GLES3.functio",
        "nal.draw.random.125");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044185,
        "dEQP-GLES3.functio",
        "nal.draw.random.126");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044186,
        "dEQP-GLES3.functio",
        "nal.draw.random.127");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044187,
        "dEQP-GLES3.functio",
        "nal.draw.random.129");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044188,
        "dEQP-GLES3.functio",
        "nal.draw.random.131");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044189,
        "dEQP-GLES3.functio",
        "nal.draw.random.132");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044190,
        "dEQP-GLES3.functio",
        "nal.draw.random.135");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044191,
        "dEQP-GLES3.functio",
        "nal.draw.random.136");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044192,
        "dEQP-GLES3.functio",
        "nal.draw.random.138");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044193,
        "dEQP-GLES3.functio",
        "nal.draw.random.140");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044194,
        "dEQP-GLES3.functio",
        "nal.draw.random.141");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044195,
        "dEQP-GLES3.functio",
        "nal.draw.random.142");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044196,
        "dEQP-GLES3.functio",
        "nal.draw.random.143");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044197,
        "dEQP-GLES3.functio",
        "nal.draw.random.144");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044198,
        "dEQP-GLES3.functio",
        "nal.draw.random.145");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044199,
        "dEQP-GLES3.functio",
        "nal.draw.random.146");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044200,
        "dEQP-GLES3.functio",
        "nal.draw.random.148");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044201,
        "dEQP-GLES3.functio",
        "nal.draw.random.149");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044202,
        "dEQP-GLES3.functio",
        "nal.draw.random.150");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044203,
        "dEQP-GLES3.functio",
        "nal.draw.random.151");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044204,
        "dEQP-GLES3.functio",
        "nal.draw.random.154");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044205,
        "dEQP-GLES3.functio",
        "nal.draw.random.155");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044206,
        "dEQP-GLES3.functio",
        "nal.draw.random.156");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044207,
        "dEQP-GLES3.functio",
        "nal.draw.random.158");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044208,
        "dEQP-GLES3.functio",
        "nal.draw.random.159");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044209,
        "dEQP-GLES3.functio",
        "nal.draw.random.161");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044210,
        "dEQP-GLES3.functio",
        "nal.draw.random.162");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044211,
        "dEQP-GLES3.functio",
        "nal.draw.random.164");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044212,
        "dEQP-GLES3.functio",
        "nal.draw.random.165");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044213,
        "dEQP-GLES3.functio",
        "nal.draw.random.166");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044214,
        "dEQP-GLES3.functio",
        "nal.draw.random.167");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044215,
        "dEQP-GLES3.functio",
        "nal.draw.random.169");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044216,
        "dEQP-GLES3.functio",
        "nal.draw.random.170");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044217,
        "dEQP-GLES3.functio",
        "nal.draw.random.171");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044218,
        "dEQP-GLES3.functio",
        "nal.draw.random.173");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044219,
        "dEQP-GLES3.functio",
        "nal.draw.random.174");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044220,
        "dEQP-GLES3.functio",
        "nal.draw.random.175");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044221,
        "dEQP-GLES3.functio",
        "nal.draw.random.177");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044222,
        "dEQP-GLES3.functio",
        "nal.draw.random.178");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044223,
        "dEQP-GLES3.functio",
        "nal.draw.random.179");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044224,
        "dEQP-GLES3.functio",
        "nal.draw.random.180");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044225,
        "dEQP-GLES3.functio",
        "nal.draw.random.181");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044226,
        "dEQP-GLES3.functio",
        "nal.draw.random.183");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044227,
        "dEQP-GLES3.functio",
        "nal.draw.random.184");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044228,
        "dEQP-GLES3.functio",
        "nal.draw.random.185");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044229,
        "dEQP-GLES3.functio",
        "nal.draw.random.186");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044230,
        "dEQP-GLES3.functio",
        "nal.draw.random.187");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044231,
        "dEQP-GLES3.functio",
        "nal.draw.random.188");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044232,
        "dEQP-GLES3.functio",
        "nal.draw.random.191");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044233,
        "dEQP-GLES3.functio",
        "nal.draw.random.192");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044234,
        "dEQP-GLES3.functio",
        "nal.draw.random.196");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044235,
        "dEQP-GLES3.functio",
        "nal.draw.random.197");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044236,
        "dEQP-GLES3.functio",
        "nal.draw.random.198");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044237,
        "dEQP-GLES3.functio",
        "nal.draw.random.200");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044238,
        "dEQP-GLES3.functio",
        "nal.draw.random.202");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044239,
        "dEQP-GLES3.functio",
        "nal.draw.random.204");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044240,
        "dEQP-GLES3.functio",
        "nal.draw.random.205");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044241,
        "dEQP-GLES3.functio",
        "nal.draw.random.206");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044242,
        "dEQP-GLES3.functio",
        "nal.draw.random.207");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044243,
        "dEQP-GLES3.functio",
        "nal.draw.random.208");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044244,
        "dEQP-GLES3.functio",
        "nal.draw.random.209");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044245,
        "dEQP-GLES3.functio",
        "nal.draw.random.210");
