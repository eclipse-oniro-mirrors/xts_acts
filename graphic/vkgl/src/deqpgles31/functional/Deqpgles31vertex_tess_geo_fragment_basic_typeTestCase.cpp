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

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023221,
        "dEQP-GLES31.functional.program_interface_query.transform_fee",
        "dback_varying.type.vertex_tess_geo_fragment.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023222,
        "dEQP-GLES31.functional.program_interface_query.transform_fe",
        "edback_varying.type.vertex_tess_geo_fragment.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023223,
        "dEQP-GLES31.functional.program_interface_query.transform_fe",
        "edback_varying.type.vertex_tess_geo_fragment.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023224,
        "dEQP-GLES31.functional.program_interface_query.transform_fe",
        "edback_varying.type.vertex_tess_geo_fragment.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023225,
        "dEQP-GLES31.functional.program_interface_query.transform_fee",
        "dback_varying.type.vertex_tess_geo_fragment.basic_type.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023226,
        "dEQP-GLES31.functional.program_interface_query.transform_fee",
        "dback_varying.type.vertex_tess_geo_fragment.basic_type.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023227,
        "dEQP-GLES31.functional.program_interface_query.transform_fee",
        "dback_varying.type.vertex_tess_geo_fragment.basic_type.mat3x4");