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

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018846,
        "dEQP-GLES31.functional.debug.negative_coverage.cal",
        "lbacks.framebuffer_fetch.last_frag_data_not_defined");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018847,
        "dEQP-GLES31.functional.debug.negative_coverage.ca",
        "llbacks.framebuffer_fetch.last_frag_data_readonly");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018848,
        "dEQP-GLES31.functional.debug.negative_coverage.c",
        "allbacks.framebuffer_fetch.invalid_inout_version");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018849,
        "dEQP-GLES31.functional.debug.negative_coverage.call",
        "backs.framebuffer_fetch.invalid_redeclaration_inout");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018850,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "callbacks.framebuffer_fetch.invalid_vertex_inout");
