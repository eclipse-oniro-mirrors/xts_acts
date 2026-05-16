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

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000304,
        "dEQP-GLES3.functional.draw_buffers_indexed.",
        "overwrite_common.common_enable_buffer_enable");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000305,
        "dEQP-GLES3.functional.draw_buffers_indexed.o",
        "verwrite_common.common_disable_buffer_disable");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000306,
        "dEQP-GLES3.functional.draw_buffers_indexed.o",
        "verwrite_common.common_disable_buffer_enable");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000307,
        "dEQP-GLES3.functional.draw_buffers_indexed.o",
        "verwrite_common.common_enable_buffer_disable");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000308,
        "dEQP-GLES3.functional.draw_buffers_indexed.ov",
        "erwrite_common.common_blend_eq_buffer_blend_eq");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000309,
        "dEQP-GLES3.functional.draw_buffers_indexed.overwri",
        "te_common.common_blend_eq_buffer_separate_blend_eq");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000310,
        "dEQP-GLES3.functional.draw_buffers_indexed.overwri",
        "te_common.common_blend_eq_buffer_advanced_blend_eq");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000311,
        "dEQP-GLES3.functional.draw_buffers_indexed.overwri",
        "te_common.common_separate_blend_eq_buffer_blend_eq");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000312,
        "dEQP-GLES3.functional.draw_buffers_indexed.overwrite_c",
        "ommon.common_separate_blend_eq_buffer_separate_blend_eq");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000313,
        "dEQP-GLES3.functional.draw_buffers_indexed.overwrite_c",
        "ommon.common_separate_blend_eq_buffer_advanced_blend_eq");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000314,
        "dEQP-GLES3.functional.draw_buffers_indexed.overwri",
        "te_common.common_advanced_blend_eq_buffer_blend_eq");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000315,
        "dEQP-GLES3.functional.draw_buffers_indexed.overwrite_c",
        "ommon.common_advanced_blend_eq_buffer_separate_blend_eq");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000316,
        "dEQP-GLES3.functional.draw_buffers_indexed.overwrite_c",
        "ommon.common_advanced_blend_eq_buffer_advanced_blend_eq");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000317,
        "dEQP-GLES3.functional.draw_buffers_indexed.over",
        "write_common.common_blend_func_buffer_blend_func");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000318,
        "dEQP-GLES3.functional.draw_buffers_indexed.overwrite",
        "_common.common_blend_func_buffer_separate_blend_func");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000319,
        "dEQP-GLES3.functional.draw_buffers_indexed.overwrite",
        "_common.common_separate_blend_func_buffer_blend_func");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000320,
        "dEQP-GLES3.functional.draw_buffers_indexed.overwrite_com",
        "mon.common_separate_blend_func_buffer_separate_blend_func");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000321,
        "dEQP-GLES3.functional.draw_buffers_indexed.over",
        "write_common.common_color_mask_buffer_color_mask");
