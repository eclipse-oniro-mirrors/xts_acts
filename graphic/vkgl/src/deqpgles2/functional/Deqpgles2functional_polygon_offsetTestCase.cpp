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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20017TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016303,
        "dEQP-GLES2.functional.pol",
        "ygon_offset.default_enable");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016304,
        "dEQP-GLES2.functional.polygon_offs",
        "et.default_displacement_with_units");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016305,
        "dEQP-GLES2.functional.polygon_o",
        "ffset.default_render_with_factor");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016306,
        "dEQP-GLES2.functional.polygon",
        "_offset.default_factor_0_slope");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016307,
        "dEQP-GLES2.functional.pol",
        "ygon_offset.fixed16_enable");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016308,
        "dEQP-GLES2.functional.polygon_offs",
        "et.fixed16_displacement_with_units");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016309,
        "dEQP-GLES2.functional.polygon_o",
        "ffset.fixed16_render_with_factor");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016310,
        "dEQP-GLES2.functional.polygon",
        "_offset.fixed16_factor_0_slope");
