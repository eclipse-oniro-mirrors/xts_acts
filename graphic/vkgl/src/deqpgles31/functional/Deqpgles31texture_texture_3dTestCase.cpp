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

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015347,
        "dEQP-GLES31.functional.state_query.textu",
        "re.texture_3d.depth_stencil_mode_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015348,
        "dEQP-GLES31.functional.state_query.text",
        "ure.texture_3d.depth_stencil_mode_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015349,
        "dEQP-GLES31.functional.state_query.textu",
        "re.texture_3d.depth_stencil_mode_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015350,
        "dEQP-GLES31.functional.state_query.textur",
        "e.texture_3d.depth_stencil_mode_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015351,
        "dEQP-GLES31.functional.state_query.textu",
        "re.texture_3d.texture_srgb_decode_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015352,
        "dEQP-GLES31.functional.state_query.text",
        "ure.texture_3d.texture_srgb_decode_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015353,
        "dEQP-GLES31.functional.state_query.textur",
        "e.texture_3d.texture_srgb_decode_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015354,
        "dEQP-GLES31.functional.state_query.textur",
        "e.texture_3d.texture_srgb_decode_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015355,
        "dEQP-GLES31.functional.state_query.textur",
        "e.texture_3d.texture_border_color_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015356,
        "dEQP-GLES31.functional.state_query.textu",
        "re.texture_3d.texture_border_color_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015357,
        "dEQP-GLES31.functional.state_query.textur",
        "e.texture_3d.texture_border_color_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015358,
        "dEQP-GLES31.functional.state_query.texture",
        ".texture_3d.texture_border_color_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015359,
        "dEQP-GLES31.functional.state_query.texture.tex",
        "ture_3d.texture_wrap_s_clamp_to_border_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015360,
        "dEQP-GLES31.functional.state_query.texture.te",
        "xture_3d.texture_wrap_s_clamp_to_border_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015361,
        "dEQP-GLES31.functional.state_query.texture.tex",
        "ture_3d.texture_wrap_t_clamp_to_border_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015362,
        "dEQP-GLES31.functional.state_query.texture.te",
        "xture_3d.texture_wrap_t_clamp_to_border_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015363,
        "dEQP-GLES31.functional.state_query.texture.tex",
        "ture_3d.texture_wrap_r_clamp_to_border_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015364,
        "dEQP-GLES31.functional.state_query.texture.te",
        "xture_3d.texture_wrap_r_clamp_to_border_float");
