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

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007687,
        "dEQP-GLES31.functional.compute.indirect_",
        "dispatch.upload_buffer.single_invocation");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007688,
        "dEQP-GLES31.functional.compute.indirect",
        "_dispatch.upload_buffer.multiple_groups");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007689,
        "dEQP-GLES31.functional.compute.indirect_dispatch.",
        "upload_buffer.multiple_groups_multiple_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007690,
        "dEQP-GLES31.functional.compute.indire",
        "ct_dispatch.upload_buffer.small_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007691,
        "dEQP-GLES31.functional.compute.indire",
        "ct_dispatch.upload_buffer.large_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007692,
        "dEQP-GLES31.functional.compute.indirect_dispatch",
        ".upload_buffer.large_offset_multiple_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007693,
        "dEQP-GLES31.functional.compute.indirec",
        "t_dispatch.upload_buffer.empty_command");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007694,
        "dEQP-GLES31.functional.compute.indirec",
        "t_dispatch.upload_buffer.multi_dispatch");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007695,
        "dEQP-GLES31.functional.compute.indirect_dispa",
        "tch.upload_buffer.multi_dispatch_reuse_command");
