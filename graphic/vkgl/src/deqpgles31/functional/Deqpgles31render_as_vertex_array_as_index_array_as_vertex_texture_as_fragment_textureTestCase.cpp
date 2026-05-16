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

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014054,
        "dEQP-GLES31.functional.texture.texture_buffer.render.as_vertex_array",
        "_as_index_array_as_vertex_texture_as_fragment_texture.buffer_size_512");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014055,
        "dEQP-GLES31.functional.texture.texture_buffer.render.as_vertex_array",
        "_as_index_array_as_vertex_texture_as_fragment_texture.buffer_size_513");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014056,
        "dEQP-GLES31.functional.texture.texture_buffer.render.as_vertex_array_",
        "as_index_array_as_vertex_texture_as_fragment_texture.buffer_size_65536");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014057,
        "dEQP-GLES31.functional.texture.texture_buffer.render.as_vertex_array_",
        "as_index_array_as_vertex_texture_as_fragment_texture.buffer_size_65537");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014058,
        "dEQP-GLES31.functional.texture.texture_buffer.render.as_vertex_array_a",
        "s_index_array_as_vertex_texture_as_fragment_texture.buffer_size_131071");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014059,
        "dEQP-GLES31.functional.texture.texture_buffer.render.as_vertex_array",
        "_as_index_array_as_vertex_texture_as_fragment_texture.range_size_512");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014060,
        "dEQP-GLES31.functional.texture.texture_buffer.render.as_vertex_array",
        "_as_index_array_as_vertex_texture_as_fragment_texture.range_size_513");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014061,
        "dEQP-GLES31.functional.texture.texture_buffer.render.as_vertex_array_",
        "as_index_array_as_vertex_texture_as_fragment_texture.range_size_65537");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014062,
        "dEQP-GLES31.functional.texture.texture_buffer.render.as_vertex_array_",
        "as_index_array_as_vertex_texture_as_fragment_texture.range_size_98304");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014063,
        "dEQP-GLES31.functional.texture.texture_buffer.render.as_vertex_array_a",
        "s_index_array_as_vertex_texture_as_fragment_texture.offset_1_alignments");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014064,
        "dEQP-GLES31.functional.texture.texture_buffer.render.as_vertex_array_a",
        "s_index_array_as_vertex_texture_as_fragment_texture.offset_7_alignments");
