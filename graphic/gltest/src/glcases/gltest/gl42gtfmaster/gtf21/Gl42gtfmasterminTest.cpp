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
#include "../Gl42gtfmasterBaseFunc.h"
#include "../ActsGl42gtfmaster0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000620,
    "GTF-GL42.gtf21.GL.min.min_float_frag_xvary_yconsthalf");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000621,
    "GTF-GL42.gtf21.GL.min.min_vec2_frag_xvary_yconsthalf");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000622,
    "GTF-GL42.gtf21.GL.min.min_vec3_frag_xvary_yconsthalf");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000623,
    "GTF-GL42.gtf21.GL.min.min_float_vert_xvary_yconsthalf");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000624,
    "GTF-GL42.gtf21.GL.min.min_vec2_vert_xvary_yconsthalf");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000625,
    "GTF-GL42.gtf21.GL.min.min_vec3_vert_xvary_yconsthalf");
