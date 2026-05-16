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
#include "../ActsDeqpgles30027TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026703,
        "dEQP-GLES3.functional.texture.specification.t",
        "exsubimage3d_depth.depth_component32f_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026704,
        "dEQP-GLES3.functional.texture.specification.t",
        "exsubimage3d_depth.depth_component24_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026705,
        "dEQP-GLES3.functional.texture.specification.t",
        "exsubimage3d_depth.depth_component16_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026706,
        "dEQP-GLES3.functional.texture.specification.t",
        "exsubimage3d_depth.depth32f_stencil8_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026707,
        "dEQP-GLES3.functional.texture.specification.",
        "texsubimage3d_depth.depth24_stencil8_2d_array");
