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

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013878,
        "dEQP-GLES31.functional.texture.texture_buffer.",
        "state_query.max_texture_buffer_size_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013879,
        "dEQP-GLES31.functional.texture.texture_buffer.",
        "state_query.max_texture_buffer_size_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013880,
        "dEQP-GLES31.functional.texture.texture_buffer.s",
        "tate_query.max_texture_buffer_size_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013881,
        "dEQP-GLES31.functional.texture.texture_buffer",
        ".state_query.max_texture_buffer_size_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013882,
        "dEQP-GLES31.functional.texture.texture_buffer.stat",
        "e_query.texture_buffer_offset_alignment_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013883,
        "dEQP-GLES31.functional.texture.texture_buffer.stat",
        "e_query.texture_buffer_offset_alignment_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013884,
        "dEQP-GLES31.functional.texture.texture_buffer.state",
        "_query.texture_buffer_offset_alignment_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013885,
        "dEQP-GLES31.functional.texture.texture_buffer.sta",
        "te_query.texture_buffer_offset_alignment_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013886,
        "dEQP-GLES31.functional.texture.texture_buffer",
        ".state_query.texture_buffer_binding_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013887,
        "dEQP-GLES31.functional.texture.texture_buffer",
        ".state_query.texture_buffer_binding_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013888,
        "dEQP-GLES31.functional.texture.texture_buffer.",
        "state_query.texture_buffer_binding_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013889,
        "dEQP-GLES31.functional.texture.texture_buffe",
        "r.state_query.texture_buffer_binding_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013890,
        "dEQP-GLES31.functional.texture.texture_buffer",
        ".state_query.texture_binding_buffer_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013891,
        "dEQP-GLES31.functional.texture.texture_buffer",
        ".state_query.texture_binding_buffer_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013892,
        "dEQP-GLES31.functional.texture.texture_buffer.",
        "state_query.texture_binding_buffer_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013893,
        "dEQP-GLES31.functional.texture.texture_buffe",
        "r.state_query.texture_binding_buffer_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013894,
        "dEQP-GLES31.functional.texture.texture_buffer.sta",
        "te_query.texture_buffer_data_store_binding_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013895,
        "dEQP-GLES31.functional.texture.texture_buffer.st",
        "ate_query.texture_buffer_data_store_binding_float");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013896,
        "dEQP-GLES31.functional.texture.texture_buff",
        "er.state_query.texture_buffer_offset_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013897,
        "dEQP-GLES31.functional.texture.texture_buf",
        "fer.state_query.texture_buffer_offset_float");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013898,
        "dEQP-GLES31.functional.texture.texture_buf",
        "fer.state_query.texture_buffer_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013899,
        "dEQP-GLES31.functional.texture.texture_bu",
        "ffer.state_query.texture_buffer_size_float");
