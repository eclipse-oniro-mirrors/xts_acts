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

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037817,
        "dEQP-GLES31.functional.draw_base_vertex.draw_el",
        "ements_instanced_base_vertex.indices.index_byte");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037818,
        "dEQP-GLES31.functional.draw_base_vertex.draw_el",
        "ements_instanced_base_vertex.indices.index_short");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037819,
        "dEQP-GLES31.functional.draw_base_vertex.draw_e",
        "lements_instanced_base_vertex.indices.index_int");
