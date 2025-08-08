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
#include "../ActsDeqpgles20012TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011135,
        "dEQP-GLES2.functional.fragme",
        "nt_ops.scissor.contained_tris");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011136,
        "dEQP-GLES2.functional.fragm",
        "ent_ops.scissor.partial_tris");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011137,
        "dEQP-GLES2.functional.fragme",
        "nt_ops.scissor.contained_tri");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011138,
        "dEQP-GLES2.functional.fragme",
        "nt_ops.scissor.enclosing_tri");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011139,
        "dEQP-GLES2.functional.fragm",
        "ent_ops.scissor.partial_tri");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011140,
        "dEQP-GLES2.functional.fragment",
        "_ops.scissor.outside_render_tri");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011141,
        "dEQP-GLES2.functional.fragme",
        "nt_ops.scissor.partial_lines");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011142,
        "dEQP-GLES2.functional.fragme",
        "nt_ops.scissor.contained_line");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011143,
        "dEQP-GLES2.functional.fragm",
        "ent_ops.scissor.partial_line");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011144,
        "dEQP-GLES2.functional.fragment_",
        "ops.scissor.outside_render_line");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011145,
        "dEQP-GLES2.functional.fragmen",
        "t_ops.scissor.contained_point");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011146,
        "dEQP-GLES2.functional.fragme",
        "nt_ops.scissor.partial_points");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011147,
        "dEQP-GLES2.functional.fragme",
        "nt_ops.scissor.outside_point");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011148,
        "dEQP-GLES2.functional.fragment_",
        "ops.scissor.outside_render_point");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011149,
        "dEQP-GLES2.functional.fragm",
        "ent_ops.scissor.clear_depth");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011150,
        "dEQP-GLES2.functional.fragme",
        "nt_ops.scissor.clear_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011151,
        "dEQP-GLES2.functional.fragm",
        "ent_ops.scissor.clear_color");
