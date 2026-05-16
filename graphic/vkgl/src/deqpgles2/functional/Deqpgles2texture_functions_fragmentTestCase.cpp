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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20008TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007814,
        "dEQP-GLES2.functional.shaders.tex",
        "ture_functions.fragment.texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007815,
        "dEQP-GLES2.functional.shaders.textu",
        "re_functions.fragment.texture2d_bias");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007816,
        "dEQP-GLES2.functional.shaders.texture",
        "_functions.fragment.texture2dproj_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007817,
        "dEQP-GLES2.functional.shaders.texture",
        "_functions.fragment.texture2dproj_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007818,
        "dEQP-GLES2.functional.shaders.texture_fu",
        "nctions.fragment.texture2dproj_vec3_bias");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007819,
        "dEQP-GLES2.functional.shaders.texture_fu",
        "nctions.fragment.texture2dproj_vec4_bias");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007820,
        "dEQP-GLES2.functional.shaders.text",
        "ure_functions.fragment.texturecube");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007821,
        "dEQP-GLES2.functional.shaders.textur",
        "e_functions.fragment.texturecube_bias");
