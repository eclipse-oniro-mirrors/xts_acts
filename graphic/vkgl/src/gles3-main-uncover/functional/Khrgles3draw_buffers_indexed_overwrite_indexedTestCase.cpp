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

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000322,
        "dEQP-GLES3.functional.draw_buffers_indexed.o",
        "verwrite_indexed.common_enable_buffer_enable");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000323,
        "dEQP-GLES3.functional.draw_buffers_indexed.ov",
        "erwrite_indexed.common_disable_buffer_disable");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000324,
        "dEQP-GLES3.functional.draw_buffers_indexed.o",
        "verwrite_indexed.common_disable_buffer_enable");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000325,
        "dEQP-GLES3.functional.draw_buffers_indexed.o",
        "verwrite_indexed.common_enable_buffer_disable");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000326,
        "dEQP-GLES3.functional.draw_buffers_indexed.ove",
        "rwrite_indexed.common_blend_eq_buffer_blend_eq");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000327,
        "dEQP-GLES3.functional.draw_buffers_indexed.overwri",
        "te_indexed.common_blend_eq_buffer_separate_blend_eq");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000328,
        "dEQP-GLES3.functional.draw_buffers_indexed.overwri",
        "te_indexed.common_blend_eq_buffer_advanced_blend_eq");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000329,
        "dEQP-GLES3.functional.draw_buffers_indexed.overwri",
        "te_indexed.common_separate_blend_eq_buffer_blend_eq");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000330,
        "dEQP-GLES3.functional.draw_buffers_indexed.overwrite_in",
        "dexed.common_separate_blend_eq_buffer_separate_blend_eq");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000331,
        "dEQP-GLES3.functional.draw_buffers_indexed.overwrite_in",
        "dexed.common_separate_blend_eq_buffer_advanced_blend_eq");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000332,
        "dEQP-GLES3.functional.draw_buffers_indexed.overwri",
        "te_indexed.common_advanced_blend_eq_buffer_blend_eq");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000333,
        "dEQP-GLES3.functional.draw_buffers_indexed.overwrite_in",
        "dexed.common_advanced_blend_eq_buffer_separate_blend_eq");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000334,
        "dEQP-GLES3.functional.draw_buffers_indexed.overwrite_in",
        "dexed.common_advanced_blend_eq_buffer_advanced_blend_eq");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000335,
        "dEQP-GLES3.functional.draw_buffers_indexed.overw",
        "rite_indexed.common_blend_func_buffer_blend_func");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000336,
        "dEQP-GLES3.functional.draw_buffers_indexed.overwrite",
        "_indexed.common_blend_func_buffer_separate_blend_func");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000337,
        "dEQP-GLES3.functional.draw_buffers_indexed.overwrite",
        "_indexed.common_separate_blend_func_buffer_blend_func");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000338,
        "dEQP-GLES3.functional.draw_buffers_indexed.overwrite_inde",
        "xed.common_separate_blend_func_buffer_separate_blend_func");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000339,
        "dEQP-GLES3.functional.draw_buffers_indexed.overw",
        "rite_indexed.common_color_mask_buffer_color_mask");
