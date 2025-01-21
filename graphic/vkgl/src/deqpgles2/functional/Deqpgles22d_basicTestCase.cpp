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
#include "../ActsDeqpgles20011TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010603,
        "dEQP-GLES2.functional.texture.mip",
        "map.2d.basic.nearest_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010604,
        "dEQP-GLES2.functional.texture.mipmap.2",
        "d.basic.nearest_linear_clamp_non_square");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010605,
        "dEQP-GLES2.functional.texture.mip",
        "map.2d.basic.nearest_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010606,
        "dEQP-GLES2.functional.texture.mipmap.2d",
        ".basic.nearest_linear_repeat_non_square");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010607,
        "dEQP-GLES2.functional.texture.mip",
        "map.2d.basic.nearest_linear_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010608,
        "dEQP-GLES2.functional.texture.mipmap.2d",
        ".basic.nearest_linear_mirror_non_square");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010609,
        "dEQP-GLES2.functional.texture.mip",
        "map.2d.basic.linear_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010610,
        "dEQP-GLES2.functional.texture.mipmap.2",
        "d.basic.linear_linear_repeat_non_square");
