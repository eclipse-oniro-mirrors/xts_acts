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
#include "../ActsDeqpgles310038TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037744,
        "dEQP-GLES31.functional.draw_base_vertex.draw",
        "_elements_base_vertex.base_vertex.index_byte");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037745,
        "dEQP-GLES31.functional.draw_base_vertex.draw",
        "_elements_base_vertex.base_vertex.index_short");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037746,
        "dEQP-GLES31.functional.draw_base_vertex.dra",
        "w_elements_base_vertex.base_vertex.index_int");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037747,
        "dEQP-GLES31.functional.draw_base_vertex.draw_e",
        "lements_base_vertex.base_vertex.index_neg_byte");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037748,
        "dEQP-GLES31.functional.draw_base_vertex.draw_e",
        "lements_base_vertex.base_vertex.index_neg_short");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037749,
        "dEQP-GLES31.functional.draw_base_vertex.draw_",
        "elements_base_vertex.base_vertex.index_neg_int");
