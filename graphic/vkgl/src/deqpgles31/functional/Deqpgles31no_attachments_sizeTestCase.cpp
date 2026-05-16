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

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019969,
        "dEQP-GLES31.functional.fbo",
        ".no_attachments.size.16x16");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019970,
        "dEQP-GLES31.functional.fbo",
        ".no_attachments.size.16x64");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019971,
        "dEQP-GLES31.functional.fbo",
        ".no_attachments.size.16x256");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019972,
        "dEQP-GLES31.functional.fbo.",
        "no_attachments.size.16x1024");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019973,
        "dEQP-GLES31.functional.fbo",
        ".no_attachments.size.64x16");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019974,
        "dEQP-GLES31.functional.fbo",
        ".no_attachments.size.64x64");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019975,
        "dEQP-GLES31.functional.fbo",
        ".no_attachments.size.64x256");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019976,
        "dEQP-GLES31.functional.fbo.",
        "no_attachments.size.64x1024");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019977,
        "dEQP-GLES31.functional.fbo",
        ".no_attachments.size.256x16");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019978,
        "dEQP-GLES31.functional.fbo",
        ".no_attachments.size.256x64");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019979,
        "dEQP-GLES31.functional.fbo.",
        "no_attachments.size.256x256");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019980,
        "dEQP-GLES31.functional.fbo.",
        "no_attachments.size.256x1024");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019981,
        "dEQP-GLES31.functional.fbo.",
        "no_attachments.size.1024x16");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019982,
        "dEQP-GLES31.functional.fbo.",
        "no_attachments.size.1024x64");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019983,
        "dEQP-GLES31.functional.fbo.",
        "no_attachments.size.1024x256");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019984,
        "dEQP-GLES31.functional.fbo.n",
        "o_attachments.size.1024x1024");
