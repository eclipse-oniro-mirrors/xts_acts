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
#include "../ActsDeqpgles310019TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018704,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.callbacks.shader_image_load.texture_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018705,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.callbacks.shader_image_load.texture_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018706,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.callbacks.shader_image_load.cube");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018707,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.callbacks.shader_image_load.2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018708,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.callbacks.shader_image_load.buffer");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018709,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.callbacks.shader_image_load.cube_array");
