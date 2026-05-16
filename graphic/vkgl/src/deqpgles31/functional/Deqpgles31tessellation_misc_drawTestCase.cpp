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
#include "../ActsDeqpgles310008TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007992,
        "dEQP-GLES31.functional.tessellation.misc",
        "_draw.fill_cover_triangles_equal_spacing");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007993,
        "dEQP-GLES31.functional.tessellation.misc_dra",
        "w.fill_cover_triangles_fractional_odd_spacing");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007994,
        "dEQP-GLES31.functional.tessellation.misc_draw",
        ".fill_cover_triangles_fractional_even_spacing");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007995,
        "dEQP-GLES31.functional.tessellation.mi",
        "sc_draw.fill_cover_quads_equal_spacing");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007996,
        "dEQP-GLES31.functional.tessellation.misc_d",
        "raw.fill_cover_quads_fractional_odd_spacing");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007997,
        "dEQP-GLES31.functional.tessellation.misc_dr",
        "aw.fill_cover_quads_fractional_even_spacing");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007998,
        "dEQP-GLES31.functional.tessellation.misc_",
        "draw.fill_overlap_triangles_equal_spacing");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007999,
        "dEQP-GLES31.functional.tessellation.misc_draw",
        ".fill_overlap_triangles_fractional_odd_spacing");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_008000,
        "dEQP-GLES31.functional.tessellation.misc_draw.",
        "fill_overlap_triangles_fractional_even_spacing");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_008001,
        "dEQP-GLES31.functional.tessellation.mis",
        "c_draw.fill_overlap_quads_equal_spacing");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_008002,
        "dEQP-GLES31.functional.tessellation.misc_dr",
        "aw.fill_overlap_quads_fractional_odd_spacing");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_008003,
        "dEQP-GLES31.functional.tessellation.misc_dra",
        "w.fill_overlap_quads_fractional_even_spacing");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_008004,
        "dEQP-GLES31.functional.tessellatio",
        "n.misc_draw.isolines_equal_spacing");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_008005,
        "dEQP-GLES31.functional.tessellation.mi",
        "sc_draw.isolines_fractional_odd_spacing");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_008006,
        "dEQP-GLES31.functional.tessellation.mis",
        "c_draw.isolines_fractional_even_spacing");
