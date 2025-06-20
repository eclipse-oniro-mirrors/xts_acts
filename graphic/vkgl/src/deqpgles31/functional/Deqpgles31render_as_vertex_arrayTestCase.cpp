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
#include "../ActsDeqpgles310014TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013900,
        "dEQP-GLES31.functional.texture.texture_buf",
        "fer.render.as_vertex_array.buffer_size_512");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013901,
        "dEQP-GLES31.functional.texture.texture_buf",
        "fer.render.as_vertex_array.buffer_size_513");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013902,
        "dEQP-GLES31.functional.texture.texture_buff",
        "er.render.as_vertex_array.buffer_size_65536");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013903,
        "dEQP-GLES31.functional.texture.texture_buff",
        "er.render.as_vertex_array.buffer_size_65537");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013904,
        "dEQP-GLES31.functional.texture.texture_buff",
        "er.render.as_vertex_array.buffer_size_131071");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013905,
        "dEQP-GLES31.functional.texture.texture_bu",
        "ffer.render.as_vertex_array.range_size_512");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013906,
        "dEQP-GLES31.functional.texture.texture_bu",
        "ffer.render.as_vertex_array.range_size_513");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013907,
        "dEQP-GLES31.functional.texture.texture_buf",
        "fer.render.as_vertex_array.range_size_65537");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013908,
        "dEQP-GLES31.functional.texture.texture_buf",
        "fer.render.as_vertex_array.range_size_98304");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013909,
        "dEQP-GLES31.functional.texture.texture_buffe",
        "r.render.as_vertex_array.offset_1_alignments");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013910,
        "dEQP-GLES31.functional.texture.texture_buffe",
        "r.render.as_vertex_array.offset_7_alignments");
