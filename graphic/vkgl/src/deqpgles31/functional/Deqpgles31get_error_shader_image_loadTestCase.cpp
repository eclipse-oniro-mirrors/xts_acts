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
#include "../ActsDeqpgles310020TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019698,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.get_error.shader_image_load.texture_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019699,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.get_error.shader_image_load.texture_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019700,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.get_error.shader_image_load.cube");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019701,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.get_error.shader_image_load.2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019702,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.get_error.shader_image_load.buffer");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019703,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.get_error.shader_image_load.cube_array");
