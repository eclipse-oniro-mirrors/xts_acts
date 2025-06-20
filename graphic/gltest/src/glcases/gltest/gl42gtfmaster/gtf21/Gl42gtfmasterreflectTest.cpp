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

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000719,
    "GTF-GL42.gtf21.GL.reflect.reflect_float_frag_ivarynconst");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000720,
    "GTF-GL42.gtf21.GL.reflect.reflect_float_vert_ivarynconst");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000721,
    "GTF-GL42.gtf21.GL.reflect.reflect_vec2_frag_ivarynconst");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000722,
    "GTF-GL42.gtf21.GL.reflect.reflect_vec2_vert_ivarynconst");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000723,
    "GTF-GL42.gtf21.GL.reflect.reflect_vec3_frag_ivarynconst");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000724,
    "GTF-GL42.gtf21.GL.reflect.reflect_vec3_vert_ivarynconst");
