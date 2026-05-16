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
#include "../ActsDeqpgles310012TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011887,
        "dEQP-GLES31.functional.image_load_s",
        "tore.buffer.qualifiers.coherent_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011888,
        "dEQP-GLES31.functional.image_load_s",
        "tore.buffer.qualifiers.volatile_r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011889,
        "dEQP-GLES31.functional.image_load_st",
        "ore.buffer.qualifiers.coherent_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011890,
        "dEQP-GLES31.functional.image_load_st",
        "ore.buffer.qualifiers.volatile_r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011891,
        "dEQP-GLES31.functional.image_load_s",
        "tore.buffer.qualifiers.coherent_r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011892,
        "dEQP-GLES31.functional.image_load_s",
        "tore.buffer.qualifiers.volatile_r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011893,
        "dEQP-GLES31.functional.image_load",
        "_store.buffer.qualifiers.restrict");
