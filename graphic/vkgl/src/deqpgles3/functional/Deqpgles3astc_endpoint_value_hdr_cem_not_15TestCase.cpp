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

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027528,
        "dEQP-GLES3.functional.texture.compresse",
        "d.astc.endpoint_value_hdr_cem_not_15.4x4");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027529,
        "dEQP-GLES3.functional.texture.compresse",
        "d.astc.endpoint_value_hdr_cem_not_15.5x4");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027530,
        "dEQP-GLES3.functional.texture.compresse",
        "d.astc.endpoint_value_hdr_cem_not_15.5x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027531,
        "dEQP-GLES3.functional.texture.compresse",
        "d.astc.endpoint_value_hdr_cem_not_15.6x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027532,
        "dEQP-GLES3.functional.texture.compresse",
        "d.astc.endpoint_value_hdr_cem_not_15.6x6");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027533,
        "dEQP-GLES3.functional.texture.compresse",
        "d.astc.endpoint_value_hdr_cem_not_15.8x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027534,
        "dEQP-GLES3.functional.texture.compresse",
        "d.astc.endpoint_value_hdr_cem_not_15.8x6");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027535,
        "dEQP-GLES3.functional.texture.compresse",
        "d.astc.endpoint_value_hdr_cem_not_15.8x8");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027536,
        "dEQP-GLES3.functional.texture.compressed",
        ".astc.endpoint_value_hdr_cem_not_15.10x5");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027537,
        "dEQP-GLES3.functional.texture.compressed",
        ".astc.endpoint_value_hdr_cem_not_15.10x6");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027538,
        "dEQP-GLES3.functional.texture.compressed",
        ".astc.endpoint_value_hdr_cem_not_15.10x8");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027539,
        "dEQP-GLES3.functional.texture.compressed",
        ".astc.endpoint_value_hdr_cem_not_15.10x10");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027540,
        "dEQP-GLES3.functional.texture.compressed",
        ".astc.endpoint_value_hdr_cem_not_15.12x10");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027541,
        "dEQP-GLES3.functional.texture.compressed",
        ".astc.endpoint_value_hdr_cem_not_15.12x12");
