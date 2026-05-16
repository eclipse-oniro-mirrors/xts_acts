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

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018722,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.callbacks.shader_image_exchange.texture_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018723,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.callbacks.shader_image_exchange.texture_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018724,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.callbacks.shader_image_exchange.cube");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018725,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.callbacks.shader_image_exchange.2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018726,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.callbacks.shader_image_exchange.buffer");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018727,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.callbacks.shader_image_exchange.cube_array");
