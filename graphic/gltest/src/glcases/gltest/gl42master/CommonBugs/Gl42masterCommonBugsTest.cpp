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
#include "../Gl42masterBaseFunc.h"
#include "../ActsGl42master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000858,
    "KHR-GL42.CommonBugs.CommonBug_GetProgramivActiveUniformBlockMaxNameLength");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000859,
    "KHR-GL42.CommonBugs.CommonBug_InputVariablesCannotBeModified");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000860,
    "KHR-GL42.CommonBugs.CommonBug_InvalidUseCasesForAllNotFuncsAndExclMarkOp");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000861,
    "KHR-GL42.CommonBugs.CommonBug_InvalidVSInputs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000862,
    "KHR-GL42.CommonBugs.CommonBug_ParenthesisInLayoutQualifierIntegerValue");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000863,
    "KHR-GL42.CommonBugs.CommonBug_PerVertexValidation");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000864,
    "KHR-GL42.CommonBugs.CommonBug_ReservedNames");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000865,
    "KHR-GL42.CommonBugs.CommonBug_SparseBuffersWithCopyOps");
