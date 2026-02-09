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

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010871,
        "dEQP-GLES2.functional.textu",
        "re.completeness.2d.npot_size");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010872,
        "dEQP-GLES2.functional.texture.c",
        "ompleteness.2d.npot_size_level_0");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010873,
        "dEQP-GLES2.functional.texture.c",
        "ompleteness.2d.npot_size_level_1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010874,
        "dEQP-GLES2.functional.texture.com",
        "pleteness.2d.not_positive_level_0");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010875,
        "dEQP-GLES2.functional.texture.compl",
        "eteness.2d.format_mismatch_rgb_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010876,
        "dEQP-GLES2.functional.texture.compl",
        "eteness.2d.format_mismatch_rgba_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010877,
        "dEQP-GLES2.functional.texture.completeness.",
        "2d.format_mismatch_luminance_luminance_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010878,
        "dEQP-GLES2.functional.texture.completeness.",
        "2d.format_mismatch_luminance_alpha_luminance");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010879,
        "dEQP-GLES2.functional.texture.",
        "completeness.2d.missing_level_1");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010880,
        "dEQP-GLES2.functional.texture.",
        "completeness.2d.missing_level_3");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010881,
        "dEQP-GLES2.functional.texture.co",
        "mpleteness.2d.last_level_missing");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010882,
        "dEQP-GLES2.functional.texture",
        ".completeness.2d.npot_t_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010883,
        "dEQP-GLES2.functional.texture",
        ".completeness.2d.npot_s_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010884,
        "dEQP-GLES2.functional.texture.",
        "completeness.2d.npot_all_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010885,
        "dEQP-GLES2.functional.texture.com",
        "pleteness.2d.npot_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010886,
        "dEQP-GLES2.functional.texture.c",
        "ompleteness.2d.repeat_width_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010887,
        "dEQP-GLES2.functional.texture.co",
        "mpleteness.2d.repeat_height_npot");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010888,
        "dEQP-GLES2.functional.textur",
        "e.completeness.2d.extra_level");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010889,
        "dEQP-GLES2.functional.texture",
        ".completeness.2d.empty_object");
