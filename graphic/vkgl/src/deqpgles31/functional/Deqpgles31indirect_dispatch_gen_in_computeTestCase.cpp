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
#include "../ActsDeqpgles310008TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007696,
        "dEQP-GLES31.functional.compute.indirect_",
        "dispatch.gen_in_compute.single_invocation");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007697,
        "dEQP-GLES31.functional.compute.indirect",
        "_dispatch.gen_in_compute.multiple_groups");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007698,
        "dEQP-GLES31.functional.compute.indirect_dispatch.g",
        "en_in_compute.multiple_groups_multiple_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007699,
        "dEQP-GLES31.functional.compute.indirec",
        "t_dispatch.gen_in_compute.small_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007700,
        "dEQP-GLES31.functional.compute.indirec",
        "t_dispatch.gen_in_compute.large_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007701,
        "dEQP-GLES31.functional.compute.indirect_dispatch",
        ".gen_in_compute.large_offset_multiple_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007702,
        "dEQP-GLES31.functional.compute.indirec",
        "t_dispatch.gen_in_compute.empty_command");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007703,
        "dEQP-GLES31.functional.compute.indirect",
        "_dispatch.gen_in_compute.multi_dispatch");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007704,
        "dEQP-GLES31.functional.compute.indirect_dispat",
        "ch.gen_in_compute.multi_dispatch_reuse_command");
