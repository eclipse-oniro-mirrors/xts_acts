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
#include "../ActsDeqpgles30002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001595,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_scalar.float_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001596,
        "dEQP-GLES3.functional.shaders.conversions",
        ".scalar_to_scalar.float_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001597,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_scalar.float_to_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001598,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_scalar.float_to_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001599,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_scalar.float_to_bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001600,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_scalar.float_to_bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001601,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_scalar.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001602,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_scalar.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001603,
        "dEQP-GLES3.functional.shaders.conversi",
        "ons.scalar_to_scalar.int_to_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001604,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_scalar.int_to_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001605,
        "dEQP-GLES3.functional.shaders.conversi",
        "ons.scalar_to_scalar.int_to_bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001606,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_scalar.int_to_bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001607,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_scalar.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001608,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_scalar.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001609,
        "dEQP-GLES3.functional.shaders.conversi",
        "ons.scalar_to_scalar.uint_to_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001610,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_scalar.uint_to_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001611,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_scalar.uint_to_bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001612,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_scalar.uint_to_bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001613,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_scalar.bool_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001614,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_scalar.bool_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001615,
        "dEQP-GLES3.functional.shaders.conversi",
        "ons.scalar_to_scalar.bool_to_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001616,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_scalar.bool_to_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001617,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_scalar.bool_to_bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001618,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_scalar.bool_to_bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001619,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_scalar.float_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001620,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_scalar.float_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001621,
        "dEQP-GLES3.functional.shaders.conversi",
        "ons.scalar_to_scalar.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001622,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_scalar.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001623,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_scalar.uint_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001624,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_scalar.uint_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001625,
        "dEQP-GLES3.functional.shaders.conversio",
        "ns.scalar_to_scalar.bool_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30002TestSuite, TestCase_001626,
        "dEQP-GLES3.functional.shaders.conversion",
        "s.scalar_to_scalar.bool_to_uint_fragment");
