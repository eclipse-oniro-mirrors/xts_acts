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

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000521,
        "dEQP-GLES3.functional.buffer.ma",
        "p.write.explicit_flush.array_all");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000522,
        "dEQP-GLES3.functional.buffer.map.",
        "write.explicit_flush.array_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000523,
        "dEQP-GLES3.functional.buffer.map.",
        "write.explicit_flush.copy_read_all");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000524,
        "dEQP-GLES3.functional.buffer.map.wr",
        "ite.explicit_flush.copy_read_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000525,
        "dEQP-GLES3.functional.buffer.map.w",
        "rite.explicit_flush.copy_write_all");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000526,
        "dEQP-GLES3.functional.buffer.map.wri",
        "te.explicit_flush.copy_write_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000527,
        "dEQP-GLES3.functional.buffer.map.wr",
        "ite.explicit_flush.element_array_all");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000528,
        "dEQP-GLES3.functional.buffer.map.writ",
        "e.explicit_flush.element_array_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000529,
        "dEQP-GLES3.functional.buffer.map.w",
        "rite.explicit_flush.pixel_pack_all");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000530,
        "dEQP-GLES3.functional.buffer.map.wri",
        "te.explicit_flush.pixel_pack_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000531,
        "dEQP-GLES3.functional.buffer.map.wr",
        "ite.explicit_flush.pixel_unpack_all");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000532,
        "dEQP-GLES3.functional.buffer.map.writ",
        "e.explicit_flush.pixel_unpack_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000533,
        "dEQP-GLES3.functional.buffer.map.write",
        ".explicit_flush.transform_feedback_all");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000534,
        "dEQP-GLES3.functional.buffer.map.write.e",
        "xplicit_flush.transform_feedback_partial");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000535,
        "dEQP-GLES3.functional.buffer.map",
        ".write.explicit_flush.uniform_all");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000536,
        "dEQP-GLES3.functional.buffer.map.w",
        "rite.explicit_flush.uniform_partial");
