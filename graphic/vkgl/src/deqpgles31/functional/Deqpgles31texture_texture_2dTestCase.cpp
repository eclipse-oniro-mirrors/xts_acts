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

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015331,
        "dEQP-GLES31.functional.state_query.textu",
        "re.texture_2d.depth_stencil_mode_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015332,
        "dEQP-GLES31.functional.state_query.text",
        "ure.texture_2d.depth_stencil_mode_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015333,
        "dEQP-GLES31.functional.state_query.textu",
        "re.texture_2d.depth_stencil_mode_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015334,
        "dEQP-GLES31.functional.state_query.textur",
        "e.texture_2d.depth_stencil_mode_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015335,
        "dEQP-GLES31.functional.state_query.textu",
        "re.texture_2d.texture_srgb_decode_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015336,
        "dEQP-GLES31.functional.state_query.text",
        "ure.texture_2d.texture_srgb_decode_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015337,
        "dEQP-GLES31.functional.state_query.textur",
        "e.texture_2d.texture_srgb_decode_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015338,
        "dEQP-GLES31.functional.state_query.textur",
        "e.texture_2d.texture_srgb_decode_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015339,
        "dEQP-GLES31.functional.state_query.textur",
        "e.texture_2d.texture_border_color_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015340,
        "dEQP-GLES31.functional.state_query.textu",
        "re.texture_2d.texture_border_color_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015341,
        "dEQP-GLES31.functional.state_query.textur",
        "e.texture_2d.texture_border_color_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015342,
        "dEQP-GLES31.functional.state_query.texture",
        ".texture_2d.texture_border_color_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015343,
        "dEQP-GLES31.functional.state_query.texture.tex",
        "ture_2d.texture_wrap_s_clamp_to_border_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015344,
        "dEQP-GLES31.functional.state_query.texture.te",
        "xture_2d.texture_wrap_s_clamp_to_border_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015345,
        "dEQP-GLES31.functional.state_query.texture.tex",
        "ture_2d.texture_wrap_t_clamp_to_border_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015346,
        "dEQP-GLES31.functional.state_query.texture.te",
        "xture_2d.texture_wrap_t_clamp_to_border_float");
