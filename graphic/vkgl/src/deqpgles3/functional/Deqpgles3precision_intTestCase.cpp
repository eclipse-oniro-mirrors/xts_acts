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
#include "../ActsDeqpgles30017TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016748,
        "dEQP-GLES3.functional.shaders.",
        "precision.int.highp_add_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016749,
        "dEQP-GLES3.functional.shaders.p",
        "recision.int.highp_add_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016750,
        "dEQP-GLES3.functional.shaders.",
        "precision.int.highp_sub_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016751,
        "dEQP-GLES3.functional.shaders.p",
        "recision.int.highp_sub_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016752,
        "dEQP-GLES3.functional.shaders.",
        "precision.int.highp_mul_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016753,
        "dEQP-GLES3.functional.shaders.p",
        "recision.int.highp_mul_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016754,
        "dEQP-GLES3.functional.shaders.",
        "precision.int.highp_div_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016755,
        "dEQP-GLES3.functional.shaders.p",
        "recision.int.highp_div_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016756,
        "dEQP-GLES3.functional.shaders.p",
        "recision.int.mediump_add_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016757,
        "dEQP-GLES3.functional.shaders.pr",
        "ecision.int.mediump_add_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016758,
        "dEQP-GLES3.functional.shaders.p",
        "recision.int.mediump_sub_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016759,
        "dEQP-GLES3.functional.shaders.pr",
        "ecision.int.mediump_sub_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016760,
        "dEQP-GLES3.functional.shaders.p",
        "recision.int.mediump_mul_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016761,
        "dEQP-GLES3.functional.shaders.pr",
        "ecision.int.mediump_mul_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016762,
        "dEQP-GLES3.functional.shaders.p",
        "recision.int.mediump_div_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016763,
        "dEQP-GLES3.functional.shaders.pr",
        "ecision.int.mediump_div_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016764,
        "dEQP-GLES3.functional.shaders",
        ".precision.int.lowp_add_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016765,
        "dEQP-GLES3.functional.shaders.",
        "precision.int.lowp_add_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016766,
        "dEQP-GLES3.functional.shaders",
        ".precision.int.lowp_sub_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016767,
        "dEQP-GLES3.functional.shaders.",
        "precision.int.lowp_sub_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016768,
        "dEQP-GLES3.functional.shaders",
        ".precision.int.lowp_mul_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016769,
        "dEQP-GLES3.functional.shaders.",
        "precision.int.lowp_mul_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016770,
        "dEQP-GLES3.functional.shaders",
        ".precision.int.lowp_div_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016771,
        "dEQP-GLES3.functional.shaders.",
        "precision.int.lowp_div_fragment");
