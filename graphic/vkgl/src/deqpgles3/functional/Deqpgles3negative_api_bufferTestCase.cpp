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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30042TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041918,
        "dEQP-GLES3.functional.nega",
        "tive_api.buffer.bind_buffer");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041919,
        "dEQP-GLES3.functional.negati",
        "ve_api.buffer.delete_buffers");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041920,
        "dEQP-GLES3.functional.nega",
        "tive_api.buffer.gen_buffers");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041921,
        "dEQP-GLES3.functional.nega",
        "tive_api.buffer.buffer_data");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041922,
        "dEQP-GLES3.functional.negati",
        "ve_api.buffer.buffer_sub_data");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041923,
        "dEQP-GLES3.functional.negative_api",
        ".buffer.buffer_sub_data_size_offset");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041924,
        "dEQP-GLES3.functional.n",
        "egative_api.buffer.clear");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041925,
        "dEQP-GLES3.functional.nega",
        "tive_api.buffer.read_pixels");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041926,
        "dEQP-GLES3.functional.negative_api",
        ".buffer.read_pixels_format_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041927,
        "dEQP-GLES3.functional.negative_api.b",
        "uffer.read_pixels_fbo_format_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041928,
        "dEQP-GLES3.functional.negativ",
        "e_api.buffer.bind_buffer_range");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041929,
        "dEQP-GLES3.functional.negativ",
        "e_api.buffer.bind_buffer_base");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041930,
        "dEQP-GLES3.functional.negati",
        "ve_api.buffer.clear_bufferiv");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041931,
        "dEQP-GLES3.functional.negati",
        "ve_api.buffer.clear_bufferuiv");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041932,
        "dEQP-GLES3.functional.negati",
        "ve_api.buffer.clear_bufferfv");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041933,
        "dEQP-GLES3.functional.negati",
        "ve_api.buffer.clear_bufferfi");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041934,
        "dEQP-GLES3.functional.negative_",
        "api.buffer.copy_buffer_sub_data");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041935,
        "dEQP-GLES3.functional.negat",
        "ive_api.buffer.draw_buffers");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041936,
        "dEQP-GLES3.functional.negative_ap",
        "i.buffer.flush_mapped_buffer_range");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041937,
        "dEQP-GLES3.functional.negativ",
        "e_api.buffer.map_buffer_range");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041938,
        "dEQP-GLES3.functional.nega",
        "tive_api.buffer.read_buffer");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041939,
        "dEQP-GLES3.functional.negat",
        "ive_api.buffer.unmap_buffer");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041940,
        "dEQP-GLES3.functional.negativ",
        "e_api.buffer.bind_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041941,
        "dEQP-GLES3.functional.negativ",
        "e_api.buffer.bind_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041942,
        "dEQP-GLES3.functional.negative_ap",
        "i.buffer.check_framebuffer_status");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041943,
        "dEQP-GLES3.functional.negativ",
        "e_api.buffer.gen_framebuffers");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041944,
        "dEQP-GLES3.functional.negativ",
        "e_api.buffer.gen_renderbuffers");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041945,
        "dEQP-GLES3.functional.negative",
        "_api.buffer.delete_framebuffers");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041946,
        "dEQP-GLES3.functional.negative_",
        "api.buffer.delete_renderbuffers");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041947,
        "dEQP-GLES3.functional.negative_ap",
        "i.buffer.framebuffer_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041948,
        "dEQP-GLES3.functional.negative_",
        "api.buffer.framebuffer_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041949,
        "dEQP-GLES3.functional.negative_",
        "api.buffer.renderbuffer_storage");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041950,
        "dEQP-GLES3.functional.negativ",
        "e_api.buffer.blit_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041951,
        "dEQP-GLES3.functional.negative_api.",
        "buffer.blit_framebuffer_multisample");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041952,
        "dEQP-GLES3.functional.negative_ap",
        "i.buffer.framebuffer_texture_layer");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041953,
        "dEQP-GLES3.functional.negative_a",
        "pi.buffer.invalidate_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041954,
        "dEQP-GLES3.functional.negative_api",
        ".buffer.invalidate_sub_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041955,
        "dEQP-GLES3.functional.negative_api.bu",
        "ffer.renderbuffer_storage_multisample");
