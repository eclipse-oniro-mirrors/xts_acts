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
#include "../Gl43masterBaseFunc.h"
#include "../ActsGl43master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004527,
    "KHR-GL43.internalformat.renderbuffer.rgba8");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004528,
    "KHR-GL43.internalformat.renderbuffer.rgb9_e5");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004529,
    "KHR-GL43.internalformat.renderbuffer.rgb10_a2ui");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004530,
    "KHR-GL43.internalformat.renderbuffer.depth24_stencil8");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004531,
    "KHR-GL43.internalformat.renderbuffer.depth_component16");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004532,
    "KHR-GL43.internalformat.renderbuffer.depth_component24");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_004533,
    "KHR-GL43.internalformat.renderbuffer.depth_component32");
