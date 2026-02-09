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
#include "../ActsDeqpgles30039TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038518,
        "dEQP-GLES3.functional.attribut",
        "e_location.bind_time.pre_attach");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038519,
        "dEQP-GLES3.functional.attribu",
        "te_location.bind_time.pre_link");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038520,
        "dEQP-GLES3.functional.attribut",
        "e_location.bind_time.post_link");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038521,
        "dEQP-GLES3.functional.attrib",
        "ute_location.bind_time.relink");

static SHRINK_HWTEST_F(ActsDeqpgles30039TestSuite, TestCase_038522,
        "dEQP-GLES3.functional.attribu",
        "te_location.bind_time.reattach");
