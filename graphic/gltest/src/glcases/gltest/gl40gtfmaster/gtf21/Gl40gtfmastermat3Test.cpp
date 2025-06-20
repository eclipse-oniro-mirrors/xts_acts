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
#include "../Gl40gtfmasterBaseFunc.h"
#include "../ActsGl40gtfmaster0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl40gtfmaster0001TestSuite, TestCase_000604,
    "GTF-GL40.gtf21.GL.mat3.mat3arraysimple_vert");

static SHRINK_HWTEST_SF(ActsGl40gtfmaster0001TestSuite, TestCase_000605,
    "GTF-GL40.gtf21.GL.mat3.mat3arrayindirect0_vert");

static SHRINK_HWTEST_SF(ActsGl40gtfmaster0001TestSuite, TestCase_000606,
    "GTF-GL40.gtf21.GL.mat3.mat3arrayindirect1_vert");

static SHRINK_HWTEST_SF(ActsGl40gtfmaster0001TestSuite, TestCase_000607,
    "GTF-GL40.gtf21.GL.mat3.mat3arraysimple_frag");

static SHRINK_HWTEST_SF(ActsGl40gtfmaster0001TestSuite, TestCase_000608,
    "GTF-GL40.gtf21.GL.mat3.mat3arrayindirect0_frag");

static SHRINK_HWTEST_SF(ActsGl40gtfmaster0001TestSuite, TestCase_000609,
    "GTF-GL40.gtf21.GL.mat3.mat3arrayindirect1_frag");
