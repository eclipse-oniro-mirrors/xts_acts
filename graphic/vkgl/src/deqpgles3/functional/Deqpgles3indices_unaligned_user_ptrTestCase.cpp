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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30044TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043957,
        "dEQP-GLES3.functional.draw.draw_element",
        "s.indices.unaligned_user_ptr.index_short");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043958,
        "dEQP-GLES3.functional.draw.draw_elemen",
        "ts.indices.unaligned_user_ptr.index_int");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_044024,
        "dEQP-GLES3.functional.draw.draw_elements_ins",
        "tanced.indices.unaligned_user_ptr.index_short");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_044025,
        "dEQP-GLES3.functional.draw.draw_elements_in",
        "stanced.indices.unaligned_user_ptr.index_int");
