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
#include "../Gl43gtfmasterBaseFunc.h"
#include "../ActsGl43gtfmaster0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001269,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_initial_state");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001270,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_coverage_create_bind_delete");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001271,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_coverage_delete_currently_bound");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001272,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_coverage_default_state");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001273,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_coverage_attachment_state");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001274,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_coverage_attach_attachments");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001275,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_coverage_framebuffer_status");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001276,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_coverage_user_generated_read_buffer_binding");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001277,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_coverage_default_read_buffer_binding");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001278,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_coverage_user_generated_draw_buffer_binding");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001279,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_coverage_default_draw_buffer_binding");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001280,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_coverage_mismatched_buffer_formats");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001281,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_coverage_basic_usage");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001282,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_error_incomplete_draw_framebuffer");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001283,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_error_incomplete_read_framebuffer");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001284,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_error_readbuffer_default_enums");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001285,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_error_readbuffer_color_enums");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001286,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_error_drawbuffer_default_enums");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001287,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_error_drawbuffer_color_enums");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001288,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_error_readpixels_incomplete_read_framebuffer");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001289,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_error_copyteximage_incomplete_read_framebuffer");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001290,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_error_linear_filter_depth_or_stencil_buffer_blit");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001291,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_error_blitframebuffer_with_incomplete_framebuffers");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001292,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_error_depth_or_stencil_buffers_mismatched_formats");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001293,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_bl"
    "it_error_framebufferrenderbuffer_for_default_framebuffer");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001294,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_error_framebuffertexture2d_for_default_framebuffer");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001295,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_error_blitframebuffer_fixed_point_read_buffer");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001296,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_error_blitframebuffer_floating_point_read_buffer");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001297,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_error_blitframebuffer_integer_read_buffer");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001298,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_error_blitframebuffer_signed_integer_read_buffer");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001299,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_error_blitframebuffer_multisample_draw_buffer");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001300,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_er"
    "ror_blitframebuffer_multisampled_read_buffer_different_sizes");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001301,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_err"
    "or_blitframebuffer_multisampled_read_buffer_different_origins");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001302,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_err"
    "or_blitframebuffer_multisampled_read_buffer_different_formats");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001303,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_error_"
    "blitframebuffer_multisampled_framebuffers_different_sample_count");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001304,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_er"
    "ror_blitframebuffer_multisampled_framebuffers_different_sizes");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001305,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_err"
    "or_blitframebuffer_multisampled_framebuffers_different_origins");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001306,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_err"
    "or_blitframebuffer_multisampled_framebuffers_different_formats");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001307,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_functionality_nearest_filter_color_blit");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001308,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_functionality_linear_filter_color_blit");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001309,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_functionality_depth_blit");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001310,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_functionality_stencil_blit");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001311,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_functionality_color_and_depth_blit");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001312,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_functionality_color_and_stencil_blit");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001313,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_functionality_all_buffer_blit");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001314,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_functionality_missing_buffers_blit");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001315,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_functionality_negative_height_blit");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001316,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_functionality_negative_width_blit");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001317,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_functionality_negative_dimensions_blit");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001318,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_functionality_magnifying_blit");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001319,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_functionality_minifying_blit");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001320,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_functionality_scissor_blit");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001321,
    "GTF-GL43.gtf30.GL3Tests.framebuffer_blit.framebuffer_blit_functionality_multisampled_to_singlesampled_blit");
