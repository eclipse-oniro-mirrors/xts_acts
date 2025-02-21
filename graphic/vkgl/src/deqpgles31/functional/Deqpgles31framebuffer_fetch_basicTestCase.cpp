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
#include "../ActsDeqpgles310008TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007467,
        "dEQP-GLES31.functional.shaders.fr",
        "amebuffer_fetch.basic.texel_fetch");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007468,
        "dEQP-GLES31.functional.shaders.fra",
        "mebuffer_fetch.basic.last_frag_data");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007469,
        "dEQP-GLES31.functional.shaders.fram",
        "ebuffer_fetch.basic.fragment_discard");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007470,
        "dEQP-GLES31.functional.shaders.frameb",
        "uffer_fetch.basic.multiple_assignment");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007471,
        "dEQP-GLES31.functional.shaders.framebuf",
        "fer_fetch.basic.multiple_render_targets");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007472,
        "dEQP-GLES31.functional.shaders.framebuff",
        "er_fetch.basic.framebuffer_texture_level");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007473,
        "dEQP-GLES31.functional.shaders.framebuff",
        "er_fetch.basic.framebuffer_texture_layer");
