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

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011942,
        "dEQP-GLES31.functional.image_load_",
        "store.buffer.image_size.readonly_32");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011943,
        "dEQP-GLES31.functional.image_load_",
        "store.buffer.image_size.readonly_12");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011944,
        "dEQP-GLES31.functional.image_load_",
        "store.buffer.image_size.readonly_1");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011945,
        "dEQP-GLES31.functional.image_load_",
        "store.buffer.image_size.readonly_7");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011946,
        "dEQP-GLES31.functional.image_load_s",
        "tore.buffer.image_size.writeonly_32");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011947,
        "dEQP-GLES31.functional.image_load_s",
        "tore.buffer.image_size.writeonly_12");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011948,
        "dEQP-GLES31.functional.image_load_",
        "store.buffer.image_size.writeonly_1");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011949,
        "dEQP-GLES31.functional.image_load_",
        "store.buffer.image_size.writeonly_7");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011950,
        "dEQP-GLES31.functional.image_load_store",
        ".buffer.image_size.readonly_writeonly_32");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011951,
        "dEQP-GLES31.functional.image_load_store",
        ".buffer.image_size.readonly_writeonly_12");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011952,
        "dEQP-GLES31.functional.image_load_store",
        ".buffer.image_size.readonly_writeonly_1");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011953,
        "dEQP-GLES31.functional.image_load_store",
        ".buffer.image_size.readonly_writeonly_7");
