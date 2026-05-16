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
#include "../ActsDeqpgles30001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000537,
        "dEQP-GLES3.functional.buffer.",
        "map.write.unsynchronized.array");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000538,
        "dEQP-GLES3.functional.buffer.ma",
        "p.write.unsynchronized.copy_read");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000539,
        "dEQP-GLES3.functional.buffer.map",
        ".write.unsynchronized.copy_write");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000540,
        "dEQP-GLES3.functional.buffer.map.",
        "write.unsynchronized.element_array");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000541,
        "dEQP-GLES3.functional.buffer.map",
        ".write.unsynchronized.pixel_pack");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000542,
        "dEQP-GLES3.functional.buffer.map.",
        "write.unsynchronized.pixel_unpack");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000543,
        "dEQP-GLES3.functional.buffer.map.wri",
        "te.unsynchronized.transform_feedback");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000544,
        "dEQP-GLES3.functional.buffer.m",
        "ap.write.unsynchronized.uniform");
