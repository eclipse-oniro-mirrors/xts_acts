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
#include "../ActsDeqpgles310004TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003283,
        "dEQP-GLES31.functional.shaders.multisample_interpolati",
        "on.interpolate_at_offset.negative.vec4_identity_swizzle");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003284,
        "dEQP-GLES31.functional.shaders.multisample_interpola",
        "tion.interpolate_at_offset.negative.vec4_crop_swizzle");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003285,
        "dEQP-GLES31.functional.shaders.multisample_interpolat",
        "ion.interpolate_at_offset.negative.vec4_mixed_swizzle");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003286,
        "dEQP-GLES31.functional.shaders.multisample_interpola",
        "tion.interpolate_at_offset.negative.interpolate_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003287,
        "dEQP-GLES31.functional.shaders.multisample_interpola",
        "tion.interpolate_at_offset.negative.interpolate_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003288,
        "dEQP-GLES31.functional.shaders.multisample_interpola",
        "tion.interpolate_at_offset.negative.interpolate_array");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003289,
        "dEQP-GLES31.functional.shaders.multisample_interpolat",
        "ion.interpolate_at_offset.negative.interpolate_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003290,
        "dEQP-GLES31.functional.shaders.multisample_interpolation",
        ".interpolate_at_offset.negative.interpolate_struct_member");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003291,
        "dEQP-GLES31.functional.shaders.multisample_interpola",
        "tion.interpolate_at_offset.negative.interpolate_local");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003292,
        "dEQP-GLES31.functional.shaders.multisample_interpolat",
        "ion.interpolate_at_offset.negative.interpolate_global");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003293,
        "dEQP-GLES31.functional.shaders.multisample_interpolati",
        "on.interpolate_at_offset.negative.interpolate_constant");
