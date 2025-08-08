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
#include "../ActsDeqpgles310020TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019840,
        "dEQP-GLES31.functional.debug.negative_coverage.get",
        "_error.framebuffer_fetch.last_frag_data_not_defined");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019841,
        "dEQP-GLES31.functional.debug.negative_coverage.ge",
        "t_error.framebuffer_fetch.last_frag_data_readonly");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019842,
        "dEQP-GLES31.functional.debug.negative_coverage.g",
        "et_error.framebuffer_fetch.invalid_inout_version");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019843,
        "dEQP-GLES31.functional.debug.negative_coverage.get_",
        "error.framebuffer_fetch.invalid_redeclaration_inout");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019844,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "get_error.framebuffer_fetch.invalid_vertex_inout");
