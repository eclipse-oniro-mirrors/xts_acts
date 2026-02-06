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

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016772,
        "dEQP-GLES3.functional.shaders.",
        "precision.uint.highp_add_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016773,
        "dEQP-GLES3.functional.shaders.p",
        "recision.uint.highp_add_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016774,
        "dEQP-GLES3.functional.shaders.",
        "precision.uint.highp_sub_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016775,
        "dEQP-GLES3.functional.shaders.p",
        "recision.uint.highp_sub_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016776,
        "dEQP-GLES3.functional.shaders.",
        "precision.uint.highp_mul_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016777,
        "dEQP-GLES3.functional.shaders.p",
        "recision.uint.highp_mul_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016778,
        "dEQP-GLES3.functional.shaders.",
        "precision.uint.highp_div_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016779,
        "dEQP-GLES3.functional.shaders.p",
        "recision.uint.highp_div_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016780,
        "dEQP-GLES3.functional.shaders.p",
        "recision.uint.mediump_add_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016781,
        "dEQP-GLES3.functional.shaders.pr",
        "ecision.uint.mediump_add_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016782,
        "dEQP-GLES3.functional.shaders.p",
        "recision.uint.mediump_sub_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016783,
        "dEQP-GLES3.functional.shaders.pr",
        "ecision.uint.mediump_sub_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016784,
        "dEQP-GLES3.functional.shaders.p",
        "recision.uint.mediump_mul_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016785,
        "dEQP-GLES3.functional.shaders.pr",
        "ecision.uint.mediump_mul_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016786,
        "dEQP-GLES3.functional.shaders.p",
        "recision.uint.mediump_div_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016787,
        "dEQP-GLES3.functional.shaders.pr",
        "ecision.uint.mediump_div_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016788,
        "dEQP-GLES3.functional.shaders.",
        "precision.uint.lowp_add_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016789,
        "dEQP-GLES3.functional.shaders.p",
        "recision.uint.lowp_add_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016790,
        "dEQP-GLES3.functional.shaders.",
        "precision.uint.lowp_sub_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016791,
        "dEQP-GLES3.functional.shaders.p",
        "recision.uint.lowp_sub_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016792,
        "dEQP-GLES3.functional.shaders.",
        "precision.uint.lowp_mul_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016793,
        "dEQP-GLES3.functional.shaders.p",
        "recision.uint.lowp_mul_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016794,
        "dEQP-GLES3.functional.shaders.",
        "precision.uint.lowp_div_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016795,
        "dEQP-GLES3.functional.shaders.p",
        "recision.uint.lowp_div_fragment");
