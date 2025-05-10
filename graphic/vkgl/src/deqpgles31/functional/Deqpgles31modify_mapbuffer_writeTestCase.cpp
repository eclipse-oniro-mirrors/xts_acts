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
#include "../ActsDeqpgles310015TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014087,
        "dEQP-GLES31.functional.texture.texture_buf",
        "fer.modify.mapbuffer_write.buffer_size_512");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014088,
        "dEQP-GLES31.functional.texture.texture_buf",
        "fer.modify.mapbuffer_write.buffer_size_513");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014089,
        "dEQP-GLES31.functional.texture.texture_buff",
        "er.modify.mapbuffer_write.buffer_size_65536");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014090,
        "dEQP-GLES31.functional.texture.texture_buff",
        "er.modify.mapbuffer_write.buffer_size_65537");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014091,
        "dEQP-GLES31.functional.texture.texture_buff",
        "er.modify.mapbuffer_write.buffer_size_131071");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014092,
        "dEQP-GLES31.functional.texture.texture_bu",
        "ffer.modify.mapbuffer_write.range_size_512");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014093,
        "dEQP-GLES31.functional.texture.texture_bu",
        "ffer.modify.mapbuffer_write.range_size_513");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014094,
        "dEQP-GLES31.functional.texture.texture_buf",
        "fer.modify.mapbuffer_write.range_size_65537");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014095,
        "dEQP-GLES31.functional.texture.texture_buf",
        "fer.modify.mapbuffer_write.range_size_98304");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014096,
        "dEQP-GLES31.functional.texture.texture_buffe",
        "r.modify.mapbuffer_write.offset_1_alignments");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014097,
        "dEQP-GLES31.functional.texture.texture_buffe",
        "r.modify.mapbuffer_write.offset_7_alignments");
