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

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015434,
        "dEQP-GLES31.functional.state_query.textur",
        "e.texture_2d_multisample_array.is_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015435,
        "dEQP-GLES31.functional.state_query.texture.textu",
        "re_2d_multisample_array.texture_swizzle_r_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015436,
        "dEQP-GLES31.functional.state_query.texture.text",
        "ure_2d_multisample_array.texture_swizzle_r_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015437,
        "dEQP-GLES31.functional.state_query.texture.textur",
        "e_2d_multisample_array.texture_swizzle_r_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015438,
        "dEQP-GLES31.functional.state_query.texture.textur",
        "e_2d_multisample_array.texture_swizzle_r_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015439,
        "dEQP-GLES31.functional.state_query.texture.textu",
        "re_2d_multisample_array.texture_swizzle_g_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015440,
        "dEQP-GLES31.functional.state_query.texture.text",
        "ure_2d_multisample_array.texture_swizzle_g_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015441,
        "dEQP-GLES31.functional.state_query.texture.textur",
        "e_2d_multisample_array.texture_swizzle_g_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015442,
        "dEQP-GLES31.functional.state_query.texture.textur",
        "e_2d_multisample_array.texture_swizzle_g_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015443,
        "dEQP-GLES31.functional.state_query.texture.textu",
        "re_2d_multisample_array.texture_swizzle_b_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015444,
        "dEQP-GLES31.functional.state_query.texture.text",
        "ure_2d_multisample_array.texture_swizzle_b_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015445,
        "dEQP-GLES31.functional.state_query.texture.textur",
        "e_2d_multisample_array.texture_swizzle_b_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015446,
        "dEQP-GLES31.functional.state_query.texture.textur",
        "e_2d_multisample_array.texture_swizzle_b_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015447,
        "dEQP-GLES31.functional.state_query.texture.textu",
        "re_2d_multisample_array.texture_swizzle_a_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015448,
        "dEQP-GLES31.functional.state_query.texture.text",
        "ure_2d_multisample_array.texture_swizzle_a_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015449,
        "dEQP-GLES31.functional.state_query.texture.textur",
        "e_2d_multisample_array.texture_swizzle_a_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015450,
        "dEQP-GLES31.functional.state_query.texture.textur",
        "e_2d_multisample_array.texture_swizzle_a_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015451,
        "dEQP-GLES31.functional.state_query.texture.textur",
        "e_2d_multisample_array.texture_base_level_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015452,
        "dEQP-GLES31.functional.state_query.texture.textu",
        "re_2d_multisample_array.texture_base_level_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015453,
        "dEQP-GLES31.functional.state_query.texture.textur",
        "e_2d_multisample_array.texture_base_level_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015454,
        "dEQP-GLES31.functional.state_query.texture.texture",
        "_2d_multisample_array.texture_base_level_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015455,
        "dEQP-GLES31.functional.state_query.texture.textu",
        "re_2d_multisample_array.texture_max_level_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015456,
        "dEQP-GLES31.functional.state_query.texture.text",
        "ure_2d_multisample_array.texture_max_level_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015457,
        "dEQP-GLES31.functional.state_query.texture.textur",
        "e_2d_multisample_array.texture_max_level_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015458,
        "dEQP-GLES31.functional.state_query.texture.textur",
        "e_2d_multisample_array.texture_max_level_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015459,
        "dEQP-GLES31.functional.state_query.texture.texture_2",
        "d_multisample_array.texture_immutable_levels_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015460,
        "dEQP-GLES31.functional.state_query.texture.texture_",
        "2d_multisample_array.texture_immutable_levels_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015461,
        "dEQP-GLES31.functional.state_query.texture.texture_2",
        "d_multisample_array.texture_immutable_levels_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015462,
        "dEQP-GLES31.functional.state_query.texture.texture_2d",
        "_multisample_array.texture_immutable_levels_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015463,
        "dEQP-GLES31.functional.state_query.texture.texture_2",
        "d_multisample_array.texture_immutable_format_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015464,
        "dEQP-GLES31.functional.state_query.texture.texture_",
        "2d_multisample_array.texture_immutable_format_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015465,
        "dEQP-GLES31.functional.state_query.texture.texture_2",
        "d_multisample_array.texture_immutable_format_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015466,
        "dEQP-GLES31.functional.state_query.texture.texture_2d",
        "_multisample_array.texture_immutable_format_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015467,
        "dEQP-GLES31.functional.state_query.texture.textur",
        "e_2d_multisample_array.depth_stencil_mode_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015468,
        "dEQP-GLES31.functional.state_query.texture.textu",
        "re_2d_multisample_array.depth_stencil_mode_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015469,
        "dEQP-GLES31.functional.state_query.texture.textur",
        "e_2d_multisample_array.depth_stencil_mode_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015470,
        "dEQP-GLES31.functional.state_query.texture.texture",
        "_2d_multisample_array.depth_stencil_mode_pure_uint");
