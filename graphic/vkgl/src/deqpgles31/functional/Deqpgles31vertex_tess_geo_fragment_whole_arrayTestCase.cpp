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
#include "../ActsDeqpgles310024TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023235,
        "dEQP-GLES31.functional.program_interface_query.transform_fee",
        "dback_varying.type.vertex_tess_geo_fragment.whole_array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023236,
        "dEQP-GLES31.functional.program_interface_query.transform_fe",
        "edback_varying.type.vertex_tess_geo_fragment.whole_array.int");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023237,
        "dEQP-GLES31.functional.program_interface_query.transform_fee",
        "dback_varying.type.vertex_tess_geo_fragment.whole_array.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023238,
        "dEQP-GLES31.functional.program_interface_query.transform_fee",
        "dback_varying.type.vertex_tess_geo_fragment.whole_array.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023239,
        "dEQP-GLES31.functional.program_interface_query.transform_fee",
        "dback_varying.type.vertex_tess_geo_fragment.whole_array.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023240,
        "dEQP-GLES31.functional.program_interface_query.transform_fee",
        "dback_varying.type.vertex_tess_geo_fragment.whole_array.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023241,
        "dEQP-GLES31.functional.program_interface_query.transform_feed",
        "back_varying.type.vertex_tess_geo_fragment.whole_array.mat3x4");
