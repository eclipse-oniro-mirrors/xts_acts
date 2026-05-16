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

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016732,
        "dEQP-GLES3.functional.shaders.p",
        "recision.float.highp_add_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016733,
        "dEQP-GLES3.functional.shaders.pr",
        "ecision.float.highp_add_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016734,
        "dEQP-GLES3.functional.shaders.p",
        "recision.float.highp_sub_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016735,
        "dEQP-GLES3.functional.shaders.pr",
        "ecision.float.highp_sub_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016736,
        "dEQP-GLES3.functional.shaders.p",
        "recision.float.highp_mul_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016737,
        "dEQP-GLES3.functional.shaders.pr",
        "ecision.float.highp_mul_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016738,
        "dEQP-GLES3.functional.shaders.p",
        "recision.float.highp_div_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016739,
        "dEQP-GLES3.functional.shaders.pr",
        "ecision.float.highp_div_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016740,
        "dEQP-GLES3.functional.shaders.pr",
        "ecision.float.mediump_add_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016741,
        "dEQP-GLES3.functional.shaders.pre",
        "cision.float.mediump_add_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016742,
        "dEQP-GLES3.functional.shaders.pr",
        "ecision.float.mediump_sub_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016743,
        "dEQP-GLES3.functional.shaders.pre",
        "cision.float.mediump_sub_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016744,
        "dEQP-GLES3.functional.shaders.pr",
        "ecision.float.mediump_mul_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016745,
        "dEQP-GLES3.functional.shaders.pre",
        "cision.float.mediump_mul_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016746,
        "dEQP-GLES3.functional.shaders.pr",
        "ecision.float.mediump_div_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016747,
        "dEQP-GLES3.functional.shaders.pre",
        "cision.float.mediump_div_fragment");
