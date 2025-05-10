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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20014TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013628,
        "dEQP-GLES2.functional.nega",
        "tive_api.buffer.bind_buffer");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013629,
        "dEQP-GLES2.functional.negati",
        "ve_api.buffer.delete_buffers");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013630,
        "dEQP-GLES2.functional.nega",
        "tive_api.buffer.gen_buffers");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013631,
        "dEQP-GLES2.functional.nega",
        "tive_api.buffer.buffer_data");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013632,
        "dEQP-GLES2.functional.negati",
        "ve_api.buffer.buffer_sub_data");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013633,
        "dEQP-GLES2.functional.negative_api",
        ".buffer.buffer_sub_data_size_offset");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013634,
        "dEQP-GLES2.functional.n",
        "egative_api.buffer.clear");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013635,
        "dEQP-GLES2.functional.nega",
        "tive_api.buffer.read_pixels");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013636,
        "dEQP-GLES2.functional.negative_api",
        ".buffer.read_pixels_format_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013637,
        "dEQP-GLES2.functional.negativ",
        "e_api.buffer.bind_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013638,
        "dEQP-GLES2.functional.negativ",
        "e_api.buffer.bind_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013639,
        "dEQP-GLES2.functional.negative_ap",
        "i.buffer.check_framebuffer_status");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013640,
        "dEQP-GLES2.functional.negativ",
        "e_api.buffer.gen_framebuffers");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013641,
        "dEQP-GLES2.functional.negativ",
        "e_api.buffer.gen_renderbuffers");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013642,
        "dEQP-GLES2.functional.negative",
        "_api.buffer.delete_framebuffers");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013643,
        "dEQP-GLES2.functional.negative_",
        "api.buffer.delete_renderbuffers");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013644,
        "dEQP-GLES2.functional.negative_ap",
        "i.buffer.framebuffer_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013645,
        "dEQP-GLES2.functional.negative_",
        "api.buffer.framebuffer_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013646,
        "dEQP-GLES2.functional.negative_",
        "api.buffer.renderbuffer_storage");
