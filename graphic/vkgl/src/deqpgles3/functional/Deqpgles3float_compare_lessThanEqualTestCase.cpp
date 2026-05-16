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
#include "../ActsDeqpgles30014TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013408,
        "dEQP-GLES3.functional.shaders.operator.fl",
        "oat_compare.lessThanEqual.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013409,
        "dEQP-GLES3.functional.shaders.operator.flo",
        "at_compare.lessThanEqual.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013410,
        "dEQP-GLES3.functional.shaders.operator.floa",
        "t_compare.lessThanEqual.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013411,
        "dEQP-GLES3.functional.shaders.operator.float",
        "_compare.lessThanEqual.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013412,
        "dEQP-GLES3.functional.shaders.operator.flo",
        "at_compare.lessThanEqual.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013413,
        "dEQP-GLES3.functional.shaders.operator.floa",
        "t_compare.lessThanEqual.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013414,
        "dEQP-GLES3.functional.shaders.operator.fl",
        "oat_compare.lessThanEqual.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013415,
        "dEQP-GLES3.functional.shaders.operator.flo",
        "at_compare.lessThanEqual.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013416,
        "dEQP-GLES3.functional.shaders.operator.floa",
        "t_compare.lessThanEqual.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013417,
        "dEQP-GLES3.functional.shaders.operator.float",
        "_compare.lessThanEqual.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013418,
        "dEQP-GLES3.functional.shaders.operator.flo",
        "at_compare.lessThanEqual.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013419,
        "dEQP-GLES3.functional.shaders.operator.floa",
        "t_compare.lessThanEqual.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013420,
        "dEQP-GLES3.functional.shaders.operator.fl",
        "oat_compare.lessThanEqual.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013421,
        "dEQP-GLES3.functional.shaders.operator.flo",
        "at_compare.lessThanEqual.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013422,
        "dEQP-GLES3.functional.shaders.operator.floa",
        "t_compare.lessThanEqual.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013423,
        "dEQP-GLES3.functional.shaders.operator.float",
        "_compare.lessThanEqual.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013424,
        "dEQP-GLES3.functional.shaders.operator.flo",
        "at_compare.lessThanEqual.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013425,
        "dEQP-GLES3.functional.shaders.operator.floa",
        "t_compare.lessThanEqual.highp_vec4_fragment");
