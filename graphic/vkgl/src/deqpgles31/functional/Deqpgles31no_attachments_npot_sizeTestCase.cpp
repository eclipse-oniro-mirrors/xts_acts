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
#include "../ActsDeqpgles310020TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019985,
        "dEQP-GLES31.functional.fbo.",
        "no_attachments.npot_size.1x1");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019986,
        "dEQP-GLES31.functional.fbo.",
        "no_attachments.npot_size.3x3");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019987,
        "dEQP-GLES31.functional.fbo.n",
        "o_attachments.npot_size.15x15");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019988,
        "dEQP-GLES31.functional.fbo.n",
        "o_attachments.npot_size.17x17");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019989,
        "dEQP-GLES31.functional.fbo.n",
        "o_attachments.npot_size.31x31");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019990,
        "dEQP-GLES31.functional.fbo.n",
        "o_attachments.npot_size.33x33");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019991,
        "dEQP-GLES31.functional.fbo.n",
        "o_attachments.npot_size.63x63");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019992,
        "dEQP-GLES31.functional.fbo.n",
        "o_attachments.npot_size.65x65");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019993,
        "dEQP-GLES31.functional.fbo.no",
        "_attachments.npot_size.127x127");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019994,
        "dEQP-GLES31.functional.fbo.no",
        "_attachments.npot_size.129x129");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019995,
        "dEQP-GLES31.functional.fbo.no",
        "_attachments.npot_size.255x255");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019996,
        "dEQP-GLES31.functional.fbo.no",
        "_attachments.npot_size.257x257");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019997,
        "dEQP-GLES31.functional.fbo.no",
        "_attachments.npot_size.511x511");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019998,
        "dEQP-GLES31.functional.fbo.no",
        "_attachments.npot_size.513x513");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019999,
        "dEQP-GLES31.functional.fbo.no_",
        "attachments.npot_size.1023x1023");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_020000,
        "dEQP-GLES31.functional.fbo.no_",
        "attachments.npot_size.1025x1025");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_020001,
        "dEQP-GLES31.functional.fbo.no_",
        "attachments.npot_size.2047x2047");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_020002,
        "dEQP-GLES31.functional.fbo.no",
        "_attachments.npot_size.15x511");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_020003,
        "dEQP-GLES31.functional.fbo.no",
        "_attachments.npot_size.127x15");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_020004,
        "dEQP-GLES31.functional.fbo.no",
        "_attachments.npot_size.129x127");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_020005,
        "dEQP-GLES31.functional.fbo.no",
        "_attachments.npot_size.511x127");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_020006,
        "dEQP-GLES31.functional.fbo.no_",
        "attachments.npot_size.2047x1025");
