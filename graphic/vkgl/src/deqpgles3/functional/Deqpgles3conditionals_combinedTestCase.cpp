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

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020994,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.0");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020995,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.1");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020996,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.2");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020997,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.3");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020998,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.4");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_020999,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.5");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021000,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.6");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021001,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.7");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021002,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.8");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021003,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.9");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021004,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.10");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021005,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.11");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021006,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.12");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021007,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.13");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021008,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.14");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021009,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.15");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021010,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.16");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021011,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.17");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021012,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.18");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021013,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.19");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021014,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.20");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021015,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.21");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021016,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.22");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021017,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.23");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021018,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.24");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021019,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.25");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021020,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.26");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021021,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.27");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021022,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.28");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021023,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.29");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021024,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.30");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021025,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.31");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021026,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.32");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021027,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.33");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021028,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.34");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021029,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.35");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021030,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.36");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021031,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.37");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021032,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.38");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021033,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.39");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021034,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.40");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021035,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.41");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021036,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.42");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021037,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.43");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021038,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.44");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021039,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.45");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021040,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.46");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021041,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.47");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021042,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.48");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021043,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.49");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021044,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.50");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021045,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.51");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021046,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.52");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021047,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.53");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021048,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.54");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021049,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.55");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021050,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.56");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021051,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.57");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021052,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.58");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021053,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.59");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021054,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.60");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021055,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.61");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021056,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.62");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021057,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.63");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021058,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.64");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021059,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.65");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021060,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.66");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021061,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.67");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021062,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.68");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021063,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.69");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021064,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.70");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021065,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.71");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021066,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.72");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021067,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.73");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021068,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.74");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021069,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.75");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021070,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.76");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021071,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.77");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021072,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.78");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021073,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.79");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021074,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.80");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021075,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.81");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021076,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.82");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021077,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.83");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021078,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.84");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021079,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.85");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021080,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.86");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021081,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.87");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021082,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.88");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021083,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.89");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021084,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.90");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021085,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.91");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021086,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.92");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021087,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.93");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021088,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.94");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021089,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.95");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021090,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.96");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021091,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.97");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021092,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.98");

static SHRINK_HWTEST_F(ActsDeqpgles30021TestSuite, TestCase_021093,
        "dEQP-GLES3.functional.shaders.",
        "random.conditionals.combined.99");
