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

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019704,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.get_error.shader_image_store.texture_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019705,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.get_error.shader_image_store.texture_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019706,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.get_error.shader_image_store.cube");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019707,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.get_error.shader_image_store.2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019708,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.get_error.shader_image_store.buffer");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019709,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.get_error.shader_image_store.cube_array");
