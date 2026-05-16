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
#include "../Khrgles3BaseFunc.h"
#include "../ActsGles3MainUncover0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000263,
        "dEQP-GLES3.functional.fbo.blit.rect.",
        "nearest_consistency_out_of_bounds_mag");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000264,
        "dEQP-GLES3.functional.fbo.blit.rect.nearest",
        "_consistency_out_of_bounds_mag_reverse_src_x");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000265,
        "dEQP-GLES3.functional.fbo.blit.rect.nearest",
        "_consistency_out_of_bounds_mag_reverse_src_y");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000266,
        "dEQP-GLES3.functional.fbo.blit.rect.nearest",
        "_consistency_out_of_bounds_mag_reverse_dst_x");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000267,
        "dEQP-GLES3.functional.fbo.blit.rect.nearest",
        "_consistency_out_of_bounds_mag_reverse_dst_y");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000268,
        "dEQP-GLES3.functional.fbo.blit.rect.nearest_c",
        "onsistency_out_of_bounds_mag_reverse_src_dst_x");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000269,
        "dEQP-GLES3.functional.fbo.blit.rect.nearest_c",
        "onsistency_out_of_bounds_mag_reverse_src_dst_y");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000270,
        "dEQP-GLES3.functional.fbo.blit.rect.",
        "nearest_consistency_out_of_bounds_min");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000271,
        "dEQP-GLES3.functional.fbo.blit.rect.nearest",
        "_consistency_out_of_bounds_min_reverse_src_x");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000272,
        "dEQP-GLES3.functional.fbo.blit.rect.nearest",
        "_consistency_out_of_bounds_min_reverse_src_y");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000273,
        "dEQP-GLES3.functional.fbo.blit.rect.nearest",
        "_consistency_out_of_bounds_min_reverse_dst_x");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000274,
        "dEQP-GLES3.functional.fbo.blit.rect.nearest",
        "_consistency_out_of_bounds_min_reverse_dst_y");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000275,
        "dEQP-GLES3.functional.fbo.blit.rect.nearest_c",
        "onsistency_out_of_bounds_min_reverse_src_dst_x");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000276,
        "dEQP-GLES3.functional.fbo.blit.rect.nearest_c",
        "onsistency_out_of_bounds_min_reverse_src_dst_y");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000277,
        "dEQP-GLES3.functional.fbo.blit.depth_stenc",
        "il.depth_component32f_stencil_index8_basic");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000278,
        "dEQP-GLES3.functional.fbo.blit.depth_stenc",
        "il.depth_component32f_stencil_index8_scale");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000279,
        "dEQP-GLES3.functional.fbo.blit.depth_stencil",
        ".depth_component32f_stencil_index8_depth_only");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000280,
        "dEQP-GLES3.functional.fbo.blit.depth_stencil.",
        "depth_component32f_stencil_index8_stencil_only");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000281,
        "dEQP-GLES3.functional.fbo.blit.depth_sten",
        "cil.depth_component24_stencil_index8_basic");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000282,
        "dEQP-GLES3.functional.fbo.blit.depth_sten",
        "cil.depth_component24_stencil_index8_scale");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000283,
        "dEQP-GLES3.functional.fbo.blit.depth_stencil",
        ".depth_component24_stencil_index8_depth_only");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000284,
        "dEQP-GLES3.functional.fbo.blit.depth_stencil.",
        "depth_component24_stencil_index8_stencil_only");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000285,
        "dEQP-GLES3.functional.fbo.blit.depth_sten",
        "cil.depth_component16_stencil_index8_basic");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000286,
        "dEQP-GLES3.functional.fbo.blit.depth_sten",
        "cil.depth_component16_stencil_index8_scale");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000287,
        "dEQP-GLES3.functional.fbo.blit.depth_stencil",
        ".depth_component16_stencil_index8_depth_only");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000288,
        "dEQP-GLES3.functional.fbo.blit.depth_stencil.",
        "depth_component16_stencil_index8_stencil_only");
