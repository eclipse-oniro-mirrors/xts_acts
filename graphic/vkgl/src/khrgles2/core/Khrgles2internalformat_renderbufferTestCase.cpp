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
#include "../Khrgles2BaseFunc.h"
#include "../ActsKhrgles20001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000463,
        "KHR-GLES2.core.internalf",
        "ormat.renderbuffer.rgba8");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000464,
        "KHR-GLES2.core.internal",
        "format.renderbuffer.rgb8");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000465,
        "KHR-GLES2.core.internalformat.",
        "renderbuffer.stencil_index1_oes");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000466,
        "KHR-GLES2.core.internalformat.",
        "renderbuffer.stencil_index4_oes");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000467,
        "KHR-GLES2.core.internalforma",
        "t.renderbuffer.stencil_index8");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000468,
        "KHR-GLES2.core.internalformat.",
        "renderbuffer.depth_component16");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000469,
        "KHR-GLES2.core.internalformat.",
        "renderbuffer.depth_component24");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000470,
        "KHR-GLES2.core.internalformat.",
        "renderbuffer.depth_component32");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000471,
        "KHR-GLES2.core.internalformat",
        ".renderbuffer.depth24_stencil8");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000472,
        "KHR-GLES2.core.internalfo",
        "rmat.renderbuffer.rgb5_a1");
