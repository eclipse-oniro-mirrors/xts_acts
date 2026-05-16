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

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000080,
        "KHR-Single-GLES32.subgroups.vot",
        "e.graphics.subgroupallequal_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000081,
        "KHR-Single-GLES32.subgroups.vote",
        ".graphics.subgroupallequal_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000082,
        "KHR-Single-GLES32.subgroups.vote",
        ".graphics.subgroupallequal_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000083,
        "KHR-Single-GLES32.subgroups.vote",
        ".graphics.subgroupallequal_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000084,
        "KHR-Single-GLES32.subgroups.v",
        "ote.graphics.subgroupall_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000085,
        "KHR-Single-GLES32.subgroups.v",
        "ote.graphics.subgroupany_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000086,
        "KHR-Single-GLES32.subgroups.vot",
        "e.graphics.subgroupallequal_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000087,
        "KHR-Single-GLES32.subgroups.vote",
        ".graphics.subgroupallequal_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000088,
        "KHR-Single-GLES32.subgroups.vote",
        ".graphics.subgroupallequal_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000089,
        "KHR-Single-GLES32.subgroups.vote",
        ".graphics.subgroupallequal_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000090,
        "KHR-Single-GLES32.subgroups.vote",
        ".graphics.subgroupallequal_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000091,
        "KHR-Single-GLES32.subgroups.vot",
        "e.graphics.subgroupallequal_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000092,
        "KHR-Single-GLES32.subgroups.vot",
        "e.graphics.subgroupallequal_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000093,
        "KHR-Single-GLES32.subgroups.vot",
        "e.graphics.subgroupallequal_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000094,
        "KHR-Single-GLES32.subgroups.vote",
        ".graphics.subgroupallequal_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000095,
        "KHR-Single-GLES32.subgroups.vote",
        ".graphics.subgroupallequal_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000096,
        "KHR-Single-GLES32.subgroups.vote",
        ".graphics.subgroupallequal_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000097,
        "KHR-Single-GLES32.subgroups.vote",
        ".graphics.subgroupallequal_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000098,
        "KHR-Single-GLES32.subgroups.vot",
        "e.graphics.subgroupallequal_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000099,
        "KHR-Single-GLES32.subgroups.vote",
        ".graphics.subgroupallequal_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000100,
        "KHR-Single-GLES32.subgroups.vote",
        ".graphics.subgroupallequal_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000101,
        "KHR-Single-GLES32.subgroups.vote",
        ".graphics.subgroupallequal_bvec4");
