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

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014177,
        "dEQP-GLES31.functional.texture.texture_buffer.rend",
        "er_modify.as_vertex_array_as_index_array.bufferdata");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014178,
        "dEQP-GLES31.functional.texture.texture_buffer.render",
        "_modify.as_vertex_array_as_index_array.buffersubdata");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014179,
        "dEQP-GLES31.functional.texture.texture_buffer.render_",
        "modify.as_vertex_array_as_index_array.mapbuffer_write");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014180,
        "dEQP-GLES31.functional.texture.texture_buffer.render_mo",
        "dify.as_vertex_array_as_index_array.mapbuffer_readwrite");