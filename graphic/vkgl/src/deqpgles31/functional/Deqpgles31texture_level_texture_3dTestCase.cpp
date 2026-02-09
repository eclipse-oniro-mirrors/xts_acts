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

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015631,
        "dEQP-GLES31.functional.state_query.te",
        "xture_level.texture_3d.samples_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015632,
        "dEQP-GLES31.functional.state_query.t",
        "exture_level.texture_3d.samples_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015633,
        "dEQP-GLES31.functional.state_query.texture_le",
        "vel.texture_3d.fixed_sample_locations_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015634,
        "dEQP-GLES31.functional.state_query.texture_l",
        "evel.texture_3d.fixed_sample_locations_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015635,
        "dEQP-GLES31.functional.state_query.t",
        "exture_level.texture_3d.width_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015636,
        "dEQP-GLES31.functional.state_query.",
        "texture_level.texture_3d.width_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015637,
        "dEQP-GLES31.functional.state_query.te",
        "xture_level.texture_3d.height_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015638,
        "dEQP-GLES31.functional.state_query.t",
        "exture_level.texture_3d.height_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015639,
        "dEQP-GLES31.functional.state_query.t",
        "exture_level.texture_3d.depth_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015640,
        "dEQP-GLES31.functional.state_query.",
        "texture_level.texture_3d.depth_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015641,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_3d.internal_format_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015642,
        "dEQP-GLES31.functional.state_query.textu",
        "re_level.texture_3d.internal_format_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015643,
        "dEQP-GLES31.functional.state_query.tex",
        "ture_level.texture_3d.red_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015644,
        "dEQP-GLES31.functional.state_query.te",
        "xture_level.texture_3d.red_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015645,
        "dEQP-GLES31.functional.state_query.text",
        "ure_level.texture_3d.green_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015646,
        "dEQP-GLES31.functional.state_query.tex",
        "ture_level.texture_3d.green_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015647,
        "dEQP-GLES31.functional.state_query.tex",
        "ture_level.texture_3d.blue_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015648,
        "dEQP-GLES31.functional.state_query.te",
        "xture_level.texture_3d.blue_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015649,
        "dEQP-GLES31.functional.state_query.text",
        "ure_level.texture_3d.alpha_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015650,
        "dEQP-GLES31.functional.state_query.tex",
        "ture_level.texture_3d.alpha_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015651,
        "dEQP-GLES31.functional.state_query.text",
        "ure_level.texture_3d.depth_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015652,
        "dEQP-GLES31.functional.state_query.tex",
        "ture_level.texture_3d.depth_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015653,
        "dEQP-GLES31.functional.state_query.textu",
        "re_level.texture_3d.stencil_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015654,
        "dEQP-GLES31.functional.state_query.text",
        "ure_level.texture_3d.stencil_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015655,
        "dEQP-GLES31.functional.state_query.text",
        "ure_level.texture_3d.shared_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015656,
        "dEQP-GLES31.functional.state_query.tex",
        "ture_level.texture_3d.shared_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015657,
        "dEQP-GLES31.functional.state_query.tex",
        "ture_level.texture_3d.red_type_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015658,
        "dEQP-GLES31.functional.state_query.te",
        "xture_level.texture_3d.red_type_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015659,
        "dEQP-GLES31.functional.state_query.text",
        "ure_level.texture_3d.green_type_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015660,
        "dEQP-GLES31.functional.state_query.tex",
        "ture_level.texture_3d.green_type_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015661,
        "dEQP-GLES31.functional.state_query.tex",
        "ture_level.texture_3d.blue_type_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015662,
        "dEQP-GLES31.functional.state_query.te",
        "xture_level.texture_3d.blue_type_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015663,
        "dEQP-GLES31.functional.state_query.text",
        "ure_level.texture_3d.alpha_type_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015664,
        "dEQP-GLES31.functional.state_query.tex",
        "ture_level.texture_3d.alpha_type_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015665,
        "dEQP-GLES31.functional.state_query.text",
        "ure_level.texture_3d.depth_type_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015666,
        "dEQP-GLES31.functional.state_query.tex",
        "ture_level.texture_3d.depth_type_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015667,
        "dEQP-GLES31.functional.state_query.text",
        "ure_level.texture_3d.compressed_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015668,
        "dEQP-GLES31.functional.state_query.tex",
        "ture_level.texture_3d.compressed_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015669,
        "dEQP-GLES31.functional.state_query.texture_lev",
        "el.texture_3d.buffer_data_store_binding_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015670,
        "dEQP-GLES31.functional.state_query.texture_le",
        "vel.texture_3d.buffer_data_store_binding_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015671,
        "dEQP-GLES31.functional.state_query.textu",
        "re_level.texture_3d.buffer_offset_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015672,
        "dEQP-GLES31.functional.state_query.text",
        "ure_level.texture_3d.buffer_offset_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015673,
        "dEQP-GLES31.functional.state_query.text",
        "ure_level.texture_3d.buffer_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015674,
        "dEQP-GLES31.functional.state_query.tex",
        "ture_level.texture_3d.buffer_size_float");
