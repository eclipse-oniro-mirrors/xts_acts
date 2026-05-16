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

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000494,
        "KHR-Single-GLES32.subgroups.ballot_other",
        ".framebuffer.subgroupinverseballot_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000495,
        "KHR-Single-GLES32.subgroups.ballot_other.f",
        "ramebuffer.subgroupinverseballot_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000496,
        "KHR-Single-GLES32.subgroups.ballot_other.fr",
        "amebuffer.subgroupinverseballot_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000497,
        "KHR-Single-GLES32.subgroups.ballot_other.",
        "framebuffer.subgroupinverseballot_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000498,
        "KHR-Single-GLES32.subgroups.ballot_other.f",
        "ramebuffer.subgroupballotbitextract_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000499,
        "KHR-Single-GLES32.subgroups.ballot_other.fr",
        "amebuffer.subgroupballotbitextract_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000500,
        "KHR-Single-GLES32.subgroups.ballot_other.fram",
        "ebuffer.subgroupballotbitextract_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000501,
        "KHR-Single-GLES32.subgroups.ballot_other.fr",
        "amebuffer.subgroupballotbitextract_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000502,
        "KHR-Single-GLES32.subgroups.ballot_other.",
        "framebuffer.subgroupballotbitcount_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000503,
        "KHR-Single-GLES32.subgroups.ballot_other.f",
        "ramebuffer.subgroupballotbitcount_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000504,
        "KHR-Single-GLES32.subgroups.ballot_other.fra",
        "mebuffer.subgroupballotbitcount_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000505,
        "KHR-Single-GLES32.subgroups.ballot_other.f",
        "ramebuffer.subgroupballotbitcount_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000506,
        "KHR-Single-GLES32.subgroups.ballot_other.fram",
        "ebuffer.subgroupballotinclusivebitcount_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000507,
        "KHR-Single-GLES32.subgroups.ballot_other.frameb",
        "uffer.subgroupballotinclusivebitcount_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000508,
        "KHR-Single-GLES32.subgroups.ballot_other.framebu",
        "ffer.subgroupballotinclusivebitcount_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000509,
        "KHR-Single-GLES32.subgroups.ballot_other.frame",
        "buffer.subgroupballotinclusivebitcount_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000510,
        "KHR-Single-GLES32.subgroups.ballot_other.fram",
        "ebuffer.subgroupballotexclusivebitcount_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000511,
        "KHR-Single-GLES32.subgroups.ballot_other.frameb",
        "uffer.subgroupballotexclusivebitcount_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000512,
        "KHR-Single-GLES32.subgroups.ballot_other.framebu",
        "ffer.subgroupballotexclusivebitcount_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000513,
        "KHR-Single-GLES32.subgroups.ballot_other.frame",
        "buffer.subgroupballotexclusivebitcount_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000514,
        "KHR-Single-GLES32.subgroups.ballot_other",
        ".framebuffer.subgroupballotfindlsb_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000515,
        "KHR-Single-GLES32.subgroups.ballot_other.f",
        "ramebuffer.subgroupballotfindlsb_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000516,
        "KHR-Single-GLES32.subgroups.ballot_other.fr",
        "amebuffer.subgroupballotfindlsb_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000517,
        "KHR-Single-GLES32.subgroups.ballot_other.",
        "framebuffer.subgroupballotfindlsb_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000518,
        "KHR-Single-GLES32.subgroups.ballot_other",
        ".framebuffer.subgroupballotfindmsb_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000519,
        "KHR-Single-GLES32.subgroups.ballot_other.f",
        "ramebuffer.subgroupballotfindmsb_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000520,
        "KHR-Single-GLES32.subgroups.ballot_other.fr",
        "amebuffer.subgroupballotfindmsb_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0001TestSuite, TestCase_000521,
        "KHR-Single-GLES32.subgroups.ballot_other.",
        "framebuffer.subgroupballotfindmsb_geometry");
