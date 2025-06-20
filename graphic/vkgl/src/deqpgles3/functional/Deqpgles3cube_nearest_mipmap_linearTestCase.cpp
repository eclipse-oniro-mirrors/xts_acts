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

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025520,
        "dEQP-GLES3.functional.texture.shadow.cube.neare",
        "st_mipmap_linear.less_or_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025521,
        "dEQP-GLES3.functional.texture.shadow.cube.neares",
        "t_mipmap_linear.less_or_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025522,
        "dEQP-GLES3.functional.texture.shadow.cube.neare",
        "st_mipmap_linear.less_or_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025523,
        "dEQP-GLES3.functional.texture.shadow.cube.nearest",
        "_mipmap_linear.greater_or_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025524,
        "dEQP-GLES3.functional.texture.shadow.cube.nearest",
        "_mipmap_linear.greater_or_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025525,
        "dEQP-GLES3.functional.texture.shadow.cube.neares",
        "t_mipmap_linear.greater_or_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025526,
        "dEQP-GLES3.functional.texture.shadow.cube.n",
        "earest_mipmap_linear.less_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025527,
        "dEQP-GLES3.functional.texture.shadow.cube.n",
        "earest_mipmap_linear.less_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025528,
        "dEQP-GLES3.functional.texture.shadow.cube.",
        "nearest_mipmap_linear.less_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025529,
        "dEQP-GLES3.functional.texture.shadow.cube.ne",
        "arest_mipmap_linear.greater_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025530,
        "dEQP-GLES3.functional.texture.shadow.cube.nea",
        "rest_mipmap_linear.greater_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025531,
        "dEQP-GLES3.functional.texture.shadow.cube.ne",
        "arest_mipmap_linear.greater_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025532,
        "dEQP-GLES3.functional.texture.shadow.cube.n",
        "earest_mipmap_linear.equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025533,
        "dEQP-GLES3.functional.texture.shadow.cube.ne",
        "arest_mipmap_linear.equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025534,
        "dEQP-GLES3.functional.texture.shadow.cube.n",
        "earest_mipmap_linear.equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025535,
        "dEQP-GLES3.functional.texture.shadow.cube.nea",
        "rest_mipmap_linear.not_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025536,
        "dEQP-GLES3.functional.texture.shadow.cube.near",
        "est_mipmap_linear.not_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025537,
        "dEQP-GLES3.functional.texture.shadow.cube.nea",
        "rest_mipmap_linear.not_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025538,
        "dEQP-GLES3.functional.texture.shadow.cube.ne",
        "arest_mipmap_linear.always_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025539,
        "dEQP-GLES3.functional.texture.shadow.cube.ne",
        "arest_mipmap_linear.always_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025540,
        "dEQP-GLES3.functional.texture.shadow.cube.n",
        "earest_mipmap_linear.always_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025541,
        "dEQP-GLES3.functional.texture.shadow.cube.n",
        "earest_mipmap_linear.never_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025542,
        "dEQP-GLES3.functional.texture.shadow.cube.ne",
        "arest_mipmap_linear.never_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025543,
        "dEQP-GLES3.functional.texture.shadow.cube.n",
        "earest_mipmap_linear.never_depth24_stencil8");
