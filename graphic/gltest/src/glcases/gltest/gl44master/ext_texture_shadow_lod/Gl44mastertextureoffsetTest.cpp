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
#include "../Gl44masterBaseFunc.h"
#include "../ActsGl44master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_000848,
    "KHR-GL44.ext_texture_shadow_lod.textureoffset.sampler2darrayshadow_vertex");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_000849,
    "KHR-GL44.ext_texture_shadow_lod.textureoffset.sampler2darrayshadow_fragment");

static SHRINK_HWTEST_SF(ActsGl44master0001TestSuite, TestCase_000850,
    "KHR-GL44.ext_texture_shadow_lod.textureoffset.sampler2darrayshadow_bias_fragment");
