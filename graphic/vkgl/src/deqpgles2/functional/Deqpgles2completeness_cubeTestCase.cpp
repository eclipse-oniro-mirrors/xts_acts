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
#include "../ActsDeqpgles20011TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010890,
        "dEQP-GLES2.functional.texture.co",
        "mpleteness.cube.npot_size_level_0");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010891,
        "dEQP-GLES2.functional.texture.co",
        "mpleteness.cube.npot_size_level_1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010892,
        "dEQP-GLES2.functional.texture.compl",
        "eteness.cube.npot_size_level_0_pos_x");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010893,
        "dEQP-GLES2.functional.texture.compl",
        "eteness.cube.npot_size_level_1_neg_x");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010894,
        "dEQP-GLES2.functional.texture.comp",
        "leteness.cube.not_positive_level_0");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010895,
        "dEQP-GLES2.functional.texture.completene",
        "ss.cube.format_mismatch_rgb_rgba_level_0");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010896,
        "dEQP-GLES2.functional.texture.completene",
        "ss.cube.format_mismatch_rgba_rgb_level_0");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010897,
        "dEQP-GLES2.functional.texture.completeness.cube.",
        "format_mismatch_luminance_luminance_alpha_level_0");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010898,
        "dEQP-GLES2.functional.texture.completeness.cube.",
        "format_mismatch_luminance_alpha_luminance_level_0");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010899,
        "dEQP-GLES2.functional.texture.completeness.",
        "cube.format_mismatch_rgb_rgba_level_0_pos_z");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010900,
        "dEQP-GLES2.functional.texture.completeness.",
        "cube.format_mismatch_rgba_rgb_level_0_neg_z");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010901,
        "dEQP-GLES2.functional.texture.c",
        "ompleteness.cube.missing_level_1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010902,
        "dEQP-GLES2.functional.texture.c",
        "ompleteness.cube.missing_level_3");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010903,
        "dEQP-GLES2.functional.texture.comp",
        "leteness.cube.missing_level_1_pos_y");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010904,
        "dEQP-GLES2.functional.texture.comp",
        "leteness.cube.missing_level_3_neg_y");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010905,
        "dEQP-GLES2.functional.texture.",
        "completeness.cube.npot_t_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010906,
        "dEQP-GLES2.functional.texture.",
        "completeness.cube.npot_s_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010907,
        "dEQP-GLES2.functional.texture.c",
        "ompleteness.cube.npot_all_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010908,
        "dEQP-GLES2.functional.texture.comp",
        "leteness.cube.npot_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010909,
        "dEQP-GLES2.functional.texture",
        ".completeness.cube.extra_level");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010910,
        "dEQP-GLES2.functional.texture.",
        "completeness.cube.empty_object");
