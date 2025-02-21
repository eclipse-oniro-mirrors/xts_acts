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

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015365,
        "dEQP-GLES31.functional.state_query.texture.",
        "texture_2d_array.depth_stencil_mode_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015366,
        "dEQP-GLES31.functional.state_query.texture",
        ".texture_2d_array.depth_stencil_mode_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015367,
        "dEQP-GLES31.functional.state_query.texture.",
        "texture_2d_array.depth_stencil_mode_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015368,
        "dEQP-GLES31.functional.state_query.texture.t",
        "exture_2d_array.depth_stencil_mode_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015369,
        "dEQP-GLES31.functional.state_query.texture.",
        "texture_2d_array.texture_srgb_decode_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015370,
        "dEQP-GLES31.functional.state_query.texture",
        ".texture_2d_array.texture_srgb_decode_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015371,
        "dEQP-GLES31.functional.state_query.texture.t",
        "exture_2d_array.texture_srgb_decode_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015372,
        "dEQP-GLES31.functional.state_query.texture.t",
        "exture_2d_array.texture_srgb_decode_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015373,
        "dEQP-GLES31.functional.state_query.texture.t",
        "exture_2d_array.texture_border_color_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015374,
        "dEQP-GLES31.functional.state_query.texture.",
        "texture_2d_array.texture_border_color_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015375,
        "dEQP-GLES31.functional.state_query.texture.t",
        "exture_2d_array.texture_border_color_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015376,
        "dEQP-GLES31.functional.state_query.texture.te",
        "xture_2d_array.texture_border_color_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015377,
        "dEQP-GLES31.functional.state_query.texture.textur",
        "e_2d_array.texture_wrap_s_clamp_to_border_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015378,
        "dEQP-GLES31.functional.state_query.texture.textu",
        "re_2d_array.texture_wrap_s_clamp_to_border_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015379,
        "dEQP-GLES31.functional.state_query.texture.textur",
        "e_2d_array.texture_wrap_t_clamp_to_border_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015380,
        "dEQP-GLES31.functional.state_query.texture.textu",
        "re_2d_array.texture_wrap_t_clamp_to_border_float");
