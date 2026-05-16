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
#include "../ActsDeqpgles310016TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015851,
        "dEQP-GLES31.functional.state_query.text",
        "ure_level.texture_buffer.samples_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015852,
        "dEQP-GLES31.functional.state_query.tex",
        "ture_level.texture_buffer.samples_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015853,
        "dEQP-GLES31.functional.state_query.texture_leve",
        "l.texture_buffer.fixed_sample_locations_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015854,
        "dEQP-GLES31.functional.state_query.texture_lev",
        "el.texture_buffer.fixed_sample_locations_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015855,
        "dEQP-GLES31.functional.state_query.tex",
        "ture_level.texture_buffer.width_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015856,
        "dEQP-GLES31.functional.state_query.te",
        "xture_level.texture_buffer.width_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015857,
        "dEQP-GLES31.functional.state_query.text",
        "ure_level.texture_buffer.height_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015858,
        "dEQP-GLES31.functional.state_query.tex",
        "ture_level.texture_buffer.height_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015859,
        "dEQP-GLES31.functional.state_query.tex",
        "ture_level.texture_buffer.depth_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015860,
        "dEQP-GLES31.functional.state_query.te",
        "xture_level.texture_buffer.depth_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015861,
        "dEQP-GLES31.functional.state_query.texture_",
        "level.texture_buffer.internal_format_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015862,
        "dEQP-GLES31.functional.state_query.texture",
        "_level.texture_buffer.internal_format_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015863,
        "dEQP-GLES31.functional.state_query.textu",
        "re_level.texture_buffer.red_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015864,
        "dEQP-GLES31.functional.state_query.text",
        "ure_level.texture_buffer.red_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015865,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_buffer.green_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015866,
        "dEQP-GLES31.functional.state_query.textu",
        "re_level.texture_buffer.green_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015867,
        "dEQP-GLES31.functional.state_query.textu",
        "re_level.texture_buffer.blue_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015868,
        "dEQP-GLES31.functional.state_query.text",
        "ure_level.texture_buffer.blue_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015869,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_buffer.alpha_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015870,
        "dEQP-GLES31.functional.state_query.textu",
        "re_level.texture_buffer.alpha_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015871,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_buffer.depth_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015872,
        "dEQP-GLES31.functional.state_query.textu",
        "re_level.texture_buffer.depth_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015873,
        "dEQP-GLES31.functional.state_query.texture",
        "_level.texture_buffer.stencil_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015874,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_buffer.stencil_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015875,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_buffer.shared_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015876,
        "dEQP-GLES31.functional.state_query.textu",
        "re_level.texture_buffer.shared_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015877,
        "dEQP-GLES31.functional.state_query.textu",
        "re_level.texture_buffer.red_type_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015878,
        "dEQP-GLES31.functional.state_query.text",
        "ure_level.texture_buffer.red_type_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015879,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_buffer.green_type_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015880,
        "dEQP-GLES31.functional.state_query.textu",
        "re_level.texture_buffer.green_type_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015881,
        "dEQP-GLES31.functional.state_query.textu",
        "re_level.texture_buffer.blue_type_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015882,
        "dEQP-GLES31.functional.state_query.text",
        "ure_level.texture_buffer.blue_type_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015883,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_buffer.alpha_type_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015884,
        "dEQP-GLES31.functional.state_query.textu",
        "re_level.texture_buffer.alpha_type_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015885,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_buffer.depth_type_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015886,
        "dEQP-GLES31.functional.state_query.textu",
        "re_level.texture_buffer.depth_type_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015887,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_buffer.compressed_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015888,
        "dEQP-GLES31.functional.state_query.textu",
        "re_level.texture_buffer.compressed_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015889,
        "dEQP-GLES31.functional.state_query.texture_level",
        ".texture_buffer.buffer_data_store_binding_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015890,
        "dEQP-GLES31.functional.state_query.texture_leve",
        "l.texture_buffer.buffer_data_store_binding_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015891,
        "dEQP-GLES31.functional.state_query.texture",
        "_level.texture_buffer.buffer_offset_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015892,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_buffer.buffer_offset_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015893,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_buffer.buffer_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015894,
        "dEQP-GLES31.functional.state_query.textu",
        "re_level.texture_buffer.buffer_size_float");
