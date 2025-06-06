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

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014217,
        "dEQP-GLES31.functional.texture.texture_buffer.render_modify.as",
        "_vertex_array_as_vertex_texture_as_fragment_texture.bufferdata");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014218,
        "dEQP-GLES31.functional.texture.texture_buffer.render_modify.as_",
        "vertex_array_as_vertex_texture_as_fragment_texture.buffersubdata");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014219,
        "dEQP-GLES31.functional.texture.texture_buffer.render_modify.as_v",
        "ertex_array_as_vertex_texture_as_fragment_texture.mapbuffer_write");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014220,
        "dEQP-GLES31.functional.texture.texture_buffer.render_modify.as_ver",
        "tex_array_as_vertex_texture_as_fragment_texture.mapbuffer_readwrite");
