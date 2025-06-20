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
#include "../Gl43gtfmasterBaseFunc.h"
#include "../ActsGl43gtfmaster0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000688,
    "GTF-GL43.gtf21.GL.pow.pow_float_frag_xvary_yconst2");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000689,
    "GTF-GL43.gtf21.GL.pow.pow_vec2_frag_xvary_yconst2");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000690,
    "GTF-GL43.gtf21.GL.pow.pow_vec3_frag_xvary_yconst2");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000691,
    "GTF-GL43.gtf21.GL.pow.pow_float_frag_xconst2_yvary");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000692,
    "GTF-GL43.gtf21.GL.pow.pow_vec2_frag_xconst2_yvary");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000693,
    "GTF-GL43.gtf21.GL.pow.pow_vec3_frag_xconst2_yvary");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000694,
    "GTF-GL43.gtf21.GL.pow.pow_float_frag_xvary_yconsthalf");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000695,
    "GTF-GL43.gtf21.GL.pow.pow_vec2_frag_xvary_yconsthalf");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000696,
    "GTF-GL43.gtf21.GL.pow.pow_vec3_frag_xvary_yconsthalf");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000697,
    "GTF-GL43.gtf21.GL.pow.pow_float_frag_xconsthalf_yvary");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000698,
    "GTF-GL43.gtf21.GL.pow.pow_vec2_frag_xconsthalf_yvary");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000699,
    "GTF-GL43.gtf21.GL.pow.pow_vec3_frag_xconsthalf_yvary");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000700,
    "GTF-GL43.gtf21.GL.pow.pow_float_vert_xvary_yconst2");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000701,
    "GTF-GL43.gtf21.GL.pow.pow_vec2_vert_xvary_yconst2");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000702,
    "GTF-GL43.gtf21.GL.pow.pow_vec3_vert_xvary_yconst2");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000703,
    "GTF-GL43.gtf21.GL.pow.pow_float_vert_xconst2_yvary");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000704,
    "GTF-GL43.gtf21.GL.pow.pow_vec2_vert_xconst2_yvary");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000705,
    "GTF-GL43.gtf21.GL.pow.pow_vec3_vert_xconst2_yvary");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000706,
    "GTF-GL43.gtf21.GL.pow.pow_float_vert_xvary_yconsthalf");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000707,
    "GTF-GL43.gtf21.GL.pow.pow_vec2_vert_xvary_yconsthalf");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000708,
    "GTF-GL43.gtf21.GL.pow.pow_vec3_vert_xvary_yconsthalf");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000709,
    "GTF-GL43.gtf21.GL.pow.pow_float_vert_xconsthalf_yvary");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000710,
    "GTF-GL43.gtf21.GL.pow.pow_vec2_vert_xconsthalf_yvary");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000711,
    "GTF-GL43.gtf21.GL.pow.pow_vec3_vert_xconsthalf_yvary");
