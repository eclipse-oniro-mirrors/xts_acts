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
#include "../ActsDeqpgles30028TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027676,
        "dEQP-GLES3.functional.fr",
        "agment_ops.stencil.clear");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027677,
        "dEQP-GLES3.functional.fragment_",
        "ops.stencil.stencil_fail_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027678,
        "dEQP-GLES3.functional.fragment",
        "_ops.stencil.depth_fail_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027679,
        "dEQP-GLES3.functional.fragment",
        "_ops.stencil.depth_pass_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027680,
        "dEQP-GLES3.functional.fragment",
        "_ops.stencil.incr_stencil_fail");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027681,
        "dEQP-GLES3.functional.fragment",
        "_ops.stencil.decr_stencil_fail");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027682,
        "dEQP-GLES3.functional.fragment_o",
        "ps.stencil.incr_wrap_stencil_fail");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027683,
        "dEQP-GLES3.functional.fragment_o",
        "ps.stencil.decr_wrap_stencil_fail");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027684,
        "dEQP-GLES3.functional.fragment",
        "_ops.stencil.zero_stencil_fail");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027685,
        "dEQP-GLES3.functional.fragment_",
        "ops.stencil.invert_stencil_fail");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027686,
        "dEQP-GLES3.functional.frag",
        "ment_ops.stencil.cmp_equal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027687,
        "dEQP-GLES3.functional.fragme",
        "nt_ops.stencil.cmp_not_equal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027688,
        "dEQP-GLES3.functional.fragme",
        "nt_ops.stencil.cmp_less_than");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027689,
        "dEQP-GLES3.functional.fragment",
        "_ops.stencil.cmp_less_or_equal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027690,
        "dEQP-GLES3.functional.fragmen",
        "t_ops.stencil.cmp_greater_than");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027691,
        "dEQP-GLES3.functional.fragment_",
        "ops.stencil.cmp_greater_or_equal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027692,
        "dEQP-GLES3.functional.fragme",
        "nt_ops.stencil.cmp_mask_equal");
