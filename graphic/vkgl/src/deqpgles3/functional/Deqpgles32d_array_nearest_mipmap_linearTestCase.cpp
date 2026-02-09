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

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025664,
        "dEQP-GLES3.functional.texture.shadow.2d_array.nea",
        "rest_mipmap_linear.less_or_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025665,
        "dEQP-GLES3.functional.texture.shadow.2d_array.near",
        "est_mipmap_linear.less_or_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025666,
        "dEQP-GLES3.functional.texture.shadow.2d_array.nea",
        "rest_mipmap_linear.less_or_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025667,
        "dEQP-GLES3.functional.texture.shadow.2d_array.neare",
        "st_mipmap_linear.greater_or_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025668,
        "dEQP-GLES3.functional.texture.shadow.2d_array.neare",
        "st_mipmap_linear.greater_or_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025669,
        "dEQP-GLES3.functional.texture.shadow.2d_array.near",
        "est_mipmap_linear.greater_or_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025670,
        "dEQP-GLES3.functional.texture.shadow.2d_array",
        ".nearest_mipmap_linear.less_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025671,
        "dEQP-GLES3.functional.texture.shadow.2d_array",
        ".nearest_mipmap_linear.less_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025672,
        "dEQP-GLES3.functional.texture.shadow.2d_arra",
        "y.nearest_mipmap_linear.less_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025673,
        "dEQP-GLES3.functional.texture.shadow.2d_array.",
        "nearest_mipmap_linear.greater_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025674,
        "dEQP-GLES3.functional.texture.shadow.2d_array.n",
        "earest_mipmap_linear.greater_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025675,
        "dEQP-GLES3.functional.texture.shadow.2d_array.",
        "nearest_mipmap_linear.greater_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025676,
        "dEQP-GLES3.functional.texture.shadow.2d_array",
        ".nearest_mipmap_linear.equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025677,
        "dEQP-GLES3.functional.texture.shadow.2d_array.",
        "nearest_mipmap_linear.equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025678,
        "dEQP-GLES3.functional.texture.shadow.2d_array",
        ".nearest_mipmap_linear.equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025679,
        "dEQP-GLES3.functional.texture.shadow.2d_array.n",
        "earest_mipmap_linear.not_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025680,
        "dEQP-GLES3.functional.texture.shadow.2d_array.ne",
        "arest_mipmap_linear.not_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025681,
        "dEQP-GLES3.functional.texture.shadow.2d_array.n",
        "earest_mipmap_linear.not_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025682,
        "dEQP-GLES3.functional.texture.shadow.2d_array.",
        "nearest_mipmap_linear.always_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025683,
        "dEQP-GLES3.functional.texture.shadow.2d_array.",
        "nearest_mipmap_linear.always_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025684,
        "dEQP-GLES3.functional.texture.shadow.2d_array",
        ".nearest_mipmap_linear.always_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025685,
        "dEQP-GLES3.functional.texture.shadow.2d_array",
        ".nearest_mipmap_linear.never_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025686,
        "dEQP-GLES3.functional.texture.shadow.2d_array.",
        "nearest_mipmap_linear.never_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025687,
        "dEQP-GLES3.functional.texture.shadow.2d_array",
        ".nearest_mipmap_linear.never_depth24_stencil8");
