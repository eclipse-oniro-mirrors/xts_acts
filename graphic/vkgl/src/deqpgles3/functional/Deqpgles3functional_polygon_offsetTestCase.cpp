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
#include "../ActsDeqpgles30044TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043903,
        "dEQP-GLES3.functional.pol",
        "ygon_offset.default_enable");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043904,
        "dEQP-GLES3.functional.polygon_offs",
        "et.default_displacement_with_units");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043905,
        "dEQP-GLES3.functional.polygon_o",
        "ffset.default_render_with_units");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043906,
        "dEQP-GLES3.functional.polygon_o",
        "ffset.default_render_with_factor");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043907,
        "dEQP-GLES3.functional.polygon",
        "_offset.default_factor_0_slope");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043908,
        "dEQP-GLES3.functional.pol",
        "ygon_offset.fixed16_enable");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043909,
        "dEQP-GLES3.functional.polygon_offs",
        "et.fixed16_displacement_with_units");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043910,
        "dEQP-GLES3.functional.polygon_o",
        "ffset.fixed16_render_with_units");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043911,
        "dEQP-GLES3.functional.polygon_o",
        "ffset.fixed16_render_with_factor");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043912,
        "dEQP-GLES3.functional.polygon",
        "_offset.fixed16_factor_0_slope");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043913,
        "dEQP-GLES3.functional.pol",
        "ygon_offset.fixed24_enable");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043914,
        "dEQP-GLES3.functional.polygon_offs",
        "et.fixed24_displacement_with_units");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043915,
        "dEQP-GLES3.functional.polygon_o",
        "ffset.fixed24_render_with_units");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043916,
        "dEQP-GLES3.functional.polygon_o",
        "ffset.fixed24_render_with_factor");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043917,
        "dEQP-GLES3.functional.polygon",
        "_offset.fixed24_factor_0_slope");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043918,
        "dEQP-GLES3.functional.pol",
        "ygon_offset.float32_enable");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043919,
        "dEQP-GLES3.functional.polygon_offs",
        "et.float32_displacement_with_units");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043920,
        "dEQP-GLES3.functional.polygon_o",
        "ffset.float32_render_with_units");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043921,
        "dEQP-GLES3.functional.polygon_o",
        "ffset.float32_render_with_factor");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043922,
        "dEQP-GLES3.functional.polygon",
        "_offset.float32_factor_0_slope");
