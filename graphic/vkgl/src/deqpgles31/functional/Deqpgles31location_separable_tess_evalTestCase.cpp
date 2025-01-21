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
#include "../ActsDeqpgles310022TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021859,
        "dEQP-GLES31.functional.program_interface_query",
        ".program_input.location.separable_tess_eval.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021860,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "input.location.separable_tess_eval.var_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021861,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_input.location.separable_tess_eval.patch_var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021862,
        "dEQP-GLES31.functional.program_interface_query.program_inp",
        "ut.location.separable_tess_eval.patch_var_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021863,
        "dEQP-GLES31.functional.program_interface_query.progra",
        "m_input.location.separable_tess_eval.patch_var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021864,
        "dEQP-GLES31.functional.program_interface_query.program_input.l",
        "ocation.separable_tess_eval.patch_var_struct_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021865,
        "dEQP-GLES31.functional.program_interface_query.progr",
        "am_input.location.separable_tess_eval.patch_var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021866,
        "dEQP-GLES31.functional.program_interface_query.program_input.",
        "location.separable_tess_eval.patch_var_array_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022459,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_output.location.separable_tess_eval.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022460,
        "dEQP-GLES31.functional.program_interface_query.program_o",
        "utput.location.separable_tess_eval.var_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022461,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_output.location.separable_tess_eval.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022462,
        "dEQP-GLES31.functional.program_interface_query.program_outp",
        "ut.location.separable_tess_eval.var_struct_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022463,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_output.location.separable_tess_eval.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022464,
        "dEQP-GLES31.functional.program_interface_query.program_outp",
        "ut.location.separable_tess_eval.var_array_explicit_location");
