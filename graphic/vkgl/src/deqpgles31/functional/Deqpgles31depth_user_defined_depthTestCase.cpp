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
#include "../ActsDeqpgles310026TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025174,
        "dEQP-GLES31.functional.primitive_bounding_box.d",
        "epth.user_defined_depth.global_state_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025175,
        "dEQP-GLES31.functional.primitive_bounding_box.d",
        "epth.user_defined_depth.global_state_bbox_larger");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025176,
        "dEQP-GLES31.functional.primitive_bounding_box.d",
        "epth.user_defined_depth.per_primitive_bbox_equal");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025177,
        "dEQP-GLES31.functional.primitive_bounding_box.de",
        "pth.user_defined_depth.per_primitive_bbox_larger");
