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

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023242,
        "dEQP-GLES31.functional.program_interface_query.transform_f",
        "eedback_varying.type.vertex_tess_geo_fragment.struct.float");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023243,
        "dEQP-GLES31.functional.program_interface_query.transform_",
        "feedback_varying.type.vertex_tess_geo_fragment.struct.int");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023244,
        "dEQP-GLES31.functional.program_interface_query.transform_",
        "feedback_varying.type.vertex_tess_geo_fragment.struct.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023245,
        "dEQP-GLES31.functional.program_interface_query.transform_",
        "feedback_varying.type.vertex_tess_geo_fragment.struct.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023246,
        "dEQP-GLES31.functional.program_interface_query.transform_f",
        "eedback_varying.type.vertex_tess_geo_fragment.struct.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023247,
        "dEQP-GLES31.functional.program_interface_query.transform_f",
        "eedback_varying.type.vertex_tess_geo_fragment.struct.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023248,
        "dEQP-GLES31.functional.program_interface_query.transform_f",
        "eedback_varying.type.vertex_tess_geo_fragment.struct.mat3x4");