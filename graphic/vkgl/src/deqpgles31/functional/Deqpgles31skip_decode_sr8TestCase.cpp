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
#include "../ActsDeqpgles310038TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037734,
        "dEQP-GLES31.functional.srgb_textu",
        "re_decode.skip_decode.sr8.skipped");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037735,
        "dEQP-GLES31.functional.srgb_textu",
        "re_decode.skip_decode.sr8.enabled");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037737,
        "dEQP-GLES31.functional.srgb_texture_",
        "decode.skip_decode.sr8.conversion_gpu");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037738,
        "dEQP-GLES31.functional.srgb_textu",
        "re_decode.skip_decode.sr8.toggled");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037739,
        "dEQP-GLES31.functional.srgb_texture_de",
        "code.skip_decode.sr8.multiple_textures");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037740,
        "dEQP-GLES31.functional.srgb_texture_",
        "decode.skip_decode.sr8.using_sampler");
