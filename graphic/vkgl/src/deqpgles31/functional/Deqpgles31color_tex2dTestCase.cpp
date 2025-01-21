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

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019966,
        "dEQP-GLES31.functiona",
        "l.fbo.color.tex2d.r16");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019967,
        "dEQP-GLES31.functiona",
        "l.fbo.color.tex2d.rg16");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019968,
        "dEQP-GLES31.functional",
        ".fbo.color.tex2d.rgba16");
