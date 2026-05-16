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
#include "../ActsDeqpgles310019TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018287,
        "dEQP-GLES31.functional.tessellation_geometry_intera",
        "ction.render.limits.output_required_max_tessellation");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018288,
        "dEQP-GLES31.functional.tessellation_geometry_interacti",
        "on.render.limits.output_implementation_max_tessellation");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018289,
        "dEQP-GLES31.functional.tessellation_geometry_inte",
        "raction.render.limits.output_required_max_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018290,
        "dEQP-GLES31.functional.tessellation_geometry_interac",
        "tion.render.limits.output_implementation_max_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018291,
        "dEQP-GLES31.functional.tessellation_geometry_intera",
        "ction.render.limits.output_required_max_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018292,
        "dEQP-GLES31.functional.tessellation_geometry_interacti",
        "on.render.limits.output_implementation_max_invocations");
