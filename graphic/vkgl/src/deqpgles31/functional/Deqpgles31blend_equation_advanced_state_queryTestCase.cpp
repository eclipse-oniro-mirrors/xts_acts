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
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310018TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017557,
        "dEQP-GLES31.functional.blend_equation_advanced",
        ".state_query.blend_advanced_coherent_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017558,
        "dEQP-GLES31.functional.blend_equation_advanced",
        ".state_query.blend_advanced_coherent_isenabled");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017559,
        "dEQP-GLES31.functional.blend_equation_advanced",
        ".state_query.blend_advanced_coherent_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017560,
        "dEQP-GLES31.functional.blend_equation_advanced.",
        "state_query.blend_advanced_coherent_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017561,
        "dEQP-GLES31.functional.blend_equation_advance",
        "d.state_query.blend_advanced_coherent_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017562,
        "dEQP-GLES31.functional.blend_equation_adva",
        "nced.state_query.blend_equation_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017563,
        "dEQP-GLES31.functional.blend_equation_adva",
        "nced.state_query.blend_equation_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017564,
        "dEQP-GLES31.functional.blend_equation_advan",
        "ced.state_query.blend_equation_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017565,
        "dEQP-GLES31.functional.blend_equation_adv",
        "anced.state_query.blend_equation_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017566,
        "dEQP-GLES31.functional.blend_equation_advan",
        "ced.state_query.blend_equation_getbooleani_v");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017567,
        "dEQP-GLES31.functional.blend_equation_advan",
        "ced.state_query.blend_equation_getintegeri_v");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017568,
        "dEQP-GLES31.functional.blend_equation_advanc",
        "ed.state_query.blend_equation_getinteger64i_v");
