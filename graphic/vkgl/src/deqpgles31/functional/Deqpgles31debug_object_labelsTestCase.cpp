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

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019913,
        "dEQP-GLES31.functional.de",
        "bug.object_labels.initial");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019914,
        "dEQP-GLES31.functional.de",
        "bug.object_labels.clearing");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019915,
        "dEQP-GLES31.functional.debug.ob",
        "ject_labels.specify_with_length");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019916,
        "dEQP-GLES31.functional.debug.ob",
        "ject_labels.buffer_limited_query");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019917,
        "dEQP-GLES31.functional.debug.",
        "object_labels.max_label_length");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019918,
        "dEQP-GLES31.functional.debug.o",
        "bject_labels.query_length_only");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019919,
        "dEQP-GLES31.functional.d",
        "ebug.object_labels.buffer");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019920,
        "dEQP-GLES31.functional.d",
        "ebug.object_labels.shader");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019921,
        "dEQP-GLES31.functional.de",
        "bug.object_labels.program");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019922,
        "dEQP-GLES31.functional.d",
        "ebug.object_labels.query");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019923,
        "dEQP-GLES31.functional.debug.",
        "object_labels.program_pipeline");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019924,
        "dEQP-GLES31.functional.debug.o",
        "bject_labels.transform_feedback");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019925,
        "dEQP-GLES31.functional.de",
        "bug.object_labels.sampler");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019926,
        "dEQP-GLES31.functional.de",
        "bug.object_labels.texture");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019927,
        "dEQP-GLES31.functional.debu",
        "g.object_labels.renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019928,
        "dEQP-GLES31.functional.debu",
        "g.object_labels.framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019929,
        "dEQP-GLES31.functional.",
        "debug.object_labels.sync");
