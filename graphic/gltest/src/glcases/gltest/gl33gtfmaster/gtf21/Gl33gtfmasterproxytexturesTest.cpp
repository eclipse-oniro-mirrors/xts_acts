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
#include "../Gl33gtfmasterBaseFunc.h"
#include "../ActsGl33gtfmaster0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl33gtfmaster0001TestSuite, TestCase_001213,
    "GTF-GL33.gtf21.GL3Tests.proxy_textures.proxy_textures_valid");

static SHRINK_HWTEST_SF(ActsGl33gtfmaster0001TestSuite, TestCase_001214,
    "GTF-GL33.gtf21.GL3Tests.proxy_textures.proxy_textures_invalid_size");

static SHRINK_HWTEST_SF(ActsGl33gtfmaster0001TestSuite, TestCase_001215,
    "GTF-GL33.gtf21.GL3Tests.proxy_textures.proxy_textures_invalid_samples");
