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

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025181,
        "dEQP-GLES31.functional.primitiv",
        "e_bounding_box.clear.full_clear");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025182,
        "dEQP-GLES31.functional.primitive_bound",
        "ing_box.clear.full_clear_with_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025183,
        "dEQP-GLES31.functional.primitive_bounding_box.cl",
        "ear.full_clear_with_triangles_per_primitive_bbox");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025184,
        "dEQP-GLES31.functional.primitive_",
        "bounding_box.clear.scissored_clear");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025185,
        "dEQP-GLES31.functional.primitive_bounding",
        "_box.clear.scissored_clear_with_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025186,
        "dEQP-GLES31.functional.primitive_bounding_box.clea",
        "r.scissored_clear_with_triangles_per_primitive_bbox");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025187,
        "dEQP-GLES31.functional.primitive_bou",
        "nding_box.clear.scissored_full_clear");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025188,
        "dEQP-GLES31.functional.primitive_bounding_b",
        "ox.clear.scissored_full_clear_with_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025189,
        "dEQP-GLES31.functional.primitive_bounding_box.clear.s",
        "cissored_full_clear_with_triangles_per_primitive_bbox");
