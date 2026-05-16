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
#include "../Khrgles3BaseFunc.h"
#include "../ActsGles3MainUncover0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000295,
        "dEQP-GLES3.functional.state_q",
        "uery.indexed.blend_isenabledi");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000296,
        "dEQP-GLES3.functional.state_query",
        ".indexed.color_mask_getintegeri_v");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000297,
        "dEQP-GLES3.functional.state_query.",
        "indexed.color_mask_getinteger64i_v");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000298,
        "dEQP-GLES3.functional.state_query",
        ".indexed.blend_func_getintegeri_v");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000299,
        "dEQP-GLES3.functional.state_query.",
        "indexed.blend_func_getinteger64i_v");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000300,
        "dEQP-GLES3.functional.state_query.i",
        "ndexed.blend_equation_getintegeri_v");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000301,
        "dEQP-GLES3.functional.state_query.in",
        "dexed.blend_equation_getinteger64i_v");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000302,
        "dEQP-GLES3.functional.state_query.index",
        "ed.blend_equation_advanced_getintegeri_v");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000303,
        "dEQP-GLES3.functional.state_query.indexe",
        "d.blend_equation_advanced_getinteger64i_v");
