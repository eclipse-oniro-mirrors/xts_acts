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

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014109,
        "dEQP-GLES31.functional.texture.texture_buff",
        "er.modify_render.bufferdata.as_vertex_array");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014110,
        "dEQP-GLES31.functional.texture.texture_buf",
        "fer.modify_render.bufferdata.as_index_array");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014111,
        "dEQP-GLES31.functional.texture.texture_buffer.modi",
        "fy_render.bufferdata.as_vertex_array_as_index_array");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014112,
        "dEQP-GLES31.functional.texture.texture_buffe",
        "r.modify_render.bufferdata.as_vertex_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014113,
        "dEQP-GLES31.functional.texture.texture_buffer.modify",
        "_render.bufferdata.as_vertex_array_as_vertex_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014114,
        "dEQP-GLES31.functional.texture.texture_buffer.modif",
        "y_render.bufferdata.as_index_array_as_vertex_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014115,
        "dEQP-GLES31.functional.texture.texture_buffer.modify_render",
        ".bufferdata.as_vertex_array_as_index_array_as_vertex_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014116,
        "dEQP-GLES31.functional.texture.texture_buffer",
        ".modify_render.bufferdata.as_fragment_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014117,
        "dEQP-GLES31.functional.texture.texture_buffer.modify_",
        "render.bufferdata.as_vertex_array_as_fragment_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014118,
        "dEQP-GLES31.functional.texture.texture_buffer.modify",
        "_render.bufferdata.as_index_array_as_fragment_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014119,
        "dEQP-GLES31.functional.texture.texture_buffer.modify_render.",
        "bufferdata.as_vertex_array_as_index_array_as_fragment_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014120,
        "dEQP-GLES31.functional.texture.texture_buffer.modify_r",
        "ender.bufferdata.as_vertex_texture_as_fragment_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014121,
        "dEQP-GLES31.functional.texture.texture_buffer.modify_render.bu",
        "fferdata.as_vertex_array_as_vertex_texture_as_fragment_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014122,
        "dEQP-GLES31.functional.texture.texture_buffer.modify_render.b",
        "ufferdata.as_index_array_as_vertex_texture_as_fragment_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014123,
        "dEQP-GLES31.functional.texture.texture_buffer.modify_render.bufferdat",
        "a.as_vertex_array_as_index_array_as_vertex_texture_as_fragment_texture");
