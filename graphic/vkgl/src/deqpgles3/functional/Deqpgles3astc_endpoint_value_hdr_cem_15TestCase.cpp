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
#include "../ActsDeqpgles30028TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027542,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.endpoint_value_hdr_cem_15.4x4");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027543,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.endpoint_value_hdr_cem_15.5x4");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027544,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.endpoint_value_hdr_cem_15.5x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027545,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.endpoint_value_hdr_cem_15.6x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027546,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.endpoint_value_hdr_cem_15.6x6");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027547,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.endpoint_value_hdr_cem_15.8x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027548,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.endpoint_value_hdr_cem_15.8x6");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027549,
        "dEQP-GLES3.functional.texture.compres",
        "sed.astc.endpoint_value_hdr_cem_15.8x8");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027550,
        "dEQP-GLES3.functional.texture.compress",
        "ed.astc.endpoint_value_hdr_cem_15.10x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027551,
        "dEQP-GLES3.functional.texture.compress",
        "ed.astc.endpoint_value_hdr_cem_15.10x6");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027552,
        "dEQP-GLES3.functional.texture.compress",
        "ed.astc.endpoint_value_hdr_cem_15.10x8");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027553,
        "dEQP-GLES3.functional.texture.compress",
        "ed.astc.endpoint_value_hdr_cem_15.10x10");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027554,
        "dEQP-GLES3.functional.texture.compress",
        "ed.astc.endpoint_value_hdr_cem_15.12x10");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027555,
        "dEQP-GLES3.functional.texture.compress",
        "ed.astc.endpoint_value_hdr_cem_15.12x12");
