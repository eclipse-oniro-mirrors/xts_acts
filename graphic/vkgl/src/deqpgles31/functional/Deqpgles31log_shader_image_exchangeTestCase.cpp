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

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019220,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.log.shader_image_exchange.texture_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019221,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.log.shader_image_exchange.texture_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019222,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.log.shader_image_exchange.cube");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019223,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.log.shader_image_exchange.2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019224,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.log.shader_image_exchange.buffer");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019225,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.log.shader_image_exchange.cube_array");
