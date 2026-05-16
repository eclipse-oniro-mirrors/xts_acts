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
#include "../Khrgles31BaseFunc.h"
#include "../ActsGles31MainUncover0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsGles31MainUncover0001TestSuite, TestCase_000035,
        "dEQP-GLES31.functional.srgb_texture_",
        "decode.skip_decode.srgba8.texel_fetch");

static SHRINK_HWTEST_F(ActsGles31MainUncover0001TestSuite, TestCase_000036,
        "dEQP-GLES31.functional.srgb_texture",
        "_decode.skip_decode.srg8.texel_fetch");

static SHRINK_HWTEST_F(ActsGles31MainUncover0001TestSuite, TestCase_000037,
        "dEQP-GLES31.functional.srgb_texture",
        "_decode.skip_decode.sr8.texel_fetch");
