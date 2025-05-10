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

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015587,
        "dEQP-GLES31.functional.state_query.te",
        "xture_level.texture_2d.samples_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015588,
        "dEQP-GLES31.functional.state_query.t",
        "exture_level.texture_2d.samples_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015589,
        "dEQP-GLES31.functional.state_query.texture_le",
        "vel.texture_2d.fixed_sample_locations_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015590,
        "dEQP-GLES31.functional.state_query.texture_l",
        "evel.texture_2d.fixed_sample_locations_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015591,
        "dEQP-GLES31.functional.state_query.t",
        "exture_level.texture_2d.width_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015592,
        "dEQP-GLES31.functional.state_query.",
        "texture_level.texture_2d.width_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015593,
        "dEQP-GLES31.functional.state_query.te",
        "xture_level.texture_2d.height_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015594,
        "dEQP-GLES31.functional.state_query.t",
        "exture_level.texture_2d.height_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015595,
        "dEQP-GLES31.functional.state_query.t",
        "exture_level.texture_2d.depth_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015596,
        "dEQP-GLES31.functional.state_query.",
        "texture_level.texture_2d.depth_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015597,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_2d.internal_format_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015598,
        "dEQP-GLES31.functional.state_query.textu",
        "re_level.texture_2d.internal_format_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015599,
        "dEQP-GLES31.functional.state_query.tex",
        "ture_level.texture_2d.red_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015600,
        "dEQP-GLES31.functional.state_query.te",
        "xture_level.texture_2d.red_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015601,
        "dEQP-GLES31.functional.state_query.text",
        "ure_level.texture_2d.green_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015602,
        "dEQP-GLES31.functional.state_query.tex",
        "ture_level.texture_2d.green_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015603,
        "dEQP-GLES31.functional.state_query.tex",
        "ture_level.texture_2d.blue_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015604,
        "dEQP-GLES31.functional.state_query.te",
        "xture_level.texture_2d.blue_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015605,
        "dEQP-GLES31.functional.state_query.text",
        "ure_level.texture_2d.alpha_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015606,
        "dEQP-GLES31.functional.state_query.tex",
        "ture_level.texture_2d.alpha_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015607,
        "dEQP-GLES31.functional.state_query.text",
        "ure_level.texture_2d.depth_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015608,
        "dEQP-GLES31.functional.state_query.tex",
        "ture_level.texture_2d.depth_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015609,
        "dEQP-GLES31.functional.state_query.textu",
        "re_level.texture_2d.stencil_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015610,
        "dEQP-GLES31.functional.state_query.text",
        "ure_level.texture_2d.stencil_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015611,
        "dEQP-GLES31.functional.state_query.text",
        "ure_level.texture_2d.shared_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015612,
        "dEQP-GLES31.functional.state_query.tex",
        "ture_level.texture_2d.shared_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015613,
        "dEQP-GLES31.functional.state_query.tex",
        "ture_level.texture_2d.red_type_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015614,
        "dEQP-GLES31.functional.state_query.te",
        "xture_level.texture_2d.red_type_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015615,
        "dEQP-GLES31.functional.state_query.text",
        "ure_level.texture_2d.green_type_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015616,
        "dEQP-GLES31.functional.state_query.tex",
        "ture_level.texture_2d.green_type_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015617,
        "dEQP-GLES31.functional.state_query.tex",
        "ture_level.texture_2d.blue_type_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015618,
        "dEQP-GLES31.functional.state_query.te",
        "xture_level.texture_2d.blue_type_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015619,
        "dEQP-GLES31.functional.state_query.text",
        "ure_level.texture_2d.alpha_type_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015620,
        "dEQP-GLES31.functional.state_query.tex",
        "ture_level.texture_2d.alpha_type_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015621,
        "dEQP-GLES31.functional.state_query.text",
        "ure_level.texture_2d.depth_type_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015622,
        "dEQP-GLES31.functional.state_query.tex",
        "ture_level.texture_2d.depth_type_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015623,
        "dEQP-GLES31.functional.state_query.text",
        "ure_level.texture_2d.compressed_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015624,
        "dEQP-GLES31.functional.state_query.tex",
        "ture_level.texture_2d.compressed_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015625,
        "dEQP-GLES31.functional.state_query.texture_lev",
        "el.texture_2d.buffer_data_store_binding_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015626,
        "dEQP-GLES31.functional.state_query.texture_le",
        "vel.texture_2d.buffer_data_store_binding_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015627,
        "dEQP-GLES31.functional.state_query.textu",
        "re_level.texture_2d.buffer_offset_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015628,
        "dEQP-GLES31.functional.state_query.text",
        "ure_level.texture_2d.buffer_offset_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015629,
        "dEQP-GLES31.functional.state_query.text",
        "ure_level.texture_2d.buffer_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015630,
        "dEQP-GLES31.functional.state_query.tex",
        "ture_level.texture_2d.buffer_size_float");
