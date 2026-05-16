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
#include "../ActsDeqpgles30028TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027119,
        "dEQP-GLES3.functional.texture.v",
        "ertex.3d.wrap.clamp_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027120,
        "dEQP-GLES3.functional.texture.v",
        "ertex.3d.wrap.clamp_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027121,
        "dEQP-GLES3.functional.texture.v",
        "ertex.3d.wrap.clamp_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027122,
        "dEQP-GLES3.functional.texture.v",
        "ertex.3d.wrap.clamp_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027123,
        "dEQP-GLES3.functional.texture.ve",
        "rtex.3d.wrap.clamp_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027124,
        "dEQP-GLES3.functional.texture.ve",
        "rtex.3d.wrap.clamp_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027125,
        "dEQP-GLES3.functional.texture.v",
        "ertex.3d.wrap.clamp_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027126,
        "dEQP-GLES3.functional.texture.ve",
        "rtex.3d.wrap.clamp_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027127,
        "dEQP-GLES3.functional.texture.ve",
        "rtex.3d.wrap.clamp_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027128,
        "dEQP-GLES3.functional.texture.v",
        "ertex.3d.wrap.repeat_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027129,
        "dEQP-GLES3.functional.texture.ve",
        "rtex.3d.wrap.repeat_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027130,
        "dEQP-GLES3.functional.texture.ve",
        "rtex.3d.wrap.repeat_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027131,
        "dEQP-GLES3.functional.texture.ve",
        "rtex.3d.wrap.repeat_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027132,
        "dEQP-GLES3.functional.texture.ve",
        "rtex.3d.wrap.repeat_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027133,
        "dEQP-GLES3.functional.texture.ve",
        "rtex.3d.wrap.repeat_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027134,
        "dEQP-GLES3.functional.texture.ve",
        "rtex.3d.wrap.repeat_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027135,
        "dEQP-GLES3.functional.texture.ve",
        "rtex.3d.wrap.repeat_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027136,
        "dEQP-GLES3.functional.texture.ve",
        "rtex.3d.wrap.repeat_mirror_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027137,
        "dEQP-GLES3.functional.texture.v",
        "ertex.3d.wrap.mirror_clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027138,
        "dEQP-GLES3.functional.texture.ve",
        "rtex.3d.wrap.mirror_clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027139,
        "dEQP-GLES3.functional.texture.ve",
        "rtex.3d.wrap.mirror_clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027140,
        "dEQP-GLES3.functional.texture.ve",
        "rtex.3d.wrap.mirror_repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027141,
        "dEQP-GLES3.functional.texture.ve",
        "rtex.3d.wrap.mirror_repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027142,
        "dEQP-GLES3.functional.texture.ve",
        "rtex.3d.wrap.mirror_repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027143,
        "dEQP-GLES3.functional.texture.ve",
        "rtex.3d.wrap.mirror_mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027144,
        "dEQP-GLES3.functional.texture.ve",
        "rtex.3d.wrap.mirror_mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027145,
        "dEQP-GLES3.functional.texture.ve",
        "rtex.3d.wrap.mirror_mirror_mirror");
