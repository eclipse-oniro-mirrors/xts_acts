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

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025400,
        "dEQP-GLES3.functional.texture.shadow.2d.linear",
        "_mipmap_linear.less_or_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025401,
        "dEQP-GLES3.functional.texture.shadow.2d.linear",
        "_mipmap_linear.less_or_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025402,
        "dEQP-GLES3.functional.texture.shadow.2d.linea",
        "r_mipmap_linear.less_or_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025403,
        "dEQP-GLES3.functional.texture.shadow.2d.linear_",
        "mipmap_linear.greater_or_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025404,
        "dEQP-GLES3.functional.texture.shadow.2d.linear_m",
        "ipmap_linear.greater_or_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025405,
        "dEQP-GLES3.functional.texture.shadow.2d.linear_",
        "mipmap_linear.greater_or_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025406,
        "dEQP-GLES3.functional.texture.shadow.2d.l",
        "inear_mipmap_linear.less_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025407,
        "dEQP-GLES3.functional.texture.shadow.2d.li",
        "near_mipmap_linear.less_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025408,
        "dEQP-GLES3.functional.texture.shadow.2d.l",
        "inear_mipmap_linear.less_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025409,
        "dEQP-GLES3.functional.texture.shadow.2d.lin",
        "ear_mipmap_linear.greater_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025410,
        "dEQP-GLES3.functional.texture.shadow.2d.lin",
        "ear_mipmap_linear.greater_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025411,
        "dEQP-GLES3.functional.texture.shadow.2d.li",
        "near_mipmap_linear.greater_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025412,
        "dEQP-GLES3.functional.texture.shadow.2d.li",
        "near_mipmap_linear.equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025413,
        "dEQP-GLES3.functional.texture.shadow.2d.li",
        "near_mipmap_linear.equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025414,
        "dEQP-GLES3.functional.texture.shadow.2d.l",
        "inear_mipmap_linear.equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025415,
        "dEQP-GLES3.functional.texture.shadow.2d.line",
        "ar_mipmap_linear.not_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025416,
        "dEQP-GLES3.functional.texture.shadow.2d.line",
        "ar_mipmap_linear.not_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025417,
        "dEQP-GLES3.functional.texture.shadow.2d.lin",
        "ear_mipmap_linear.not_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025418,
        "dEQP-GLES3.functional.texture.shadow.2d.li",
        "near_mipmap_linear.always_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025419,
        "dEQP-GLES3.functional.texture.shadow.2d.lin",
        "ear_mipmap_linear.always_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025420,
        "dEQP-GLES3.functional.texture.shadow.2d.li",
        "near_mipmap_linear.always_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025421,
        "dEQP-GLES3.functional.texture.shadow.2d.li",
        "near_mipmap_linear.never_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025422,
        "dEQP-GLES3.functional.texture.shadow.2d.li",
        "near_mipmap_linear.never_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025423,
        "dEQP-GLES3.functional.texture.shadow.2d.l",
        "inear_mipmap_linear.never_depth24_stencil8");
