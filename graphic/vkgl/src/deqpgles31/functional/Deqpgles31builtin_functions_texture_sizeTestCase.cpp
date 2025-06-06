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
#include "../ActsDeqpgles310003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002169,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.texture_size.samples_1_texture_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002170,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.texture_size.samples_4_texture_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002171,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.texture_size.samples_1_texture_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002172,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.texture_size.samples_4_texture_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002173,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.texture_size.samples_1_texture_int_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002174,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.texture_size.samples_4_texture_int_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002175,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.texture_size.samples_1_texture_int_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002176,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.texture_size.samples_4_texture_int_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002177,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.texture_size.samples_1_texture_uint_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002178,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.texture_size.samples_4_texture_uint_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002179,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.texture_size.samples_1_texture_uint_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002180,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.texture_size.samples_4_texture_uint_2d_array");
