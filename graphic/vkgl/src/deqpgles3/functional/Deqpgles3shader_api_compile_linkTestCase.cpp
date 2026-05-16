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
#include "../ActsDeqpgles30042TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041869,
        "dEQP-GLES3.functional.shader_api.",
        "compile_link.compile_vertex_shader");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041870,
        "dEQP-GLES3.functional.shader_api.c",
        "ompile_link.compile_fragment_shader");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041871,
        "dEQP-GLES3.functional.shader_api.",
        "compile_link.link_vertex_fragment");
