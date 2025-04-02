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

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020028,
        "dEQP-GLES31.functional.fbo.no_attachments",
        ".interaction.256x256ms0_default_128x128ms1");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020029,
        "dEQP-GLES31.functional.fbo.no_attachments",
        ".interaction.256x256ms1_default_128x128ms0");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020030,
        "dEQP-GLES31.functional.fbo.no_attachments",
        ".interaction.256x256ms0_default_512x512ms2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020031,
        "dEQP-GLES31.functional.fbo.no_attachments",
        ".interaction.256x256ms2_default_128x512ms0");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020032,
        "dEQP-GLES31.functional.fbo.no_attachments",
        ".interaction.127x127ms0_default_129x129ms0");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020033,
        "dEQP-GLES31.functional.fbo.no_attachment",
        "s.interaction.17x512ms4_default_16x16ms2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020034,
        "dEQP-GLES31.functional.fbo.no_attachment",
        "s.interaction.2048x2048ms4_default_1x1ms0");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020035,
        "dEQP-GLES31.functional.fbo.no_attachment",
        "s.interaction.1x1ms0_default_2048x2048ms4");
