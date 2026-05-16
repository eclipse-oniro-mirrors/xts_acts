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
#include "../Khrgles32BaseFunc.h"
#include "../ActsGles32KhrSingleUncover0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000212,
        "KHR-Single-GLES32.subgroups.vote.frag",
        "_helper.subgroupallequal_int_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000213,
        "KHR-Single-GLES32.subgroups.vote.frag_",
        "helper.subgroupallequal_ivec2_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000214,
        "KHR-Single-GLES32.subgroups.vote.frag_",
        "helper.subgroupallequal_ivec3_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000215,
        "KHR-Single-GLES32.subgroups.vote.frag_",
        "helper.subgroupallequal_ivec4_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000216,
        "KHR-Single-GLES32.subgroups.vote.fr",
        "ag_helper.subgroupall_uint_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000217,
        "KHR-Single-GLES32.subgroups.vote.fr",
        "ag_helper.subgroupany_uint_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000218,
        "KHR-Single-GLES32.subgroups.vote.frag",
        "_helper.subgroupallequal_uint_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000219,
        "KHR-Single-GLES32.subgroups.vote.frag_",
        "helper.subgroupallequal_uvec2_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000220,
        "KHR-Single-GLES32.subgroups.vote.frag_",
        "helper.subgroupallequal_uvec3_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000221,
        "KHR-Single-GLES32.subgroups.vote.frag_",
        "helper.subgroupallequal_uvec4_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000222,
        "KHR-Single-GLES32.subgroups.vote.frag_",
        "helper.subgroupallequal_float_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000223,
        "KHR-Single-GLES32.subgroups.vote.frag",
        "_helper.subgroupallequal_vec2_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000224,
        "KHR-Single-GLES32.subgroups.vote.frag",
        "_helper.subgroupallequal_vec3_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000225,
        "KHR-Single-GLES32.subgroups.vote.frag",
        "_helper.subgroupallequal_vec4_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000226,
        "KHR-Single-GLES32.subgroups.vote.frag_",
        "helper.subgroupallequal_double_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000227,
        "KHR-Single-GLES32.subgroups.vote.frag_",
        "helper.subgroupallequal_dvec2_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000228,
        "KHR-Single-GLES32.subgroups.vote.frag_",
        "helper.subgroupallequal_dvec3_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000229,
        "KHR-Single-GLES32.subgroups.vote.frag_",
        "helper.subgroupallequal_dvec4_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000230,
        "KHR-Single-GLES32.subgroups.vote.frag",
        "_helper.subgroupallequal_bool_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000231,
        "KHR-Single-GLES32.subgroups.vote.frag_",
        "helper.subgroupallequal_bvec2_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000232,
        "KHR-Single-GLES32.subgroups.vote.frag_",
        "helper.subgroupallequal_bvec3_fragment");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000233,
        "KHR-Single-GLES32.subgroups.vote.frag_",
        "helper.subgroupallequal_bvec4_fragment");
