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

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037643,
        "dEQP-GLES31.functional.draw_buffers_indexed.",
        "overwrite_common.common_enable_buffer_enable");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037644,
        "dEQP-GLES31.functional.draw_buffers_indexed.o",
        "verwrite_common.common_disable_buffer_disable");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037645,
        "dEQP-GLES31.functional.draw_buffers_indexed.",
        "overwrite_common.common_disable_buffer_enable");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037646,
        "dEQP-GLES31.functional.draw_buffers_indexed.",
        "overwrite_common.common_enable_buffer_disable");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037647,
        "dEQP-GLES31.functional.draw_buffers_indexed.ov",
        "erwrite_common.common_blend_eq_buffer_blend_eq");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037648,
        "dEQP-GLES31.functional.draw_buffers_indexed.overwr",
        "ite_common.common_blend_eq_buffer_separate_blend_eq");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037649,
        "dEQP-GLES31.functional.draw_buffers_indexed.overwr",
        "ite_common.common_blend_eq_buffer_advanced_blend_eq");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037650,
        "dEQP-GLES31.functional.draw_buffers_indexed.overwr",
        "ite_common.common_separate_blend_eq_buffer_blend_eq");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037651,
        "dEQP-GLES31.functional.draw_buffers_indexed.overwrite_c",
        "ommon.common_separate_blend_eq_buffer_separate_blend_eq");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037652,
        "dEQP-GLES31.functional.draw_buffers_indexed.overwrite_c",
        "ommon.common_separate_blend_eq_buffer_advanced_blend_eq");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037653,
        "dEQP-GLES31.functional.draw_buffers_indexed.overwr",
        "ite_common.common_advanced_blend_eq_buffer_blend_eq");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037654,
        "dEQP-GLES31.functional.draw_buffers_indexed.overwrite_c",
        "ommon.common_advanced_blend_eq_buffer_separate_blend_eq");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037655,
        "dEQP-GLES31.functional.draw_buffers_indexed.overwrite_c",
        "ommon.common_advanced_blend_eq_buffer_advanced_blend_eq");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037656,
        "dEQP-GLES31.functional.draw_buffers_indexed.over",
        "write_common.common_blend_func_buffer_blend_func");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037657,
        "dEQP-GLES31.functional.draw_buffers_indexed.overwrit",
        "e_common.common_blend_func_buffer_separate_blend_func");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037658,
        "dEQP-GLES31.functional.draw_buffers_indexed.overwrit",
        "e_common.common_separate_blend_func_buffer_blend_func");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037659,
        "dEQP-GLES31.functional.draw_buffers_indexed.overwrite_com",
        "mon.common_separate_blend_func_buffer_separate_blend_func");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037660,
        "dEQP-GLES31.functional.draw_buffers_indexed.over",
        "write_common.common_color_mask_buffer_color_mask");
