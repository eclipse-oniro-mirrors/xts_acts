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

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014124,
        "dEQP-GLES31.functional.texture.texture_buffe",
        "r.modify_render.buffersubdata.as_vertex_array");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014125,
        "dEQP-GLES31.functional.texture.texture_buffe",
        "r.modify_render.buffersubdata.as_index_array");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014126,
        "dEQP-GLES31.functional.texture.texture_buffer.modify",
        "_render.buffersubdata.as_vertex_array_as_index_array");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014127,
        "dEQP-GLES31.functional.texture.texture_buffer",
        ".modify_render.buffersubdata.as_vertex_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014128,
        "dEQP-GLES31.functional.texture.texture_buffer.modify_",
        "render.buffersubdata.as_vertex_array_as_vertex_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014129,
        "dEQP-GLES31.functional.texture.texture_buffer.modify_",
        "render.buffersubdata.as_index_array_as_vertex_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014130,
        "dEQP-GLES31.functional.texture.texture_buffer.modify_render.b",
        "uffersubdata.as_vertex_array_as_index_array_as_vertex_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014131,
        "dEQP-GLES31.functional.texture.texture_buffer.",
        "modify_render.buffersubdata.as_fragment_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014132,
        "dEQP-GLES31.functional.texture.texture_buffer.modify_r",
        "ender.buffersubdata.as_vertex_array_as_fragment_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014133,
        "dEQP-GLES31.functional.texture.texture_buffer.modify_r",
        "ender.buffersubdata.as_index_array_as_fragment_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014134,
        "dEQP-GLES31.functional.texture.texture_buffer.modify_render.bu",
        "ffersubdata.as_vertex_array_as_index_array_as_fragment_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014135,
        "dEQP-GLES31.functional.texture.texture_buffer.modify_re",
        "nder.buffersubdata.as_vertex_texture_as_fragment_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014136,
        "dEQP-GLES31.functional.texture.texture_buffer.modify_render.buf",
        "fersubdata.as_vertex_array_as_vertex_texture_as_fragment_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014137,
        "dEQP-GLES31.functional.texture.texture_buffer.modify_render.buf",
        "fersubdata.as_index_array_as_vertex_texture_as_fragment_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014138,
        "dEQP-GLES31.functional.texture.texture_buffer.modify_render.buffersubda",
        "ta.as_vertex_array_as_index_array_as_vertex_texture_as_fragment_texture");
