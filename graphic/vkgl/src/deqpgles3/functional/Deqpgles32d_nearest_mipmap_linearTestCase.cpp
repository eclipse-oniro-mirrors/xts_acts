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

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025376,
        "dEQP-GLES3.functional.texture.shadow.2d.neares",
        "t_mipmap_linear.less_or_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025377,
        "dEQP-GLES3.functional.texture.shadow.2d.nearest",
        "_mipmap_linear.less_or_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025378,
        "dEQP-GLES3.functional.texture.shadow.2d.neares",
        "t_mipmap_linear.less_or_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025379,
        "dEQP-GLES3.functional.texture.shadow.2d.nearest_",
        "mipmap_linear.greater_or_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025380,
        "dEQP-GLES3.functional.texture.shadow.2d.nearest_",
        "mipmap_linear.greater_or_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025381,
        "dEQP-GLES3.functional.texture.shadow.2d.nearest",
        "_mipmap_linear.greater_or_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025382,
        "dEQP-GLES3.functional.texture.shadow.2d.ne",
        "arest_mipmap_linear.less_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025383,
        "dEQP-GLES3.functional.texture.shadow.2d.ne",
        "arest_mipmap_linear.less_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025384,
        "dEQP-GLES3.functional.texture.shadow.2d.n",
        "earest_mipmap_linear.less_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025385,
        "dEQP-GLES3.functional.texture.shadow.2d.nea",
        "rest_mipmap_linear.greater_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025386,
        "dEQP-GLES3.functional.texture.shadow.2d.near",
        "est_mipmap_linear.greater_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025387,
        "dEQP-GLES3.functional.texture.shadow.2d.nea",
        "rest_mipmap_linear.greater_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025388,
        "dEQP-GLES3.functional.texture.shadow.2d.ne",
        "arest_mipmap_linear.equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025389,
        "dEQP-GLES3.functional.texture.shadow.2d.nea",
        "rest_mipmap_linear.equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025390,
        "dEQP-GLES3.functional.texture.shadow.2d.ne",
        "arest_mipmap_linear.equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025391,
        "dEQP-GLES3.functional.texture.shadow.2d.near",
        "est_mipmap_linear.not_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025392,
        "dEQP-GLES3.functional.texture.shadow.2d.neare",
        "st_mipmap_linear.not_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025393,
        "dEQP-GLES3.functional.texture.shadow.2d.near",
        "est_mipmap_linear.not_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025394,
        "dEQP-GLES3.functional.texture.shadow.2d.nea",
        "rest_mipmap_linear.always_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025395,
        "dEQP-GLES3.functional.texture.shadow.2d.nea",
        "rest_mipmap_linear.always_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025396,
        "dEQP-GLES3.functional.texture.shadow.2d.ne",
        "arest_mipmap_linear.always_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025397,
        "dEQP-GLES3.functional.texture.shadow.2d.ne",
        "arest_mipmap_linear.never_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025398,
        "dEQP-GLES3.functional.texture.shadow.2d.nea",
        "rest_mipmap_linear.never_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025399,
        "dEQP-GLES3.functional.texture.shadow.2d.ne",
        "arest_mipmap_linear.never_depth24_stencil8");
