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

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015397,
        "dEQP-GLES31.functional.state_query.tex",
        "ture.texture_2d_multisample.is_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015398,
        "dEQP-GLES31.functional.state_query.texture.te",
        "xture_2d_multisample.texture_swizzle_r_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015399,
        "dEQP-GLES31.functional.state_query.texture.t",
        "exture_2d_multisample.texture_swizzle_r_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015400,
        "dEQP-GLES31.functional.state_query.texture.tex",
        "ture_2d_multisample.texture_swizzle_r_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015401,
        "dEQP-GLES31.functional.state_query.texture.tex",
        "ture_2d_multisample.texture_swizzle_r_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015402,
        "dEQP-GLES31.functional.state_query.texture.te",
        "xture_2d_multisample.texture_swizzle_g_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015403,
        "dEQP-GLES31.functional.state_query.texture.t",
        "exture_2d_multisample.texture_swizzle_g_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015404,
        "dEQP-GLES31.functional.state_query.texture.tex",
        "ture_2d_multisample.texture_swizzle_g_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015405,
        "dEQP-GLES31.functional.state_query.texture.tex",
        "ture_2d_multisample.texture_swizzle_g_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015406,
        "dEQP-GLES31.functional.state_query.texture.te",
        "xture_2d_multisample.texture_swizzle_b_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015407,
        "dEQP-GLES31.functional.state_query.texture.t",
        "exture_2d_multisample.texture_swizzle_b_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015408,
        "dEQP-GLES31.functional.state_query.texture.tex",
        "ture_2d_multisample.texture_swizzle_b_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015409,
        "dEQP-GLES31.functional.state_query.texture.tex",
        "ture_2d_multisample.texture_swizzle_b_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015410,
        "dEQP-GLES31.functional.state_query.texture.te",
        "xture_2d_multisample.texture_swizzle_a_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015411,
        "dEQP-GLES31.functional.state_query.texture.t",
        "exture_2d_multisample.texture_swizzle_a_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015412,
        "dEQP-GLES31.functional.state_query.texture.tex",
        "ture_2d_multisample.texture_swizzle_a_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015413,
        "dEQP-GLES31.functional.state_query.texture.tex",
        "ture_2d_multisample.texture_swizzle_a_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015414,
        "dEQP-GLES31.functional.state_query.texture.tex",
        "ture_2d_multisample.texture_base_level_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015415,
        "dEQP-GLES31.functional.state_query.texture.te",
        "xture_2d_multisample.texture_base_level_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015416,
        "dEQP-GLES31.functional.state_query.texture.tex",
        "ture_2d_multisample.texture_base_level_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015417,
        "dEQP-GLES31.functional.state_query.texture.text",
        "ure_2d_multisample.texture_base_level_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015418,
        "dEQP-GLES31.functional.state_query.texture.te",
        "xture_2d_multisample.texture_max_level_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015419,
        "dEQP-GLES31.functional.state_query.texture.t",
        "exture_2d_multisample.texture_max_level_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015420,
        "dEQP-GLES31.functional.state_query.texture.tex",
        "ture_2d_multisample.texture_max_level_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015421,
        "dEQP-GLES31.functional.state_query.texture.tex",
        "ture_2d_multisample.texture_max_level_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015422,
        "dEQP-GLES31.functional.state_query.texture.textur",
        "e_2d_multisample.texture_immutable_levels_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015423,
        "dEQP-GLES31.functional.state_query.texture.textu",
        "re_2d_multisample.texture_immutable_levels_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015424,
        "dEQP-GLES31.functional.state_query.texture.textur",
        "e_2d_multisample.texture_immutable_levels_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015425,
        "dEQP-GLES31.functional.state_query.texture.texture",
        "_2d_multisample.texture_immutable_levels_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015426,
        "dEQP-GLES31.functional.state_query.texture.textur",
        "e_2d_multisample.texture_immutable_format_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015427,
        "dEQP-GLES31.functional.state_query.texture.textu",
        "re_2d_multisample.texture_immutable_format_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015428,
        "dEQP-GLES31.functional.state_query.texture.textur",
        "e_2d_multisample.texture_immutable_format_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015429,
        "dEQP-GLES31.functional.state_query.texture.texture",
        "_2d_multisample.texture_immutable_format_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015430,
        "dEQP-GLES31.functional.state_query.texture.tex",
        "ture_2d_multisample.depth_stencil_mode_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015431,
        "dEQP-GLES31.functional.state_query.texture.te",
        "xture_2d_multisample.depth_stencil_mode_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015432,
        "dEQP-GLES31.functional.state_query.texture.tex",
        "ture_2d_multisample.depth_stencil_mode_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015433,
        "dEQP-GLES31.functional.state_query.texture.text",
        "ure_2d_multisample.depth_stencil_mode_pure_uint");
