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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30027TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026984,
        "dEQP-GLES3.functional.textur",
        "e.vertex.2d.wrap.clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026985,
        "dEQP-GLES3.functional.textur",
        "e.vertex.2d.wrap.clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026986,
        "dEQP-GLES3.functional.textur",
        "e.vertex.2d.wrap.clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026987,
        "dEQP-GLES3.functional.textur",
        "e.vertex.2d.wrap.repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026988,
        "dEQP-GLES3.functional.texture",
        ".vertex.2d.wrap.repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026989,
        "dEQP-GLES3.functional.texture",
        ".vertex.2d.wrap.repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026990,
        "dEQP-GLES3.functional.textur",
        "e.vertex.2d.wrap.mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026991,
        "dEQP-GLES3.functional.texture",
        ".vertex.2d.wrap.mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026992,
        "dEQP-GLES3.functional.texture",
        ".vertex.2d.wrap.mirror_mirror");
