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

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021485,
        "dEQP-GLES3.functional.shad",
        "ers.random.texture.vertex.0");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021486,
        "dEQP-GLES3.functional.shad",
        "ers.random.texture.vertex.1");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021487,
        "dEQP-GLES3.functional.shad",
        "ers.random.texture.vertex.2");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021488,
        "dEQP-GLES3.functional.shad",
        "ers.random.texture.vertex.3");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021489,
        "dEQP-GLES3.functional.shad",
        "ers.random.texture.vertex.4");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021490,
        "dEQP-GLES3.functional.shad",
        "ers.random.texture.vertex.5");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021491,
        "dEQP-GLES3.functional.shad",
        "ers.random.texture.vertex.6");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021492,
        "dEQP-GLES3.functional.shad",
        "ers.random.texture.vertex.7");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021493,
        "dEQP-GLES3.functional.shad",
        "ers.random.texture.vertex.8");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021494,
        "dEQP-GLES3.functional.shad",
        "ers.random.texture.vertex.9");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021495,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.vertex.10");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021496,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.vertex.11");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021497,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.vertex.12");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021498,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.vertex.13");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021499,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.vertex.14");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021500,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.vertex.15");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021501,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.vertex.16");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021502,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.vertex.17");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021503,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.vertex.18");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021504,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.vertex.19");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021505,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.vertex.20");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021506,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.vertex.21");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021507,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.vertex.22");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021508,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.vertex.23");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021509,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.vertex.24");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021510,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.vertex.25");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021511,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.vertex.26");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021512,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.vertex.27");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021513,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.vertex.28");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021514,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.vertex.29");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021515,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.vertex.30");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021516,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.vertex.31");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021517,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.vertex.32");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021518,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.vertex.33");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021519,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.vertex.34");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021520,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.vertex.35");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021521,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.vertex.36");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021522,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.vertex.37");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021523,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.vertex.38");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021524,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.vertex.39");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021525,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.vertex.40");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021526,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.vertex.41");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021527,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.vertex.42");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021528,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.vertex.43");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021529,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.vertex.44");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021530,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.vertex.45");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021531,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.vertex.46");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021532,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.vertex.47");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021533,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.vertex.48");

static SHRINK_HWTEST_F(ActsDeqpgles30022TestSuite, TestCase_021534,
        "dEQP-GLES3.functional.shade",
        "rs.random.texture.vertex.49");
