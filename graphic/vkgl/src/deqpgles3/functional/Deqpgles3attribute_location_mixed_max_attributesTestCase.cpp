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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30039TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038619,
        "dEQP-GLES3.functional.attribute_l",
        "ocation.mixed_max_attributes.float");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038620,
        "dEQP-GLES3.functional.attribute_l",
        "ocation.mixed_max_attributes.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038621,
        "dEQP-GLES3.functional.attribute_l",
        "ocation.mixed_max_attributes.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038622,
        "dEQP-GLES3.functional.attribute_l",
        "ocation.mixed_max_attributes.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038623,
        "dEQP-GLES3.functional.attribute_l",
        "ocation.mixed_max_attributes.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038624,
        "dEQP-GLES3.functional.attribute_l",
        "ocation.mixed_max_attributes.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038625,
        "dEQP-GLES3.functional.attribute_l",
        "ocation.mixed_max_attributes.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038626,
        "dEQP-GLES3.functional.attribute_",
        "location.mixed_max_attributes.int");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038627,
        "dEQP-GLES3.functional.attribute_l",
        "ocation.mixed_max_attributes.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038628,
        "dEQP-GLES3.functional.attribute_l",
        "ocation.mixed_max_attributes.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038629,
        "dEQP-GLES3.functional.attribute_l",
        "ocation.mixed_max_attributes.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038630,
        "dEQP-GLES3.functional.attribute_l",
        "ocation.mixed_max_attributes.uint");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038631,
        "dEQP-GLES3.functional.attribute_l",
        "ocation.mixed_max_attributes.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038632,
        "dEQP-GLES3.functional.attribute_l",
        "ocation.mixed_max_attributes.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038633,
        "dEQP-GLES3.functional.attribute_l",
        "ocation.mixed_max_attributes.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038634,
        "dEQP-GLES3.functional.attribute_lo",
        "cation.mixed_max_attributes.mat2x2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038635,
        "dEQP-GLES3.functional.attribute_lo",
        "cation.mixed_max_attributes.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038636,
        "dEQP-GLES3.functional.attribute_lo",
        "cation.mixed_max_attributes.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038637,
        "dEQP-GLES3.functional.attribute_lo",
        "cation.mixed_max_attributes.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038638,
        "dEQP-GLES3.functional.attribute_lo",
        "cation.mixed_max_attributes.mat3x3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038639,
        "dEQP-GLES3.functional.attribute_lo",
        "cation.mixed_max_attributes.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038640,
        "dEQP-GLES3.functional.attribute_lo",
        "cation.mixed_max_attributes.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038641,
        "dEQP-GLES3.functional.attribute_lo",
        "cation.mixed_max_attributes.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038642,
        "dEQP-GLES3.functional.attribute_lo",
        "cation.mixed_max_attributes.mat4x4");
