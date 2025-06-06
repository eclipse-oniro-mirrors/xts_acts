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
#include "../ActsDeqpgles20017TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016433,
        "dEQP-GLES2.functional.default_ve",
        "rtex_attrib.vec4.vertex_attrib_1f");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016434,
        "dEQP-GLES2.functional.default_ve",
        "rtex_attrib.vec4.vertex_attrib_2f");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016435,
        "dEQP-GLES2.functional.default_ve",
        "rtex_attrib.vec4.vertex_attrib_3f");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016436,
        "dEQP-GLES2.functional.default_ve",
        "rtex_attrib.vec4.vertex_attrib_4f");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016437,
        "dEQP-GLES2.functional.default_ver",
        "tex_attrib.vec4.vertex_attrib_1fv");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016438,
        "dEQP-GLES2.functional.default_ver",
        "tex_attrib.vec4.vertex_attrib_2fv");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016439,
        "dEQP-GLES2.functional.default_ver",
        "tex_attrib.vec4.vertex_attrib_3fv");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016440,
        "dEQP-GLES2.functional.default_ver",
        "tex_attrib.vec4.vertex_attrib_4fv");
