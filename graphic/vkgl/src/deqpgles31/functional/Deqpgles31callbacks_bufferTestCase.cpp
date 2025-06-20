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

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018353,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.callbacks.buffer.bind_buffer");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018354,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.callbacks.buffer.delete_buffers");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018355,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.callbacks.buffer.gen_buffers");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018356,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.callbacks.buffer.buffer_data");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018357,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.callbacks.buffer.buffer_sub_data");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018358,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.callbacks.buffer.buffer_sub_data_size_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018359,
        "dEQP-GLES31.functional.debug.negat",
        "ive_coverage.callbacks.buffer.clear");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018360,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.callbacks.buffer.read_pixels");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018361,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.callbacks.buffer.readn_pixels");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018362,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.callbacks.buffer.read_pixels_format_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018363,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "callbacks.buffer.read_pixels_fbo_format_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018364,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.callbacks.buffer.bind_buffer_range");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018365,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.callbacks.buffer.bind_buffer_base");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018366,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.callbacks.buffer.clear_bufferiv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018367,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.callbacks.buffer.clear_bufferuiv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018368,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.callbacks.buffer.clear_bufferfv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018369,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.callbacks.buffer.clear_bufferfi");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018370,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.callbacks.buffer.copy_buffer_sub_data");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018371,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.callbacks.buffer.draw_buffers");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018372,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.callbacks.buffer.flush_mapped_buffer_range");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018373,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.callbacks.buffer.map_buffer_range");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018374,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.callbacks.buffer.read_buffer");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018375,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.callbacks.buffer.unmap_buffer");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018376,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.callbacks.buffer.bind_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018377,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.callbacks.buffer.bind_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018378,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.callbacks.buffer.check_framebuffer_status");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018379,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.callbacks.buffer.gen_framebuffers");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018380,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.callbacks.buffer.gen_renderbuffers");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018381,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.callbacks.buffer.delete_framebuffers");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018382,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.callbacks.buffer.delete_renderbuffers");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018383,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.callbacks.buffer.framebuffer_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018384,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.callbacks.buffer.framebuffer_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018385,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.callbacks.buffer.framebuffer_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018386,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.callbacks.buffer.renderbuffer_storage");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018387,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.callbacks.buffer.blit_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018388,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".callbacks.buffer.blit_framebuffer_multisample");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018389,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.callbacks.buffer.framebuffer_texture_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018390,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.callbacks.buffer.invalidate_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018391,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.callbacks.buffer.invalidate_sub_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018392,
        "dEQP-GLES31.functional.debug.negative_coverage.c",
        "allbacks.buffer.renderbuffer_storage_multisample");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018393,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.callbacks.buffer.copy_image_sub_data");
