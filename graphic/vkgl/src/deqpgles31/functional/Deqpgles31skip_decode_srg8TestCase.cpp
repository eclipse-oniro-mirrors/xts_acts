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

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037727,
        "dEQP-GLES31.functional.srgb_textu",
        "re_decode.skip_decode.srg8.skipped");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037728,
        "dEQP-GLES31.functional.srgb_textu",
        "re_decode.skip_decode.srg8.enabled");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037730,
        "dEQP-GLES31.functional.srgb_texture_d",
        "ecode.skip_decode.srg8.conversion_gpu");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037731,
        "dEQP-GLES31.functional.srgb_textu",
        "re_decode.skip_decode.srg8.toggled");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037732,
        "dEQP-GLES31.functional.srgb_texture_de",
        "code.skip_decode.srg8.multiple_textures");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037733,
        "dEQP-GLES31.functional.srgb_texture_",
        "decode.skip_decode.srg8.using_sampler");
