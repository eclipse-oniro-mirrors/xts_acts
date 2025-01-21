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
#include "../ActsDeqpgles20011TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010032,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.0");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010033,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010034,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.2");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010035,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.3");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010036,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.4");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010037,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.5");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010038,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.6");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010039,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.7");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010040,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.8");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010041,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.9");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010042,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.10");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010043,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.11");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010044,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.12");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010045,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.13");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010046,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.14");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010047,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.15");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010048,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.16");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010049,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.17");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010050,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.18");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010051,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.19");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010052,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.20");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010053,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.21");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010054,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.22");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010055,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.23");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010056,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.24");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010057,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.25");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010058,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.26");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010059,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.27");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010060,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.28");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010061,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.29");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010062,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.30");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010063,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.31");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010064,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.32");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010065,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.33");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010066,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.34");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010067,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.35");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010068,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.36");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010069,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.37");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010070,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.38");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010071,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.39");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010072,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.40");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010073,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.41");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010074,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.42");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010075,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.43");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010076,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.44");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010077,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.45");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010078,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.46");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010079,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.47");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010080,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.48");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010081,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.49");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010082,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.50");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010083,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.51");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010084,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.52");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010085,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.53");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010086,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.54");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010087,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.55");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010088,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.56");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010089,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.57");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010090,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.58");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010091,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.59");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010092,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.60");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010093,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.61");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010094,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.62");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010095,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.63");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010096,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.64");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010097,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.65");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010098,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.66");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010099,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.67");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010100,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.68");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010101,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.69");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010102,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.70");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010103,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.71");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010104,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.72");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010105,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.73");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010106,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.74");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010107,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.75");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010108,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.76");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010109,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.77");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010110,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.78");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010111,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.79");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010112,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.80");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010113,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.81");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010114,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.82");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010115,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.83");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010116,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.84");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010117,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.85");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010118,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.86");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010119,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.87");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010120,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.88");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010121,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.89");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010122,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.90");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010123,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.91");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010124,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.92");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010125,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.93");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010126,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.94");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010127,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.95");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010128,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.96");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010129,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.97");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010130,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.98");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010131,
        "dEQP-GLES2.functional.shaders",
        ".random.all_features.vertex.99");
