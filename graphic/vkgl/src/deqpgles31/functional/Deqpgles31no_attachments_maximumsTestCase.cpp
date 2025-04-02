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
#include "../ActsDeqpgles310021TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020036,
        "dEQP-GLES31.functional.fbo.n",
        "o_attachments.maximums.width");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020037,
        "dEQP-GLES31.functional.fbo.n",
        "o_attachments.maximums.height");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020038,
        "dEQP-GLES31.functional.fbo.",
        "no_attachments.maximums.size");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020039,
        "dEQP-GLES31.functional.fbo.no",
        "_attachments.maximums.samples");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020040,
        "dEQP-GLES31.functional.fbo.",
        "no_attachments.maximums.all");
