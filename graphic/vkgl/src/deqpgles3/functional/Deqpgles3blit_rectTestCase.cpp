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
#include "../ActsDeqpgles30033TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032060,
        "dEQP-GLES3.functional.fb",
        "o.blit.rect.basic_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032061,
        "dEQP-GLES3.functional.fb",
        "o.blit.rect.basic_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032062,
        "dEQP-GLES3.functional.fbo.blit.",
        "rect.basic_reverse_src_x_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032063,
        "dEQP-GLES3.functional.fbo.blit.",
        "rect.basic_reverse_src_x_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032064,
        "dEQP-GLES3.functional.fbo.blit.",
        "rect.basic_reverse_src_y_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032065,
        "dEQP-GLES3.functional.fbo.blit.",
        "rect.basic_reverse_src_y_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032066,
        "dEQP-GLES3.functional.fbo.blit.",
        "rect.basic_reverse_dst_x_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032067,
        "dEQP-GLES3.functional.fbo.blit.",
        "rect.basic_reverse_dst_x_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032068,
        "dEQP-GLES3.functional.fbo.blit.",
        "rect.basic_reverse_dst_y_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032069,
        "dEQP-GLES3.functional.fbo.blit.",
        "rect.basic_reverse_dst_y_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032070,
        "dEQP-GLES3.functional.fbo.blit.re",
        "ct.basic_reverse_src_dst_x_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032071,
        "dEQP-GLES3.functional.fbo.blit.re",
        "ct.basic_reverse_src_dst_x_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032072,
        "dEQP-GLES3.functional.fbo.blit.re",
        "ct.basic_reverse_src_dst_y_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032073,
        "dEQP-GLES3.functional.fbo.blit.re",
        "ct.basic_reverse_src_dst_y_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032074,
        "dEQP-GLES3.functional.fb",
        "o.blit.rect.scale_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032075,
        "dEQP-GLES3.functional.fb",
        "o.blit.rect.scale_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032076,
        "dEQP-GLES3.functional.fbo.blit.",
        "rect.scale_reverse_src_x_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032077,
        "dEQP-GLES3.functional.fbo.blit.",
        "rect.scale_reverse_src_x_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032078,
        "dEQP-GLES3.functional.fbo.blit.",
        "rect.scale_reverse_src_y_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032079,
        "dEQP-GLES3.functional.fbo.blit.",
        "rect.scale_reverse_src_y_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032080,
        "dEQP-GLES3.functional.fbo.blit.",
        "rect.scale_reverse_dst_x_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032081,
        "dEQP-GLES3.functional.fbo.blit.",
        "rect.scale_reverse_dst_x_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032082,
        "dEQP-GLES3.functional.fbo.blit.",
        "rect.scale_reverse_dst_y_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032083,
        "dEQP-GLES3.functional.fbo.blit.",
        "rect.scale_reverse_dst_y_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032084,
        "dEQP-GLES3.functional.fbo.blit.re",
        "ct.scale_reverse_src_dst_x_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032085,
        "dEQP-GLES3.functional.fbo.blit.re",
        "ct.scale_reverse_src_dst_x_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032086,
        "dEQP-GLES3.functional.fbo.blit.re",
        "ct.scale_reverse_src_dst_y_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032087,
        "dEQP-GLES3.functional.fbo.blit.re",
        "ct.scale_reverse_src_dst_y_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032088,
        "dEQP-GLES3.functional.fbo.bl",
        "it.rect.out_of_bounds_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032089,
        "dEQP-GLES3.functional.fbo.bl",
        "it.rect.out_of_bounds_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032090,
        "dEQP-GLES3.functional.fbo.blit.rect",
        ".out_of_bounds_reverse_src_x_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032091,
        "dEQP-GLES3.functional.fbo.blit.rect",
        ".out_of_bounds_reverse_src_x_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032092,
        "dEQP-GLES3.functional.fbo.blit.rect",
        ".out_of_bounds_reverse_src_y_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032093,
        "dEQP-GLES3.functional.fbo.blit.rect",
        ".out_of_bounds_reverse_src_y_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032094,
        "dEQP-GLES3.functional.fbo.blit.rect",
        ".out_of_bounds_reverse_dst_x_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032095,
        "dEQP-GLES3.functional.fbo.blit.rect",
        ".out_of_bounds_reverse_dst_x_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032096,
        "dEQP-GLES3.functional.fbo.blit.rect",
        ".out_of_bounds_reverse_dst_y_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032097,
        "dEQP-GLES3.functional.fbo.blit.rect",
        ".out_of_bounds_reverse_dst_y_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032098,
        "dEQP-GLES3.functional.fbo.blit.rect.o",
        "ut_of_bounds_reverse_src_dst_x_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032099,
        "dEQP-GLES3.functional.fbo.blit.rect.o",
        "ut_of_bounds_reverse_src_dst_x_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032100,
        "dEQP-GLES3.functional.fbo.blit.rect.o",
        "ut_of_bounds_reverse_src_dst_y_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032101,
        "dEQP-GLES3.functional.fbo.blit.rect.o",
        "ut_of_bounds_reverse_src_dst_y_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032102,
        "dEQP-GLES3.functional.fbo.bli",
        "t.rect.nearest_consistency_mag");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032103,
        "dEQP-GLES3.functional.fbo.blit.rect.",
        "nearest_consistency_mag_reverse_src_x");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032104,
        "dEQP-GLES3.functional.fbo.blit.rect.",
        "nearest_consistency_mag_reverse_src_y");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032105,
        "dEQP-GLES3.functional.fbo.blit.rect.",
        "nearest_consistency_mag_reverse_dst_x");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032106,
        "dEQP-GLES3.functional.fbo.blit.rect.",
        "nearest_consistency_mag_reverse_dst_y");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032107,
        "dEQP-GLES3.functional.fbo.blit.rect.ne",
        "arest_consistency_mag_reverse_src_dst_x");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032108,
        "dEQP-GLES3.functional.fbo.blit.rect.ne",
        "arest_consistency_mag_reverse_src_dst_y");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032109,
        "dEQP-GLES3.functional.fbo.bli",
        "t.rect.nearest_consistency_min");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032110,
        "dEQP-GLES3.functional.fbo.blit.rect.",
        "nearest_consistency_min_reverse_src_x");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032111,
        "dEQP-GLES3.functional.fbo.blit.rect.",
        "nearest_consistency_min_reverse_src_y");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032112,
        "dEQP-GLES3.functional.fbo.blit.rect.",
        "nearest_consistency_min_reverse_dst_x");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032113,
        "dEQP-GLES3.functional.fbo.blit.rect.",
        "nearest_consistency_min_reverse_dst_y");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032114,
        "dEQP-GLES3.functional.fbo.blit.rect.ne",
        "arest_consistency_min_reverse_src_dst_x");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032115,
        "dEQP-GLES3.functional.fbo.blit.rect.ne",
        "arest_consistency_min_reverse_src_dst_y");
