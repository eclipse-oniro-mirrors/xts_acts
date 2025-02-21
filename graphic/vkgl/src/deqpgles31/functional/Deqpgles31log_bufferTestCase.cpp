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
#include "../ActsDeqpgles310019TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018851,
        "dEQP-GLES31.functional.debug.negat",
        "ive_coverage.log.buffer.bind_buffer");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018852,
        "dEQP-GLES31.functional.debug.negativ",
        "e_coverage.log.buffer.delete_buffers");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018853,
        "dEQP-GLES31.functional.debug.negat",
        "ive_coverage.log.buffer.gen_buffers");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018854,
        "dEQP-GLES31.functional.debug.negat",
        "ive_coverage.log.buffer.buffer_data");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018855,
        "dEQP-GLES31.functional.debug.negativ",
        "e_coverage.log.buffer.buffer_sub_data");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018856,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.log.buffer.buffer_sub_data_size_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018857,
        "dEQP-GLES31.functional.debug.ne",
        "gative_coverage.log.buffer.clear");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018858,
        "dEQP-GLES31.functional.debug.negat",
        "ive_coverage.log.buffer.read_pixels");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018859,
        "dEQP-GLES31.functional.debug.negati",
        "ve_coverage.log.buffer.readn_pixels");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018860,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.log.buffer.read_pixels_format_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018861,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.log.buffer.read_pixels_fbo_format_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018862,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.log.buffer.bind_buffer_range");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018863,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.log.buffer.bind_buffer_base");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018864,
        "dEQP-GLES31.functional.debug.negativ",
        "e_coverage.log.buffer.clear_bufferiv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018865,
        "dEQP-GLES31.functional.debug.negativ",
        "e_coverage.log.buffer.clear_bufferuiv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018866,
        "dEQP-GLES31.functional.debug.negativ",
        "e_coverage.log.buffer.clear_bufferfv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018867,
        "dEQP-GLES31.functional.debug.negativ",
        "e_coverage.log.buffer.clear_bufferfi");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018868,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.log.buffer.copy_buffer_sub_data");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018869,
        "dEQP-GLES31.functional.debug.negati",
        "ve_coverage.log.buffer.draw_buffers");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018870,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.log.buffer.flush_mapped_buffer_range");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018871,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.log.buffer.map_buffer_range");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018872,
        "dEQP-GLES31.functional.debug.negat",
        "ive_coverage.log.buffer.read_buffer");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018873,
        "dEQP-GLES31.functional.debug.negati",
        "ve_coverage.log.buffer.unmap_buffer");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018874,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.log.buffer.bind_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018875,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.log.buffer.bind_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018876,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.log.buffer.check_framebuffer_status");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018877,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.log.buffer.gen_framebuffers");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018878,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.log.buffer.gen_renderbuffers");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018879,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.log.buffer.delete_framebuffers");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018880,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.log.buffer.delete_renderbuffers");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018881,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.log.buffer.framebuffer_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018882,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.log.buffer.framebuffer_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018883,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.log.buffer.framebuffer_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018884,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.log.buffer.renderbuffer_storage");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018885,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.log.buffer.blit_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018886,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.log.buffer.blit_framebuffer_multisample");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018887,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.log.buffer.framebuffer_texture_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018888,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.log.buffer.invalidate_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018889,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.log.buffer.invalidate_sub_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018890,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.log.buffer.renderbuffer_storage_multisample");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018891,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.log.buffer.copy_image_sub_data");
