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

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007806,
        "dEQP-GLES2.functional.shaders.te",
        "xture_functions.vertex.texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007807,
        "dEQP-GLES2.functional.shaders.textur",
        "e_functions.vertex.texture2dproj_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007808,
        "dEQP-GLES2.functional.shaders.textur",
        "e_functions.vertex.texture2dproj_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007809,
        "dEQP-GLES2.functional.shaders.tex",
        "ture_functions.vertex.texture2dlod");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007810,
        "dEQP-GLES2.functional.shaders.texture_",
        "functions.vertex.texture2dprojlod_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007811,
        "dEQP-GLES2.functional.shaders.texture_",
        "functions.vertex.texture2dprojlod_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007812,
        "dEQP-GLES2.functional.shaders.tex",
        "ture_functions.vertex.texturecube");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007813,
        "dEQP-GLES2.functional.shaders.text",
        "ure_functions.vertex.texturecubelod");
