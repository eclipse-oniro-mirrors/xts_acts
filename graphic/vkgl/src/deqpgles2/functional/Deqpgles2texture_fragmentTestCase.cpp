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

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009882,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.fragment.0");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009883,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.fragment.1");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009884,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.fragment.2");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009885,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.fragment.3");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009886,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.fragment.4");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009887,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.fragment.5");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009888,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.fragment.6");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009889,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.fragment.7");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009890,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.fragment.8");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009891,
        "dEQP-GLES2.functional.shade",
        "rs.random.texture.fragment.9");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009892,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.10");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009893,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.11");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009894,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.12");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009895,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.13");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009896,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.14");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009897,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.15");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009898,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.16");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009899,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.17");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009900,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.18");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009901,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.19");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009902,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.20");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009903,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.21");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009904,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.22");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009905,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.23");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009906,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.24");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009907,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.25");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009908,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.26");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009909,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.27");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009910,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.28");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009911,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.29");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009912,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.30");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009913,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.31");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009914,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.32");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009915,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.33");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009916,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.34");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009917,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.35");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009918,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.36");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009919,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.37");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009920,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.38");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009921,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.39");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009922,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.40");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009923,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.41");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009924,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.42");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009925,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.43");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009926,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.44");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009927,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.45");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009928,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.46");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009929,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.47");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009930,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.48");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009931,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.49");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009932,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.50");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009933,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.51");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009934,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.52");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009935,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.53");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009936,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.54");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009937,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.55");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009938,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.56");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009939,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.57");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009940,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.58");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009941,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.59");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009942,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.60");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009943,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.61");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009944,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.62");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009945,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.63");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009946,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.64");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009947,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.65");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009948,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.66");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009949,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.67");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009950,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.68");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009951,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.69");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009952,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.70");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009953,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.71");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009954,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.72");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009955,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.73");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009956,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.74");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009957,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.75");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009958,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.76");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009959,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.77");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009960,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.78");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009961,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.79");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009962,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.80");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009963,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.81");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009964,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.82");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009965,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.83");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009966,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.84");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009967,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.85");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009968,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.86");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009969,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.87");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009970,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.88");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009971,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.89");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009972,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.90");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009973,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.91");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009974,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.92");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009975,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.93");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009976,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.94");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009977,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.95");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009978,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.96");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009979,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.97");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009980,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.98");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009981,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.99");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009982,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.100");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009983,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.101");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009984,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.102");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009985,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.103");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009986,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.104");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009987,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.105");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009988,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.106");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009989,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.107");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009990,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.108");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009991,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.109");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009992,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.110");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009993,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.111");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009994,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.112");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009995,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.113");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009996,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.114");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009997,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.115");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009998,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.116");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009999,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.117");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_010000,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.118");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_010001,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.119");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_010002,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.120");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_010003,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.121");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_010004,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.122");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_010005,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.123");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_010006,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.124");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_010007,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.125");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_010008,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.126");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_010009,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.127");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_010010,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.128");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_010011,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.129");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_010012,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.130");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_010013,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.131");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_010014,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.132");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_010015,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.133");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_010016,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.134");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_010017,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.135");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_010018,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.136");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_010019,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.137");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_010020,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.138");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_010021,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.139");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_010022,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.140");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_010023,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.141");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_010024,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.142");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_010025,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.143");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_010026,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.144");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_010027,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.145");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_010028,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.146");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_010029,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.147");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_010030,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.148");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_010031,
        "dEQP-GLES2.functional.shader",
        "s.random.texture.fragment.149");
