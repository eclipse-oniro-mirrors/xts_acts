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

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021755,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.0");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021756,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.1");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021757,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.2");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021758,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.3");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021759,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.4");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021760,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.5");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021761,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.8");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021762,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.10");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021763,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.11");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021764,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.12");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021765,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.15");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021766,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.17");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021767,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.19");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021768,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.20");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021769,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.23");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021770,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.24");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021771,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.26");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021772,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.27");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021773,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.28");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021774,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.29");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021775,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.31");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021776,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.33");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021777,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.35");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021778,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.36");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021779,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.37");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021780,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.41");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021781,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.42");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021782,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.43");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021783,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.44");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021784,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.45");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021785,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.47");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021786,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.48");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021787,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.49");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021788,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.50");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021789,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.51");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021790,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.52");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021791,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.54");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021792,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.57");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021793,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.58");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021794,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.59");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021795,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.60");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021796,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.61");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021797,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.62");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021798,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.63");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021799,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.67");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021800,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.68");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021801,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.71");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021802,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.73");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021803,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.74");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021804,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.75");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021805,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.76");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021806,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.77");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021807,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.78");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021808,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.79");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021809,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.82");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021810,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.83");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021811,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.84");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021812,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.85");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021813,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.87");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021814,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.88");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021815,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.90");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021816,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.91");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021817,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.92");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021818,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.93");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021819,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.95");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021820,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.97");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021821,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.98");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021822,
        "dEQP-GLES3.functional.shaders.",
        "random.all_features.fragment.99");
