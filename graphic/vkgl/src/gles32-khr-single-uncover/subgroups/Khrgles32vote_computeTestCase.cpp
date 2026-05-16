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

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000102,
        "KHR-Single-GLES32.subgroups.vo",
        "te.compute.subgroupallequal_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000103,
        "KHR-Single-GLES32.subgroups.vot",
        "e.compute.subgroupallequal_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000104,
        "KHR-Single-GLES32.subgroups.vot",
        "e.compute.subgroupallequal_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000105,
        "KHR-Single-GLES32.subgroups.vot",
        "e.compute.subgroupallequal_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000106,
        "KHR-Single-GLES32.subgroups.",
        "vote.compute.subgroupall_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000107,
        "KHR-Single-GLES32.subgroups.",
        "vote.compute.subgroupany_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000108,
        "KHR-Single-GLES32.subgroups.vot",
        "e.compute.subgroupallequal_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000109,
        "KHR-Single-GLES32.subgroups.vot",
        "e.compute.subgroupallequal_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000110,
        "KHR-Single-GLES32.subgroups.vot",
        "e.compute.subgroupallequal_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000111,
        "KHR-Single-GLES32.subgroups.vot",
        "e.compute.subgroupallequal_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000112,
        "KHR-Single-GLES32.subgroups.vot",
        "e.compute.subgroupallequal_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000113,
        "KHR-Single-GLES32.subgroups.vot",
        "e.compute.subgroupallequal_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000114,
        "KHR-Single-GLES32.subgroups.vot",
        "e.compute.subgroupallequal_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000115,
        "KHR-Single-GLES32.subgroups.vot",
        "e.compute.subgroupallequal_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000116,
        "KHR-Single-GLES32.subgroups.vote",
        ".compute.subgroupallequal_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000117,
        "KHR-Single-GLES32.subgroups.vot",
        "e.compute.subgroupallequal_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000118,
        "KHR-Single-GLES32.subgroups.vot",
        "e.compute.subgroupallequal_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000119,
        "KHR-Single-GLES32.subgroups.vot",
        "e.compute.subgroupallequal_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000120,
        "KHR-Single-GLES32.subgroups.vot",
        "e.compute.subgroupallequal_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000121,
        "KHR-Single-GLES32.subgroups.vot",
        "e.compute.subgroupallequal_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000122,
        "KHR-Single-GLES32.subgroups.vot",
        "e.compute.subgroupallequal_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000123,
        "KHR-Single-GLES32.subgroups.vot",
        "e.compute.subgroupallequal_bvec4");
