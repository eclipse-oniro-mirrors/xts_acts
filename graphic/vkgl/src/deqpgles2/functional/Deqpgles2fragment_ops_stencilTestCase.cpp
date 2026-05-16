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

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011009,
        "dEQP-GLES2.functional.fr",
        "agment_ops.stencil.clear");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011010,
        "dEQP-GLES2.functional.fragment_",
        "ops.stencil.stencil_fail_replace");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011011,
        "dEQP-GLES2.functional.fragment",
        "_ops.stencil.depth_fail_replace");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011012,
        "dEQP-GLES2.functional.fragment",
        "_ops.stencil.depth_pass_replace");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011013,
        "dEQP-GLES2.functional.fragment",
        "_ops.stencil.incr_stencil_fail");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011014,
        "dEQP-GLES2.functional.fragment",
        "_ops.stencil.decr_stencil_fail");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011015,
        "dEQP-GLES2.functional.fragment_o",
        "ps.stencil.incr_wrap_stencil_fail");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011016,
        "dEQP-GLES2.functional.fragment_o",
        "ps.stencil.decr_wrap_stencil_fail");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011017,
        "dEQP-GLES2.functional.fragment",
        "_ops.stencil.zero_stencil_fail");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011018,
        "dEQP-GLES2.functional.fragment_",
        "ops.stencil.invert_stencil_fail");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011019,
        "dEQP-GLES2.functional.frag",
        "ment_ops.stencil.cmp_equal");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011020,
        "dEQP-GLES2.functional.fragme",
        "nt_ops.stencil.cmp_not_equal");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011021,
        "dEQP-GLES2.functional.fragme",
        "nt_ops.stencil.cmp_less_than");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011022,
        "dEQP-GLES2.functional.fragment",
        "_ops.stencil.cmp_less_or_equal");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011023,
        "dEQP-GLES2.functional.fragmen",
        "t_ops.stencil.cmp_greater_than");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011024,
        "dEQP-GLES2.functional.fragment_",
        "ops.stencil.cmp_greater_or_equal");

static SHRINK_HWTEST_F(ActsDeqpgles20012TestSuite, TestCase_011025,
        "dEQP-GLES2.functional.fragme",
        "nt_ops.stencil.cmp_mask_equal");
