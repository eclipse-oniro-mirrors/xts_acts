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

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023378,
        "dEQP-GLES31.functional.program_interface_query.transform_",
        "feedback_varying.type.separable_geometry.whole_array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023379,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.separable_geometry.whole_array.int");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023380,
        "dEQP-GLES31.functional.program_interface_query.transform_",
        "feedback_varying.type.separable_geometry.whole_array.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023381,
        "dEQP-GLES31.functional.program_interface_query.transform_",
        "feedback_varying.type.separable_geometry.whole_array.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023382,
        "dEQP-GLES31.functional.program_interface_query.transform_",
        "feedback_varying.type.separable_geometry.whole_array.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023383,
        "dEQP-GLES31.functional.program_interface_query.transform_",
        "feedback_varying.type.separable_geometry.whole_array.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023384,
        "dEQP-GLES31.functional.program_interface_query.transform_f",
        "eedback_varying.type.separable_geometry.whole_array.mat3x4");