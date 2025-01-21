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

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001209,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.imulextended.int_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001210,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.imulextended.int_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001211,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.imulextended.int_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001212,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.integer.imulextended.int_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001213,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.imulextended.int_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001214,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.integer.imulextended.int_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001215,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.imulextended.ivec2_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001216,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.imulextended.ivec2_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001217,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.imulextended.ivec2_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001218,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.imulextended.ivec2_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001219,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.imulextended.ivec2_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001220,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.imulextended.ivec2_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001221,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.imulextended.ivec3_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001222,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.imulextended.ivec3_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001223,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.imulextended.ivec3_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001224,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.imulextended.ivec3_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001225,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.imulextended.ivec3_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001226,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.imulextended.ivec3_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001227,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.imulextended.ivec4_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001228,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.imulextended.ivec4_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001229,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.imulextended.ivec4_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001230,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.integer.imulextended.ivec4_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001231,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.integer.imulextended.ivec4_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310002TestSuite, TestCase_001232,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.integer.imulextended.ivec4_highp_compute");
