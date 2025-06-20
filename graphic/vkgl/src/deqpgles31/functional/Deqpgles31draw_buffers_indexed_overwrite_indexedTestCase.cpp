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
#include "../ActsDeqpgles310038TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037661,
        "dEQP-GLES31.functional.draw_buffers_indexed.",
        "overwrite_indexed.common_enable_buffer_enable");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037662,
        "dEQP-GLES31.functional.draw_buffers_indexed.o",
        "verwrite_indexed.common_disable_buffer_disable");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037663,
        "dEQP-GLES31.functional.draw_buffers_indexed.o",
        "verwrite_indexed.common_disable_buffer_enable");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037664,
        "dEQP-GLES31.functional.draw_buffers_indexed.o",
        "verwrite_indexed.common_enable_buffer_disable");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037665,
        "dEQP-GLES31.functional.draw_buffers_indexed.ov",
        "erwrite_indexed.common_blend_eq_buffer_blend_eq");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037666,
        "dEQP-GLES31.functional.draw_buffers_indexed.overwri",
        "te_indexed.common_blend_eq_buffer_separate_blend_eq");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037667,
        "dEQP-GLES31.functional.draw_buffers_indexed.overwri",
        "te_indexed.common_blend_eq_buffer_advanced_blend_eq");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037668,
        "dEQP-GLES31.functional.draw_buffers_indexed.overwri",
        "te_indexed.common_separate_blend_eq_buffer_blend_eq");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037669,
        "dEQP-GLES31.functional.draw_buffers_indexed.overwrite_i",
        "ndexed.common_separate_blend_eq_buffer_separate_blend_eq");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037670,
        "dEQP-GLES31.functional.draw_buffers_indexed.overwrite_i",
        "ndexed.common_separate_blend_eq_buffer_advanced_blend_eq");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037671,
        "dEQP-GLES31.functional.draw_buffers_indexed.overwri",
        "te_indexed.common_advanced_blend_eq_buffer_blend_eq");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037672,
        "dEQP-GLES31.functional.draw_buffers_indexed.overwrite_i",
        "ndexed.common_advanced_blend_eq_buffer_separate_blend_eq");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037673,
        "dEQP-GLES31.functional.draw_buffers_indexed.overwrite_i",
        "ndexed.common_advanced_blend_eq_buffer_advanced_blend_eq");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037674,
        "dEQP-GLES31.functional.draw_buffers_indexed.over",
        "write_indexed.common_blend_func_buffer_blend_func");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037675,
        "dEQP-GLES31.functional.draw_buffers_indexed.overwrite",
        "_indexed.common_blend_func_buffer_separate_blend_func");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037676,
        "dEQP-GLES31.functional.draw_buffers_indexed.overwrite",
        "_indexed.common_separate_blend_func_buffer_blend_func");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037677,
        "dEQP-GLES31.functional.draw_buffers_indexed.overwrite_ind",
        "exed.common_separate_blend_func_buffer_separate_blend_func");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037678,
        "dEQP-GLES31.functional.draw_buffers_indexed.over",
        "write_indexed.common_color_mask_buffer_color_mask");
