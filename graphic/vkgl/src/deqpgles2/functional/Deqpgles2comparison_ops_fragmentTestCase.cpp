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

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009082,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.0");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009083,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.1");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009084,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.2");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009085,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.3");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009086,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.4");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009087,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.5");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009088,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.6");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009089,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.7");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009090,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.8");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009091,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.9");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009092,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.10");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009093,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.11");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009094,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.12");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009095,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.13");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009096,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.14");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009097,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.15");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009098,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.16");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009099,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.17");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009100,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.18");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009101,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.19");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009102,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.20");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009103,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.21");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009104,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.22");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009105,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.23");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009106,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.24");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009107,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.25");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009108,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.26");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009109,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.27");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009110,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.28");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009111,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.29");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009112,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.30");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009113,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.31");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009114,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.32");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009115,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.33");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009116,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.34");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009117,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.35");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009118,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.36");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009119,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.37");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009120,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.38");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009121,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.39");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009122,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.40");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009123,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.41");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009124,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.42");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009125,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.43");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009126,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.44");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009127,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.45");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009128,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.46");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009129,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.47");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009130,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.48");

static SHRINK_HWTEST_F(ActsDeqpgles20010TestSuite, TestCase_009131,
        "dEQP-GLES2.functional.shaders.r",
        "andom.comparison_ops.fragment.49");
