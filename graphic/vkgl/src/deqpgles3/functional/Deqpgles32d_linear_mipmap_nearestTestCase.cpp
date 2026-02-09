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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30026TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025352,
        "dEQP-GLES3.functional.texture.shadow.2d.linear",
        "_mipmap_nearest.less_or_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025353,
        "dEQP-GLES3.functional.texture.shadow.2d.linear_",
        "mipmap_nearest.less_or_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025354,
        "dEQP-GLES3.functional.texture.shadow.2d.linear",
        "_mipmap_nearest.less_or_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025355,
        "dEQP-GLES3.functional.texture.shadow.2d.linear_m",
        "ipmap_nearest.greater_or_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025356,
        "dEQP-GLES3.functional.texture.shadow.2d.linear_m",
        "ipmap_nearest.greater_or_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025357,
        "dEQP-GLES3.functional.texture.shadow.2d.linear_",
        "mipmap_nearest.greater_or_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025358,
        "dEQP-GLES3.functional.texture.shadow.2d.li",
        "near_mipmap_nearest.less_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025359,
        "dEQP-GLES3.functional.texture.shadow.2d.li",
        "near_mipmap_nearest.less_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025360,
        "dEQP-GLES3.functional.texture.shadow.2d.l",
        "inear_mipmap_nearest.less_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025361,
        "dEQP-GLES3.functional.texture.shadow.2d.lin",
        "ear_mipmap_nearest.greater_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025362,
        "dEQP-GLES3.functional.texture.shadow.2d.line",
        "ar_mipmap_nearest.greater_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025363,
        "dEQP-GLES3.functional.texture.shadow.2d.lin",
        "ear_mipmap_nearest.greater_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025364,
        "dEQP-GLES3.functional.texture.shadow.2d.li",
        "near_mipmap_nearest.equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025365,
        "dEQP-GLES3.functional.texture.shadow.2d.lin",
        "ear_mipmap_nearest.equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025366,
        "dEQP-GLES3.functional.texture.shadow.2d.li",
        "near_mipmap_nearest.equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025367,
        "dEQP-GLES3.functional.texture.shadow.2d.line",
        "ar_mipmap_nearest.not_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025368,
        "dEQP-GLES3.functional.texture.shadow.2d.linea",
        "r_mipmap_nearest.not_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025369,
        "dEQP-GLES3.functional.texture.shadow.2d.line",
        "ar_mipmap_nearest.not_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025370,
        "dEQP-GLES3.functional.texture.shadow.2d.lin",
        "ear_mipmap_nearest.always_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025371,
        "dEQP-GLES3.functional.texture.shadow.2d.lin",
        "ear_mipmap_nearest.always_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025372,
        "dEQP-GLES3.functional.texture.shadow.2d.li",
        "near_mipmap_nearest.always_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025373,
        "dEQP-GLES3.functional.texture.shadow.2d.li",
        "near_mipmap_nearest.never_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025374,
        "dEQP-GLES3.functional.texture.shadow.2d.lin",
        "ear_mipmap_nearest.never_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025375,
        "dEQP-GLES3.functional.texture.shadow.2d.li",
        "near_mipmap_nearest.never_depth24_stencil8");
