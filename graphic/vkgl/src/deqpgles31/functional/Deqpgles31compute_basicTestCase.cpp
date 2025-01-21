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
#include "../ActsDeqpgles310008TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007510,
        "dEQP-GLES31.functiona",
        "l.compute.basic.empty");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007511,
        "dEQP-GLES31.functional.compute.ba",
        "sic.ubo_to_ssbo_single_invocation");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007512,
        "dEQP-GLES31.functional.compute",
        ".basic.ubo_to_ssbo_single_group");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007513,
        "dEQP-GLES31.functional.compute.bas",
        "ic.ubo_to_ssbo_multiple_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007514,
        "dEQP-GLES31.functional.compute.b",
        "asic.ubo_to_ssbo_multiple_groups");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007515,
        "dEQP-GLES31.functional.compute.b",
        "asic.copy_ssbo_single_invocation");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007516,
        "dEQP-GLES31.functional.compute.ba",
        "sic.copy_ssbo_multiple_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007517,
        "dEQP-GLES31.functional.compute.",
        "basic.copy_ssbo_multiple_groups");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007518,
        "dEQP-GLES31.functional.compute.",
        "basic.ssbo_rw_single_invocation");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007519,
        "dEQP-GLES31.functional.compute",
        ".basic.ssbo_rw_multiple_groups");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007520,
        "dEQP-GLES31.functional.compute.basi",
        "c.ssbo_unsized_arr_single_invocation");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007521,
        "dEQP-GLES31.functional.compute.bas",
        "ic.ssbo_unsized_arr_multiple_groups");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007522,
        "dEQP-GLES31.functional.compute.basic",
        ".write_multiple_arr_single_invocation");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007523,
        "dEQP-GLES31.functional.compute.basi",
        "c.write_multiple_arr_multiple_groups");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007524,
        "dEQP-GLES31.functional.compute.basic.wri",
        "te_multiple_unsized_arr_single_invocation");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007525,
        "dEQP-GLES31.functional.compute.basic.wr",
        "ite_multiple_unsized_arr_multiple_groups");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007526,
        "dEQP-GLES31.functional.compute.basic",
        ".ssbo_local_barrier_single_invocation");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007527,
        "dEQP-GLES31.functional.compute.bas",
        "ic.ssbo_local_barrier_single_group");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007528,
        "dEQP-GLES31.functional.compute.basi",
        "c.ssbo_local_barrier_multiple_groups");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007529,
        "dEQP-GLES31.functional.compute",
        ".basic.ssbo_cmd_barrier_single");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007530,
        "dEQP-GLES31.functional.compute.",
        "basic.ssbo_cmd_barrier_multiple");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007531,
        "dEQP-GLES31.functional.compute.b",
        "asic.shared_var_single_invocation");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007532,
        "dEQP-GLES31.functional.compute",
        ".basic.shared_var_single_group");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007533,
        "dEQP-GLES31.functional.compute.bas",
        "ic.shared_var_multiple_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007534,
        "dEQP-GLES31.functional.compute.",
        "basic.shared_var_multiple_groups");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007535,
        "dEQP-GLES31.functional.compute.basi",
        "c.shared_atomic_op_single_invocation");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007536,
        "dEQP-GLES31.functional.compute.ba",
        "sic.shared_atomic_op_single_group");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007537,
        "dEQP-GLES31.functional.compute.basic.",
        "shared_atomic_op_multiple_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007538,
        "dEQP-GLES31.functional.compute.bas",
        "ic.shared_atomic_op_multiple_groups");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007539,
        "dEQP-GLES31.functional.compute",
        ".basic.copy_image_to_ssbo_small");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007540,
        "dEQP-GLES31.functional.compute",
        ".basic.copy_image_to_ssbo_large");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007541,
        "dEQP-GLES31.functional.compute",
        ".basic.copy_ssbo_to_image_small");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007542,
        "dEQP-GLES31.functional.compute",
        ".basic.copy_ssbo_to_image_large");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007543,
        "dEQP-GLES31.functional.compute.b",
        "asic.image_atomic_op_local_size_1");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007544,
        "dEQP-GLES31.functional.compute.b",
        "asic.image_atomic_op_local_size_8");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007545,
        "dEQP-GLES31.functional.compu",
        "te.basic.image_barrier_single");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007546,
        "dEQP-GLES31.functional.comput",
        "e.basic.image_barrier_multiple");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007547,
        "dEQP-GLES31.functional.compute.bas",
        "ic.atomic_counter_single_invocation");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007548,
        "dEQP-GLES31.functional.compute.b",
        "asic.atomic_counter_single_group");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007549,
        "dEQP-GLES31.functional.compute.basic",
        ".atomic_counter_multiple_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007550,
        "dEQP-GLES31.functional.compute.ba",
        "sic.atomic_counter_multiple_groups");
