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

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010132,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.0");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010133,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010134,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.2");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010135,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.3");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010136,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.4");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010137,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.5");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010138,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.6");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010139,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.7");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010140,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.8");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010141,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.9");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010142,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.10");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010143,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.11");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010144,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.12");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010145,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.13");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010146,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.14");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010147,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.15");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010148,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.17");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010149,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.18");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010150,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.19");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010151,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.20");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010152,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.21");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010153,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.22");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010154,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.23");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010155,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.24");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010156,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.25");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010157,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.26");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010158,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.27");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010159,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.28");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010160,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.29");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010161,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.30");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010162,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.31");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010163,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.32");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010164,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.33");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010165,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.34");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010166,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.35");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010167,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.36");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010168,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.37");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010169,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.38");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010170,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.39");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010171,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.40");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010172,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.41");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010173,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.42");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010174,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.43");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010175,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.44");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010176,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.45");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010177,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.46");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010178,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.47");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010179,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.48");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010180,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.49");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010181,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.50");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010182,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.51");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010183,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.52");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010184,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.53");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010185,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.54");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010186,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.55");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010187,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.57");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010188,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.58");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010189,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.59");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010190,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.60");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010191,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.61");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010192,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.62");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010193,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.63");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010194,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.64");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010195,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.65");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010196,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.66");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010197,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.67");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010198,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.68");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010199,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.69");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010200,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.70");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010201,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.71");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010202,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.72");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010203,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.73");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010204,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.74");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010205,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.75");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010206,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.76");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010207,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.77");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010208,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.78");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010209,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.79");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010210,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.80");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010211,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.81");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010212,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.82");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010213,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.83");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010214,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.84");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010215,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.85");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010216,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.86");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010217,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.87");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010218,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.88");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010219,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.89");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010220,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.90");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010221,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.91");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010222,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.92");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010223,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.93");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010224,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.94");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010225,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.95");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010226,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.96");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010227,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.97");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010228,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.98");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010229,
        "dEQP-GLES2.functional.shaders.",
        "random.all_features.fragment.99");
