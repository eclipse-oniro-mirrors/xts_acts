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
#include "../ActsDeqpgles30022TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021685,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.0");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021686,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.1");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021687,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.3");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021688,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.5");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021689,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.7");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021690,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.8");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021691,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.9");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021692,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.10");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021693,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.11");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021694,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.12");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021695,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.14");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021696,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.15");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021697,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.16");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021698,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.19");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021699,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.20");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021700,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.21");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021701,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.22");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021702,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.23");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021703,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.24");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021704,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.25");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021705,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.27");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021706,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.28");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021707,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.30");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021708,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.31");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021709,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.32");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021710,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.33");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021711,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.35");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021712,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.36");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021713,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.37");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021714,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.38");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021715,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.39");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021716,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.42");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021717,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.43");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021718,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.44");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021719,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.45");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021720,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.48");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021721,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.51");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021722,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.52");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021723,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.55");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021724,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.56");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021725,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.57");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021726,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.58");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021727,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.59");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021728,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.60");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021729,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.61");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021730,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.63");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021731,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.64");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021732,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.67");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021733,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.68");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021734,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.69");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021735,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.70");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021736,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.71");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021737,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.73");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021738,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.74");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021739,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.75");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021740,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.78");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021741,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.80");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021742,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.82");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021743,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.83");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021744,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.84");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021745,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.85");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021746,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.86");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021747,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.89");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021748,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.90");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021749,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.91");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021750,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.92");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021751,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.95");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021752,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.97");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021753,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.98");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021754,
        "dEQP-GLES3.functional.shaders",
        ".random.all_features.vertex.99");
