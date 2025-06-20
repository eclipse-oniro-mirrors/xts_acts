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
#include "../Gl44gtfmasterBaseFunc.h"
#include "../ActsGl44gtfmaster0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl44gtfmaster0001TestSuite, TestCase_000027,
    "GTF-GL44.gtf21.GL.asin.asin_float_frag_xvary");

static SHRINK_HWTEST_SF(ActsGl44gtfmaster0001TestSuite, TestCase_000028,
    "GTF-GL44.gtf21.GL.asin.asin_vec2_frag_xvary");

static SHRINK_HWTEST_SF(ActsGl44gtfmaster0001TestSuite, TestCase_000029,
    "GTF-GL44.gtf21.GL.asin.asin_vec3_frag_xvary");

static SHRINK_HWTEST_SF(ActsGl44gtfmaster0001TestSuite, TestCase_000030,
    "GTF-GL44.gtf21.GL.asin.asin_float_vert_xvary");

static SHRINK_HWTEST_SF(ActsGl44gtfmaster0001TestSuite, TestCase_000031,
    "GTF-GL44.gtf21.GL.asin.asin_vec2_vert_xvary");

static SHRINK_HWTEST_SF(ActsGl44gtfmaster0001TestSuite, TestCase_000032,
    "GTF-GL44.gtf21.GL.asin.asin_vec3_vert_xvary");
