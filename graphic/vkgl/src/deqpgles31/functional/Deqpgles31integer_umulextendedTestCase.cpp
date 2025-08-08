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
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001185,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.umulextended.uint_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001186,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.umulextended.uint_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001187,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.umulextended.uint_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001188,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.umulextended.uint_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001189,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.umulextended.uint_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001190,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.umulextended.uint_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001191,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.umulextended.uvec2_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001192,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.umulextended.uvec2_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001193,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.umulextended.uvec2_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001194,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.umulextended.uvec2_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001195,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.umulextended.uvec2_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001196,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.umulextended.uvec2_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001197,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.umulextended.uvec3_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001198,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.umulextended.uvec3_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001199,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.umulextended.uvec3_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001200,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.umulextended.uvec3_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001201,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.umulextended.uvec3_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001202,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.umulextended.uvec3_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001203,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.umulextended.uvec4_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001204,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.umulextended.uvec4_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001205,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.umulextended.uvec4_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001206,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.umulextended.uvec4_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001207,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.umulextended.uvec4_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001208,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.umulextended.uvec4_highp_compute");
