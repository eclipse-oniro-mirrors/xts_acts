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

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015807,
        "dEQP-GLES31.functional.state_query.texture_lev",
        "el.texture_2d_multisample_array.samples_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015808,
        "dEQP-GLES31.functional.state_query.texture_le",
        "vel.texture_2d_multisample_array.samples_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015809,
        "dEQP-GLES31.functional.state_query.texture_level.textu",
        "re_2d_multisample_array.fixed_sample_locations_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015810,
        "dEQP-GLES31.functional.state_query.texture_level.text",
        "ure_2d_multisample_array.fixed_sample_locations_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015811,
        "dEQP-GLES31.functional.state_query.texture_le",
        "vel.texture_2d_multisample_array.width_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015812,
        "dEQP-GLES31.functional.state_query.texture_l",
        "evel.texture_2d_multisample_array.width_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015813,
        "dEQP-GLES31.functional.state_query.texture_lev",
        "el.texture_2d_multisample_array.height_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015814,
        "dEQP-GLES31.functional.state_query.texture_le",
        "vel.texture_2d_multisample_array.height_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015815,
        "dEQP-GLES31.functional.state_query.texture_le",
        "vel.texture_2d_multisample_array.depth_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015816,
        "dEQP-GLES31.functional.state_query.texture_l",
        "evel.texture_2d_multisample_array.depth_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015817,
        "dEQP-GLES31.functional.state_query.texture_level.t",
        "exture_2d_multisample_array.internal_format_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015818,
        "dEQP-GLES31.functional.state_query.texture_level.",
        "texture_2d_multisample_array.internal_format_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015819,
        "dEQP-GLES31.functional.state_query.texture_leve",
        "l.texture_2d_multisample_array.red_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015820,
        "dEQP-GLES31.functional.state_query.texture_lev",
        "el.texture_2d_multisample_array.red_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015821,
        "dEQP-GLES31.functional.state_query.texture_level",
        ".texture_2d_multisample_array.green_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015822,
        "dEQP-GLES31.functional.state_query.texture_leve",
        "l.texture_2d_multisample_array.green_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015823,
        "dEQP-GLES31.functional.state_query.texture_leve",
        "l.texture_2d_multisample_array.blue_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015824,
        "dEQP-GLES31.functional.state_query.texture_lev",
        "el.texture_2d_multisample_array.blue_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015825,
        "dEQP-GLES31.functional.state_query.texture_level",
        ".texture_2d_multisample_array.alpha_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015826,
        "dEQP-GLES31.functional.state_query.texture_leve",
        "l.texture_2d_multisample_array.alpha_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015827,
        "dEQP-GLES31.functional.state_query.texture_level",
        ".texture_2d_multisample_array.depth_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015828,
        "dEQP-GLES31.functional.state_query.texture_leve",
        "l.texture_2d_multisample_array.depth_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015829,
        "dEQP-GLES31.functional.state_query.texture_level.",
        "texture_2d_multisample_array.stencil_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015830,
        "dEQP-GLES31.functional.state_query.texture_level",
        ".texture_2d_multisample_array.stencil_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015831,
        "dEQP-GLES31.functional.state_query.texture_level",
        ".texture_2d_multisample_array.shared_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015832,
        "dEQP-GLES31.functional.state_query.texture_leve",
        "l.texture_2d_multisample_array.shared_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015833,
        "dEQP-GLES31.functional.state_query.texture_leve",
        "l.texture_2d_multisample_array.red_type_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015834,
        "dEQP-GLES31.functional.state_query.texture_lev",
        "el.texture_2d_multisample_array.red_type_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015835,
        "dEQP-GLES31.functional.state_query.texture_level",
        ".texture_2d_multisample_array.green_type_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015836,
        "dEQP-GLES31.functional.state_query.texture_leve",
        "l.texture_2d_multisample_array.green_type_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015837,
        "dEQP-GLES31.functional.state_query.texture_leve",
        "l.texture_2d_multisample_array.blue_type_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015838,
        "dEQP-GLES31.functional.state_query.texture_lev",
        "el.texture_2d_multisample_array.blue_type_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015839,
        "dEQP-GLES31.functional.state_query.texture_level",
        ".texture_2d_multisample_array.alpha_type_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015840,
        "dEQP-GLES31.functional.state_query.texture_leve",
        "l.texture_2d_multisample_array.alpha_type_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015841,
        "dEQP-GLES31.functional.state_query.texture_level",
        ".texture_2d_multisample_array.depth_type_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015842,
        "dEQP-GLES31.functional.state_query.texture_leve",
        "l.texture_2d_multisample_array.depth_type_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015843,
        "dEQP-GLES31.functional.state_query.texture_level",
        ".texture_2d_multisample_array.compressed_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015844,
        "dEQP-GLES31.functional.state_query.texture_leve",
        "l.texture_2d_multisample_array.compressed_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015845,
        "dEQP-GLES31.functional.state_query.texture_level.textur",
        "e_2d_multisample_array.buffer_data_store_binding_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015846,
        "dEQP-GLES31.functional.state_query.texture_level.textu",
        "re_2d_multisample_array.buffer_data_store_binding_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015847,
        "dEQP-GLES31.functional.state_query.texture_level.",
        "texture_2d_multisample_array.buffer_offset_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015848,
        "dEQP-GLES31.functional.state_query.texture_level",
        ".texture_2d_multisample_array.buffer_offset_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015849,
        "dEQP-GLES31.functional.state_query.texture_level",
        ".texture_2d_multisample_array.buffer_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015850,
        "dEQP-GLES31.functional.state_query.texture_leve",
        "l.texture_2d_multisample_array.buffer_size_float");
