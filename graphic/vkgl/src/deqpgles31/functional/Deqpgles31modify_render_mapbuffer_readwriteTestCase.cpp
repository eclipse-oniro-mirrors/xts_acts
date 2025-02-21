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

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014154,
        "dEQP-GLES31.functional.texture.texture_buffer.m",
        "odify_render.mapbuffer_readwrite.as_vertex_array");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014155,
        "dEQP-GLES31.functional.texture.texture_buffer.m",
        "odify_render.mapbuffer_readwrite.as_index_array");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014156,
        "dEQP-GLES31.functional.texture.texture_buffer.modify_re",
        "nder.mapbuffer_readwrite.as_vertex_array_as_index_array");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014157,
        "dEQP-GLES31.functional.texture.texture_buffer.mo",
        "dify_render.mapbuffer_readwrite.as_vertex_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014158,
        "dEQP-GLES31.functional.texture.texture_buffer.modify_ren",
        "der.mapbuffer_readwrite.as_vertex_array_as_vertex_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014159,
        "dEQP-GLES31.functional.texture.texture_buffer.modify_ren",
        "der.mapbuffer_readwrite.as_index_array_as_vertex_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014160,
        "dEQP-GLES31.functional.texture.texture_buffer.modify_render.mapb",
        "uffer_readwrite.as_vertex_array_as_index_array_as_vertex_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014161,
        "dEQP-GLES31.functional.texture.texture_buffer.mod",
        "ify_render.mapbuffer_readwrite.as_fragment_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014162,
        "dEQP-GLES31.functional.texture.texture_buffer.modify_rend",
        "er.mapbuffer_readwrite.as_vertex_array_as_fragment_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014163,
        "dEQP-GLES31.functional.texture.texture_buffer.modify_rend",
        "er.mapbuffer_readwrite.as_index_array_as_fragment_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014164,
        "dEQP-GLES31.functional.texture.texture_buffer.modify_render.mapbu",
        "ffer_readwrite.as_vertex_array_as_index_array_as_fragment_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014165,
        "dEQP-GLES31.functional.texture.texture_buffer.modify_rende",
        "r.mapbuffer_readwrite.as_vertex_texture_as_fragment_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014166,
        "dEQP-GLES31.functional.texture.texture_buffer.modify_render.mapbuf",
        "fer_readwrite.as_vertex_array_as_vertex_texture_as_fragment_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014167,
        "dEQP-GLES31.functional.texture.texture_buffer.modify_render.mapbuf",
        "fer_readwrite.as_index_array_as_vertex_texture_as_fragment_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014168,
        "dEQP-GLES31.functional.texture.texture_buffer.modify_render.mapbuffer_read",
        "write.as_vertex_array_as_index_array_as_vertex_texture_as_fragment_texture");
