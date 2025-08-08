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
#include "../ActsDeqpgles310008TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007972,
        "dEQP-GLES31.functional.tesse",
        "llation.winding.triangles_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007973,
        "dEQP-GLES31.functional.tesse",
        "llation.winding.triangles_cw");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007974,
        "dEQP-GLES31.functional.tes",
        "sellation.winding.quads_ccw");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007975,
        "dEQP-GLES31.functional.tes",
        "sellation.winding.quads_cw");
