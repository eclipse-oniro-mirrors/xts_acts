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

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013988,
        "dEQP-GLES31.functional.texture.texture_buffer.render",
        ".as_vertex_array_as_fragment_texture.buffer_size_512");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013989,
        "dEQP-GLES31.functional.texture.texture_buffer.render",
        ".as_vertex_array_as_fragment_texture.buffer_size_513");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013990,
        "dEQP-GLES31.functional.texture.texture_buffer.render.",
        "as_vertex_array_as_fragment_texture.buffer_size_65536");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013991,
        "dEQP-GLES31.functional.texture.texture_buffer.render.",
        "as_vertex_array_as_fragment_texture.buffer_size_65537");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013992,
        "dEQP-GLES31.functional.texture.texture_buffer.render.",
        "as_vertex_array_as_fragment_texture.buffer_size_131071");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013993,
        "dEQP-GLES31.functional.texture.texture_buffer.rende",
        "r.as_vertex_array_as_fragment_texture.range_size_512");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013994,
        "dEQP-GLES31.functional.texture.texture_buffer.rende",
        "r.as_vertex_array_as_fragment_texture.range_size_513");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013995,
        "dEQP-GLES31.functional.texture.texture_buffer.render",
        ".as_vertex_array_as_fragment_texture.range_size_65537");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013996,
        "dEQP-GLES31.functional.texture.texture_buffer.render",
        ".as_vertex_array_as_fragment_texture.range_size_98304");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013997,
        "dEQP-GLES31.functional.texture.texture_buffer.render.a",
        "s_vertex_array_as_fragment_texture.offset_1_alignments");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013998,
        "dEQP-GLES31.functional.texture.texture_buffer.render.a",
        "s_vertex_array_as_fragment_texture.offset_7_alignments");