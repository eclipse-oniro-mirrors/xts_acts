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
#include "../ActsDeqpgles30029TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028289,
        "dEQP-GLES3.functional.fragme",
        "nt_ops.depth_stencil.random.0");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028290,
        "dEQP-GLES3.functional.fragme",
        "nt_ops.depth_stencil.random.1");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028291,
        "dEQP-GLES3.functional.fragme",
        "nt_ops.depth_stencil.random.2");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028292,
        "dEQP-GLES3.functional.fragme",
        "nt_ops.depth_stencil.random.3");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028293,
        "dEQP-GLES3.functional.fragme",
        "nt_ops.depth_stencil.random.4");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028294,
        "dEQP-GLES3.functional.fragme",
        "nt_ops.depth_stencil.random.5");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028295,
        "dEQP-GLES3.functional.fragme",
        "nt_ops.depth_stencil.random.6");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028296,
        "dEQP-GLES3.functional.fragme",
        "nt_ops.depth_stencil.random.7");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028297,
        "dEQP-GLES3.functional.fragme",
        "nt_ops.depth_stencil.random.8");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028298,
        "dEQP-GLES3.functional.fragme",
        "nt_ops.depth_stencil.random.9");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028299,
        "dEQP-GLES3.functional.fragmen",
        "t_ops.depth_stencil.random.10");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028300,
        "dEQP-GLES3.functional.fragmen",
        "t_ops.depth_stencil.random.11");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028301,
        "dEQP-GLES3.functional.fragmen",
        "t_ops.depth_stencil.random.12");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028302,
        "dEQP-GLES3.functional.fragmen",
        "t_ops.depth_stencil.random.13");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028303,
        "dEQP-GLES3.functional.fragmen",
        "t_ops.depth_stencil.random.14");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028304,
        "dEQP-GLES3.functional.fragmen",
        "t_ops.depth_stencil.random.15");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028305,
        "dEQP-GLES3.functional.fragmen",
        "t_ops.depth_stencil.random.16");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028306,
        "dEQP-GLES3.functional.fragmen",
        "t_ops.depth_stencil.random.17");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028307,
        "dEQP-GLES3.functional.fragmen",
        "t_ops.depth_stencil.random.18");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028308,
        "dEQP-GLES3.functional.fragmen",
        "t_ops.depth_stencil.random.19");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028309,
        "dEQP-GLES3.functional.fragmen",
        "t_ops.depth_stencil.random.20");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028310,
        "dEQP-GLES3.functional.fragmen",
        "t_ops.depth_stencil.random.21");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028311,
        "dEQP-GLES3.functional.fragmen",
        "t_ops.depth_stencil.random.22");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028312,
        "dEQP-GLES3.functional.fragmen",
        "t_ops.depth_stencil.random.23");

static SHRINK_HWTEST_F(ActsDeqpgles30029TestSuite, TestCase_028313,
        "dEQP-GLES3.functional.fragmen",
        "t_ops.depth_stencil.random.24");
