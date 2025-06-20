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
#include "../Gl43masterBaseFunc.h"
#include "../ActsGl43master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006327,
    "KHR-GL43.sparse_texture_tests.TextureParameterQueries");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006328,
    "KHR-GL43.sparse_texture_tests.InternalFormatQueries");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006329,
    "KHR-GL43.sparse_texture_tests.SimpleQueries");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006330,
    "KHR-GL43.sparse_texture_tests.SparseTextureAllocation");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006331,
    "KHR-GL43.sparse_texture_tests.SparseTextureCommitment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006332,
    "KHR-GL43.sparse_texture_tests.SparseDSATextureCommitment");
