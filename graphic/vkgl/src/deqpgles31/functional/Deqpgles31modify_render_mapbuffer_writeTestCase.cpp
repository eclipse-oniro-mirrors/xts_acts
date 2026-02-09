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

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014139,
        "dEQP-GLES31.functional.texture.texture_buffer",
        ".modify_render.mapbuffer_write.as_vertex_array");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014140,
        "dEQP-GLES31.functional.texture.texture_buffer",
        ".modify_render.mapbuffer_write.as_index_array");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014141,
        "dEQP-GLES31.functional.texture.texture_buffer.modify_",
        "render.mapbuffer_write.as_vertex_array_as_index_array");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014142,
        "dEQP-GLES31.functional.texture.texture_buffer.",
        "modify_render.mapbuffer_write.as_vertex_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014143,
        "dEQP-GLES31.functional.texture.texture_buffer.modify_r",
        "ender.mapbuffer_write.as_vertex_array_as_vertex_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014144,
        "dEQP-GLES31.functional.texture.texture_buffer.modify_r",
        "ender.mapbuffer_write.as_index_array_as_vertex_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014145,
        "dEQP-GLES31.functional.texture.texture_buffer.modify_render.ma",
        "pbuffer_write.as_vertex_array_as_index_array_as_vertex_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014146,
        "dEQP-GLES31.functional.texture.texture_buffer.m",
        "odify_render.mapbuffer_write.as_fragment_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014147,
        "dEQP-GLES31.functional.texture.texture_buffer.modify_re",
        "nder.mapbuffer_write.as_vertex_array_as_fragment_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014148,
        "dEQP-GLES31.functional.texture.texture_buffer.modify_re",
        "nder.mapbuffer_write.as_index_array_as_fragment_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014149,
        "dEQP-GLES31.functional.texture.texture_buffer.modify_render.map",
        "buffer_write.as_vertex_array_as_index_array_as_fragment_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014150,
        "dEQP-GLES31.functional.texture.texture_buffer.modify_ren",
        "der.mapbuffer_write.as_vertex_texture_as_fragment_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014151,
        "dEQP-GLES31.functional.texture.texture_buffer.modify_render.mapb",
        "uffer_write.as_vertex_array_as_vertex_texture_as_fragment_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014152,
        "dEQP-GLES31.functional.texture.texture_buffer.modify_render.mapb",
        "uffer_write.as_index_array_as_vertex_texture_as_fragment_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014153,
        "dEQP-GLES31.functional.texture.texture_buffer.modify_render.mapbuffer_wr",
        "ite.as_vertex_array_as_index_array_as_vertex_texture_as_fragment_texture");
