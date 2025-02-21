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
#include "../ActsDeqpgles310001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000007,
        "dEQP-GLES31.functional.shaders.bu",
        "iltin_var.compute.num_work_groups");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000008,
        "dEQP-GLES31.functional.shaders.bu",
        "iltin_var.compute.work_group_size");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000009,
        "dEQP-GLES31.functional.shaders.b",
        "uiltin_var.compute.work_group_id");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000010,
        "dEQP-GLES31.functional.shaders.buil",
        "tin_var.compute.local_invocation_id");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000011,
        "dEQP-GLES31.functional.shaders.buil",
        "tin_var.compute.global_invocation_id");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000012,
        "dEQP-GLES31.functional.shaders.built",
        "in_var.compute.local_invocation_index");
