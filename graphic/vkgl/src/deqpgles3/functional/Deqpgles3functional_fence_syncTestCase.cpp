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
#include "../ActsDeqpgles30042TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041856,
        "dEQP-GLES3.functional.fenc",
        "e_sync.wait_sync_smalldraw");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041857,
        "dEQP-GLES3.functional.fenc",
        "e_sync.wait_sync_largedraw");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041858,
        "dEQP-GLES3.functional.fence_s",
        "ync.client_wait_sync_smalldraw");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041859,
        "dEQP-GLES3.functional.fence_s",
        "ync.client_wait_sync_largedraw");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041860,
        "dEQP-GLES3.functional.fence_sync.",
        "client_wait_sync_timeout_smalldraw");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041861,
        "dEQP-GLES3.functional.fence_sync.",
        "client_wait_sync_timeout_largedraw");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041862,
        "dEQP-GLES3.functional.fence_sy",
        "nc.client_wait_sync_flush_auto");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041863,
        "dEQP-GLES3.functional.fence_syn",
        "c.client_wait_sync_flush_manual");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041864,
        "dEQP-GLES3.functional.fence_",
        "sync.client_wait_sync_noflush");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041865,
        "dEQP-GLES3.functional.fence_",
        "sync.client_wait_sync_finish");
