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

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011831,
        "dEQP-GLES31.functional.image_l",
        "oad_store.buffer.store.rgba32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011832,
        "dEQP-GLES31.functional.image_l",
        "oad_store.buffer.store.rgba16f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011833,
        "dEQP-GLES31.functional.image",
        "_load_store.buffer.store.r32f");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011834,
        "dEQP-GLES31.functional.image_l",
        "oad_store.buffer.store.rgba32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011835,
        "dEQP-GLES31.functional.image_l",
        "oad_store.buffer.store.rgba16ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011836,
        "dEQP-GLES31.functional.image_l",
        "oad_store.buffer.store.rgba8ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011837,
        "dEQP-GLES31.functional.image_",
        "load_store.buffer.store.r32ui");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011838,
        "dEQP-GLES31.functional.image_l",
        "oad_store.buffer.store.rgba32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011839,
        "dEQP-GLES31.functional.image_l",
        "oad_store.buffer.store.rgba16i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011840,
        "dEQP-GLES31.functional.image_",
        "load_store.buffer.store.rgba8i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011841,
        "dEQP-GLES31.functional.image",
        "_load_store.buffer.store.r32i");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011842,
        "dEQP-GLES31.functional.image_",
        "load_store.buffer.store.rgba8");
