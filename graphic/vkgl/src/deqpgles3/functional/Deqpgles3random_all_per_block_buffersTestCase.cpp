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
#include "../ActsDeqpgles30037TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036141,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.0");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036142,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.1");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036143,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.2");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036144,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.3");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036145,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.4");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036146,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.5");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036147,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.6");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036148,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.7");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036149,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.8");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036150,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.9");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036151,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.10");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036152,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.11");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036153,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.12");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036154,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.13");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036155,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.14");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036156,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.15");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036157,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.16");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036158,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.17");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036159,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.18");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036160,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.19");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036161,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.20");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036162,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.21");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036163,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.22");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036164,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.23");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036165,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.24");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036166,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.25");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036167,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.26");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036168,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.27");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036169,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.28");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036170,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.29");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036171,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.30");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036172,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.31");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036173,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.32");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036174,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.33");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036175,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.34");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036176,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.35");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036177,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.36");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036178,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.37");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036179,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.38");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036180,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.39");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036181,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.40");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036182,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.41");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036183,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.42");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036184,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.43");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036185,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.44");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036186,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.45");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036187,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.46");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036188,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.47");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036189,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.48");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036190,
        "dEQP-GLES3.functional.ubo.ra",
        "ndom.all_per_block_buffers.49");
