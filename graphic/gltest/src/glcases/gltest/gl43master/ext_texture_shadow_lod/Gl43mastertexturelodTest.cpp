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

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_000851,
    "KHR-GL43.ext_texture_shadow_lod.texturelod.sampler2darrayshadow_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_000852,
    "KHR-GL43.ext_texture_shadow_lod.texturelod.sampler2darrayshadow_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_000853,
    "KHR-GL43.ext_texture_shadow_lod.texturelod.samplercubeshadow_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_000854,
    "KHR-GL43.ext_texture_shadow_lod.texturelod.samplercubeshadow_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_000855,
    "KHR-GL43.ext_texture_shadow_lod.texturelod.samplercubearrayshadow_fragment");
