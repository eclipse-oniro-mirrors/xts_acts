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
#include "../Khrgles31BaseFunc.h"
#include "../ActsKhrgles310003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002156,
        "KHR-GLES31.core.program_in",
        "terface_query.empty-shaders");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002157,
        "KHR-GLES31.core.program_int",
        "erface_query.simple-shaders");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002158,
        "KHR-GLES31.core.program_i",
        "nterface_query.input-types");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002159,
        "KHR-GLES31.core.program_int",
        "erface_query.input-built-in");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002160,
        "KHR-GLES31.core.program_in",
        "terface_query.input-layout");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002161,
        "KHR-GLES31.core.program_in",
        "terface_query.output-layout");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002162,
        "KHR-GLES31.core.program_int",
        "erface_query.output-built-in");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002163,
        "KHR-GLES31.core.program_int",
        "erface_query.uniform-simple");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002164,
        "KHR-GLES31.core.program_in",
        "terface_query.uniform-types");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002165,
        "KHR-GLES31.core.program_inter",
        "face_query.uniform-block-types");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002166,
        "KHR-GLES31.core.program_inter",
        "face_query.uniform-block-array");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002167,
        "KHR-GLES31.core.program_interfac",
        "e_query.transform-feedback-types");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002168,
        "KHR-GLES31.core.program_interface_query.t",
        "ransform-feedback-types-full-array-capture");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002169,
        "KHR-GLES31.core.program_int",
        "erface_query.atomic-counters");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002170,
        "KHR-GLES31.core.program_interface",
        "_query.atomic-counters-one-buffer");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002171,
        "KHR-GLES31.core.program_",
        "interface_query.ssb-types");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002172,
        "KHR-GLES31.core.program_i",
        "nterface_query.null-length");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002173,
        "KHR-GLES31.core.program_inte",
        "rface_query.arrays-of-arrays");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002174,
        "KHR-GLES31.core.program_int",
        "erface_query.top-level-array");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002175,
        "KHR-GLES31.core.program_interfac",
        "e_query.separate-programs-vertex");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002176,
        "KHR-GLES31.core.program_interface",
        "_query.separate-programs-fragment");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002177,
        "KHR-GLES31.core.program_in",
        "terface_query.uniform-block");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002178,
        "KHR-GLES31.core.program_i",
        "nterface_query.array-names");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002179,
        "KHR-GLES31.core.program_i",
        "nterface_query.buff-length");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002180,
        "KHR-GLES31.core.program_in",
        "terface_query.no-locations");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002181,
        "KHR-GLES31.core.program_int",
        "erface_query.query-not-used");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002182,
        "KHR-GLES31.core.program_int",
        "erface_query.relink-failure");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002183,
        "KHR-GLES31.core.program_in",
        "terface_query.link-failure");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002184,
        "KHR-GLES31.core.program_int",
        "erface_query.compute-shader");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002185,
        "KHR-GLES31.core.program_in",
        "terface_query.invalid-value");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002186,
        "KHR-GLES31.core.program_inte",
        "rface_query.invalid-operation");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002187,
        "KHR-GLES31.core.program_in",
        "terface_query.invalid-enum");
