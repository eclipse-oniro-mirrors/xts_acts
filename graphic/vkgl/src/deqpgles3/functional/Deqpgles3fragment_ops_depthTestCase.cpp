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

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027668,
        "dEQP-GLES3.functional.fra",
        "gment_ops.depth.cmp_always");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027669,
        "dEQP-GLES3.functional.fra",
        "gment_ops.depth.cmp_never");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027670,
        "dEQP-GLES3.functional.fra",
        "gment_ops.depth.cmp_equal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027671,
        "dEQP-GLES3.functional.fragm",
        "ent_ops.depth.cmp_not_equal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027672,
        "dEQP-GLES3.functional.fragm",
        "ent_ops.depth.cmp_less_than");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027673,
        "dEQP-GLES3.functional.fragmen",
        "t_ops.depth.cmp_less_or_equal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027674,
        "dEQP-GLES3.functional.fragme",
        "nt_ops.depth.cmp_greater_than");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027675,
        "dEQP-GLES3.functional.fragment",
        "_ops.depth.cmp_greater_or_equal");
