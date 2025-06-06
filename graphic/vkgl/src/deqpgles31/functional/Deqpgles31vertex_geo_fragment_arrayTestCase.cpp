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

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023199,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.vertex_geo_fragment.array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023200,
        "dEQP-GLES31.functional.program_interface_query.transfo",
        "rm_feedback_varying.type.vertex_geo_fragment.array.int");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023201,
        "dEQP-GLES31.functional.program_interface_query.transfo",
        "rm_feedback_varying.type.vertex_geo_fragment.array.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023202,
        "dEQP-GLES31.functional.program_interface_query.transfo",
        "rm_feedback_varying.type.vertex_geo_fragment.array.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023203,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.vertex_geo_fragment.array.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023204,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.vertex_geo_fragment.array.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023205,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.vertex_geo_fragment.array.mat3x4");
