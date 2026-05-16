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

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025616,
        "dEQP-GLES3.functional.texture.shadow.2d_array.near",
        "est_mipmap_nearest.less_or_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025617,
        "dEQP-GLES3.functional.texture.shadow.2d_array.near",
        "est_mipmap_nearest.less_or_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025618,
        "dEQP-GLES3.functional.texture.shadow.2d_array.nea",
        "rest_mipmap_nearest.less_or_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025619,
        "dEQP-GLES3.functional.texture.shadow.2d_array.neare",
        "st_mipmap_nearest.greater_or_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025620,
        "dEQP-GLES3.functional.texture.shadow.2d_array.neares",
        "t_mipmap_nearest.greater_or_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025621,
        "dEQP-GLES3.functional.texture.shadow.2d_array.neare",
        "st_mipmap_nearest.greater_or_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025622,
        "dEQP-GLES3.functional.texture.shadow.2d_array",
        ".nearest_mipmap_nearest.less_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025623,
        "dEQP-GLES3.functional.texture.shadow.2d_array.",
        "nearest_mipmap_nearest.less_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025624,
        "dEQP-GLES3.functional.texture.shadow.2d_array",
        ".nearest_mipmap_nearest.less_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025625,
        "dEQP-GLES3.functional.texture.shadow.2d_array.n",
        "earest_mipmap_nearest.greater_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025626,
        "dEQP-GLES3.functional.texture.shadow.2d_array.n",
        "earest_mipmap_nearest.greater_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025627,
        "dEQP-GLES3.functional.texture.shadow.2d_array.",
        "nearest_mipmap_nearest.greater_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025628,
        "dEQP-GLES3.functional.texture.shadow.2d_array.",
        "nearest_mipmap_nearest.equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025629,
        "dEQP-GLES3.functional.texture.shadow.2d_array.",
        "nearest_mipmap_nearest.equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025630,
        "dEQP-GLES3.functional.texture.shadow.2d_array",
        ".nearest_mipmap_nearest.equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025631,
        "dEQP-GLES3.functional.texture.shadow.2d_array.ne",
        "arest_mipmap_nearest.not_equal_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025632,
        "dEQP-GLES3.functional.texture.shadow.2d_array.ne",
        "arest_mipmap_nearest.not_equal_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025633,
        "dEQP-GLES3.functional.texture.shadow.2d_array.n",
        "earest_mipmap_nearest.not_equal_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025634,
        "dEQP-GLES3.functional.texture.shadow.2d_array.",
        "nearest_mipmap_nearest.always_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025635,
        "dEQP-GLES3.functional.texture.shadow.2d_array.n",
        "earest_mipmap_nearest.always_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025636,
        "dEQP-GLES3.functional.texture.shadow.2d_array.",
        "nearest_mipmap_nearest.always_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025637,
        "dEQP-GLES3.functional.texture.shadow.2d_array.",
        "nearest_mipmap_nearest.never_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025638,
        "dEQP-GLES3.functional.texture.shadow.2d_array.",
        "nearest_mipmap_nearest.never_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025639,
        "dEQP-GLES3.functional.texture.shadow.2d_array",
        ".nearest_mipmap_nearest.never_depth24_stencil8");
