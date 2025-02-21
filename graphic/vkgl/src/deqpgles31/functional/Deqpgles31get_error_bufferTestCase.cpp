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
#include "../ActsDeqpgles310020TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019349,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.get_error.buffer.bind_buffer");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019350,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.get_error.buffer.delete_buffers");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019351,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.get_error.buffer.gen_buffers");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019352,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.get_error.buffer.buffer_data");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019353,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.get_error.buffer.buffer_sub_data");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019354,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.get_error.buffer.buffer_sub_data_size_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019355,
        "dEQP-GLES31.functional.debug.negat",
        "ive_coverage.get_error.buffer.clear");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019356,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.get_error.buffer.read_pixels");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019357,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.get_error.buffer.readn_pixels");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019358,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.get_error.buffer.read_pixels_format_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019359,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "get_error.buffer.read_pixels_fbo_format_mismatch");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019360,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.get_error.buffer.bind_buffer_range");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019361,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.get_error.buffer.bind_buffer_base");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019362,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.get_error.buffer.clear_bufferiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019363,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.get_error.buffer.clear_bufferuiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019364,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.get_error.buffer.clear_bufferfv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019365,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.get_error.buffer.clear_bufferfi");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019366,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.get_error.buffer.copy_buffer_sub_data");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019367,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.get_error.buffer.draw_buffers");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019368,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.get_error.buffer.flush_mapped_buffer_range");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019369,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.get_error.buffer.map_buffer_range");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019370,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.get_error.buffer.read_buffer");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019371,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.get_error.buffer.unmap_buffer");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019372,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.get_error.buffer.bind_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019373,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.get_error.buffer.bind_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019374,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.get_error.buffer.check_framebuffer_status");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019375,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.get_error.buffer.gen_framebuffers");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019376,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.get_error.buffer.gen_renderbuffers");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019377,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.get_error.buffer.delete_framebuffers");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019378,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.get_error.buffer.delete_renderbuffers");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019379,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.get_error.buffer.framebuffer_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019380,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.get_error.buffer.framebuffer_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019381,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.get_error.buffer.framebuffer_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019382,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.get_error.buffer.renderbuffer_storage");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019383,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.get_error.buffer.blit_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019384,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".get_error.buffer.blit_framebuffer_multisample");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019385,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.get_error.buffer.framebuffer_texture_layer");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019386,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.get_error.buffer.invalidate_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019387,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.get_error.buffer.invalidate_sub_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019388,
        "dEQP-GLES31.functional.debug.negative_coverage.g",
        "et_error.buffer.renderbuffer_storage_multisample");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019389,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.get_error.buffer.copy_image_sub_data");
