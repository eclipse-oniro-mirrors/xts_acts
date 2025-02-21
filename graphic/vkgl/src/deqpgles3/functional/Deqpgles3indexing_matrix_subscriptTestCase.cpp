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
#include "../ActsDeqpgles30007TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006391,
        "dEQP-GLES3.functional.shaders.indexing.matrix_",
        "subscript.mat2_static_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006392,
        "dEQP-GLES3.functional.shaders.indexing.matrix_s",
        "ubscript.mat2_static_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006393,
        "dEQP-GLES3.functional.shaders.indexing.matrix_",
        "subscript.mat2_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006394,
        "dEQP-GLES3.functional.shaders.indexing.matrix_s",
        "ubscript.mat2_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006395,
        "dEQP-GLES3.functional.shaders.indexing.matrix_su",
        "bscript.mat2_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006396,
        "dEQP-GLES3.functional.shaders.indexing.matrix_sub",
        "script.mat2_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006397,
        "dEQP-GLES3.functional.shaders.indexing.matrix_sub",
        "script.mat2_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006398,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat2_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006399,
        "dEQP-GLES3.functional.shaders.indexing.matrix_",
        "subscript.mat2_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006400,
        "dEQP-GLES3.functional.shaders.indexing.matrix_s",
        "ubscript.mat2_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006401,
        "dEQP-GLES3.functional.shaders.indexing.matrix_s",
        "ubscript.mat2_dynamic_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006402,
        "dEQP-GLES3.functional.shaders.indexing.matrix_su",
        "bscript.mat2_dynamic_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006403,
        "dEQP-GLES3.functional.shaders.indexing.matrix_sub",
        "script.mat2_dynamic_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006404,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat2_dynamic_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006405,
        "dEQP-GLES3.functional.shaders.indexing.matrix_sub",
        "script.mat2_dynamic_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006406,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat2_dynamic_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006407,
        "dEQP-GLES3.functional.shaders.indexing.matrix_su",
        "bscript.mat2_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006408,
        "dEQP-GLES3.functional.shaders.indexing.matrix_sub",
        "script.mat2_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006409,
        "dEQP-GLES3.functional.shaders.indexing.matrix_sub",
        "script.mat2_static_loop_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006410,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat2_static_loop_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006411,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat2_static_loop_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006412,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscr",
        "ipt.mat2_static_loop_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006413,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat2_static_loop_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006414,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscr",
        "ipt.mat2_static_loop_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006415,
        "dEQP-GLES3.functional.shaders.indexing.matrix_sub",
        "script.mat2_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006416,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat2_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006417,
        "dEQP-GLES3.functional.shaders.indexing.matrix_sub",
        "script.mat2_dynamic_loop_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006418,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat2_dynamic_loop_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006419,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat2_dynamic_loop_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006420,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscr",
        "ipt.mat2_dynamic_loop_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006421,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscr",
        "ipt.mat2_dynamic_loop_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006422,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscri",
        "pt.mat2_dynamic_loop_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006423,
        "dEQP-GLES3.functional.shaders.indexing.matrix_s",
        "ubscript.mat2x3_static_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006424,
        "dEQP-GLES3.functional.shaders.indexing.matrix_su",
        "bscript.mat2x3_static_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006425,
        "dEQP-GLES3.functional.shaders.indexing.matrix_s",
        "ubscript.mat2x3_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006426,
        "dEQP-GLES3.functional.shaders.indexing.matrix_su",
        "bscript.mat2x3_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006427,
        "dEQP-GLES3.functional.shaders.indexing.matrix_sub",
        "script.mat2x3_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006428,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat2x3_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006429,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat2x3_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006430,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat2x3_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006431,
        "dEQP-GLES3.functional.shaders.indexing.matrix_s",
        "ubscript.mat2x3_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006432,
        "dEQP-GLES3.functional.shaders.indexing.matrix_su",
        "bscript.mat2x3_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006433,
        "dEQP-GLES3.functional.shaders.indexing.matrix_su",
        "bscript.mat2x3_dynamic_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006434,
        "dEQP-GLES3.functional.shaders.indexing.matrix_sub",
        "script.mat2x3_dynamic_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006435,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat2x3_dynamic_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006436,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat2x3_dynamic_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006437,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat2x3_dynamic_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006438,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat2x3_dynamic_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006439,
        "dEQP-GLES3.functional.shaders.indexing.matrix_sub",
        "script.mat2x3_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006440,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat2x3_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006441,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat2x3_static_loop_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006442,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat2x3_static_loop_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006443,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscr",
        "ipt.mat2x3_static_loop_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006444,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscri",
        "pt.mat2x3_static_loop_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006445,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscr",
        "ipt.mat2x3_static_loop_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006446,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscri",
        "pt.mat2x3_static_loop_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006447,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat2x3_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006448,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat2x3_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006449,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat2x3_dynamic_loop_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006450,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat2x3_dynamic_loop_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006451,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscr",
        "ipt.mat2x3_dynamic_loop_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006452,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscri",
        "pt.mat2x3_dynamic_loop_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006453,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscri",
        "pt.mat2x3_dynamic_loop_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006454,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscrip",
        "t.mat2x3_dynamic_loop_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006455,
        "dEQP-GLES3.functional.shaders.indexing.matrix_s",
        "ubscript.mat2x4_static_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006456,
        "dEQP-GLES3.functional.shaders.indexing.matrix_su",
        "bscript.mat2x4_static_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006457,
        "dEQP-GLES3.functional.shaders.indexing.matrix_s",
        "ubscript.mat2x4_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006458,
        "dEQP-GLES3.functional.shaders.indexing.matrix_su",
        "bscript.mat2x4_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006459,
        "dEQP-GLES3.functional.shaders.indexing.matrix_sub",
        "script.mat2x4_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006460,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat2x4_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006461,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat2x4_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006462,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat2x4_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006463,
        "dEQP-GLES3.functional.shaders.indexing.matrix_s",
        "ubscript.mat2x4_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006464,
        "dEQP-GLES3.functional.shaders.indexing.matrix_su",
        "bscript.mat2x4_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006465,
        "dEQP-GLES3.functional.shaders.indexing.matrix_su",
        "bscript.mat2x4_dynamic_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006466,
        "dEQP-GLES3.functional.shaders.indexing.matrix_sub",
        "script.mat2x4_dynamic_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006467,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat2x4_dynamic_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006468,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat2x4_dynamic_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006469,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat2x4_dynamic_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006470,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat2x4_dynamic_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006471,
        "dEQP-GLES3.functional.shaders.indexing.matrix_sub",
        "script.mat2x4_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006472,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat2x4_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006473,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat2x4_static_loop_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006474,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat2x4_static_loop_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006475,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscr",
        "ipt.mat2x4_static_loop_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006476,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscri",
        "pt.mat2x4_static_loop_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006477,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscr",
        "ipt.mat2x4_static_loop_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006478,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscri",
        "pt.mat2x4_static_loop_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006479,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat2x4_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006480,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat2x4_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006481,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat2x4_dynamic_loop_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006482,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat2x4_dynamic_loop_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006483,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscr",
        "ipt.mat2x4_dynamic_loop_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006484,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscri",
        "pt.mat2x4_dynamic_loop_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006485,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscri",
        "pt.mat2x4_dynamic_loop_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006486,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscrip",
        "t.mat2x4_dynamic_loop_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006487,
        "dEQP-GLES3.functional.shaders.indexing.matrix_s",
        "ubscript.mat3x2_static_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006488,
        "dEQP-GLES3.functional.shaders.indexing.matrix_su",
        "bscript.mat3x2_static_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006489,
        "dEQP-GLES3.functional.shaders.indexing.matrix_s",
        "ubscript.mat3x2_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006490,
        "dEQP-GLES3.functional.shaders.indexing.matrix_su",
        "bscript.mat3x2_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006491,
        "dEQP-GLES3.functional.shaders.indexing.matrix_sub",
        "script.mat3x2_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006492,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat3x2_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006493,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat3x2_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006494,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat3x2_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006495,
        "dEQP-GLES3.functional.shaders.indexing.matrix_s",
        "ubscript.mat3x2_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006496,
        "dEQP-GLES3.functional.shaders.indexing.matrix_su",
        "bscript.mat3x2_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006497,
        "dEQP-GLES3.functional.shaders.indexing.matrix_su",
        "bscript.mat3x2_dynamic_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006498,
        "dEQP-GLES3.functional.shaders.indexing.matrix_sub",
        "script.mat3x2_dynamic_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006499,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat3x2_dynamic_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006500,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat3x2_dynamic_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006501,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat3x2_dynamic_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006502,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat3x2_dynamic_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006503,
        "dEQP-GLES3.functional.shaders.indexing.matrix_sub",
        "script.mat3x2_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006504,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat3x2_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006505,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat3x2_static_loop_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006506,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat3x2_static_loop_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006507,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscr",
        "ipt.mat3x2_static_loop_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006508,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscri",
        "pt.mat3x2_static_loop_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006509,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscr",
        "ipt.mat3x2_static_loop_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006510,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscri",
        "pt.mat3x2_static_loop_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006511,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat3x2_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006512,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat3x2_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006513,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat3x2_dynamic_loop_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006514,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat3x2_dynamic_loop_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006515,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscr",
        "ipt.mat3x2_dynamic_loop_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006516,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscri",
        "pt.mat3x2_dynamic_loop_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006517,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscri",
        "pt.mat3x2_dynamic_loop_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006518,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscrip",
        "t.mat3x2_dynamic_loop_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006519,
        "dEQP-GLES3.functional.shaders.indexing.matrix_",
        "subscript.mat3_static_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006520,
        "dEQP-GLES3.functional.shaders.indexing.matrix_s",
        "ubscript.mat3_static_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006521,
        "dEQP-GLES3.functional.shaders.indexing.matrix_",
        "subscript.mat3_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006522,
        "dEQP-GLES3.functional.shaders.indexing.matrix_s",
        "ubscript.mat3_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006523,
        "dEQP-GLES3.functional.shaders.indexing.matrix_su",
        "bscript.mat3_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006524,
        "dEQP-GLES3.functional.shaders.indexing.matrix_sub",
        "script.mat3_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006525,
        "dEQP-GLES3.functional.shaders.indexing.matrix_sub",
        "script.mat3_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006526,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat3_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006527,
        "dEQP-GLES3.functional.shaders.indexing.matrix_",
        "subscript.mat3_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006528,
        "dEQP-GLES3.functional.shaders.indexing.matrix_s",
        "ubscript.mat3_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006529,
        "dEQP-GLES3.functional.shaders.indexing.matrix_s",
        "ubscript.mat3_dynamic_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006530,
        "dEQP-GLES3.functional.shaders.indexing.matrix_su",
        "bscript.mat3_dynamic_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006531,
        "dEQP-GLES3.functional.shaders.indexing.matrix_sub",
        "script.mat3_dynamic_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006532,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat3_dynamic_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006533,
        "dEQP-GLES3.functional.shaders.indexing.matrix_sub",
        "script.mat3_dynamic_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006534,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat3_dynamic_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006535,
        "dEQP-GLES3.functional.shaders.indexing.matrix_su",
        "bscript.mat3_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006536,
        "dEQP-GLES3.functional.shaders.indexing.matrix_sub",
        "script.mat3_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006537,
        "dEQP-GLES3.functional.shaders.indexing.matrix_sub",
        "script.mat3_static_loop_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006538,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat3_static_loop_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006539,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat3_static_loop_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006540,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscr",
        "ipt.mat3_static_loop_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006541,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat3_static_loop_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006542,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscr",
        "ipt.mat3_static_loop_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006543,
        "dEQP-GLES3.functional.shaders.indexing.matrix_sub",
        "script.mat3_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006544,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat3_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006545,
        "dEQP-GLES3.functional.shaders.indexing.matrix_sub",
        "script.mat3_dynamic_loop_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006546,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat3_dynamic_loop_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006547,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat3_dynamic_loop_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006548,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscr",
        "ipt.mat3_dynamic_loop_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006549,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscr",
        "ipt.mat3_dynamic_loop_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006550,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscri",
        "pt.mat3_dynamic_loop_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006551,
        "dEQP-GLES3.functional.shaders.indexing.matrix_s",
        "ubscript.mat3x4_static_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006552,
        "dEQP-GLES3.functional.shaders.indexing.matrix_su",
        "bscript.mat3x4_static_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006553,
        "dEQP-GLES3.functional.shaders.indexing.matrix_s",
        "ubscript.mat3x4_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006554,
        "dEQP-GLES3.functional.shaders.indexing.matrix_su",
        "bscript.mat3x4_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006555,
        "dEQP-GLES3.functional.shaders.indexing.matrix_sub",
        "script.mat3x4_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006556,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat3x4_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006557,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat3x4_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006558,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat3x4_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006559,
        "dEQP-GLES3.functional.shaders.indexing.matrix_s",
        "ubscript.mat3x4_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006560,
        "dEQP-GLES3.functional.shaders.indexing.matrix_su",
        "bscript.mat3x4_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006561,
        "dEQP-GLES3.functional.shaders.indexing.matrix_su",
        "bscript.mat3x4_dynamic_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006562,
        "dEQP-GLES3.functional.shaders.indexing.matrix_sub",
        "script.mat3x4_dynamic_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006563,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat3x4_dynamic_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006564,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat3x4_dynamic_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006565,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat3x4_dynamic_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006566,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat3x4_dynamic_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006567,
        "dEQP-GLES3.functional.shaders.indexing.matrix_sub",
        "script.mat3x4_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006568,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat3x4_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006569,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat3x4_static_loop_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006570,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat3x4_static_loop_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006571,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscr",
        "ipt.mat3x4_static_loop_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006572,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscri",
        "pt.mat3x4_static_loop_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006573,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscr",
        "ipt.mat3x4_static_loop_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006574,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscri",
        "pt.mat3x4_static_loop_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006575,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat3x4_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006576,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat3x4_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006577,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat3x4_dynamic_loop_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006578,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat3x4_dynamic_loop_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006579,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscr",
        "ipt.mat3x4_dynamic_loop_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006580,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscri",
        "pt.mat3x4_dynamic_loop_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006581,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscri",
        "pt.mat3x4_dynamic_loop_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006582,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscrip",
        "t.mat3x4_dynamic_loop_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006583,
        "dEQP-GLES3.functional.shaders.indexing.matrix_s",
        "ubscript.mat4x2_static_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006584,
        "dEQP-GLES3.functional.shaders.indexing.matrix_su",
        "bscript.mat4x2_static_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006585,
        "dEQP-GLES3.functional.shaders.indexing.matrix_s",
        "ubscript.mat4x2_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006586,
        "dEQP-GLES3.functional.shaders.indexing.matrix_su",
        "bscript.mat4x2_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006587,
        "dEQP-GLES3.functional.shaders.indexing.matrix_sub",
        "script.mat4x2_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006588,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat4x2_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006589,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat4x2_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006590,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat4x2_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006591,
        "dEQP-GLES3.functional.shaders.indexing.matrix_s",
        "ubscript.mat4x2_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006592,
        "dEQP-GLES3.functional.shaders.indexing.matrix_su",
        "bscript.mat4x2_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006593,
        "dEQP-GLES3.functional.shaders.indexing.matrix_su",
        "bscript.mat4x2_dynamic_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006594,
        "dEQP-GLES3.functional.shaders.indexing.matrix_sub",
        "script.mat4x2_dynamic_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006595,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat4x2_dynamic_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006596,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat4x2_dynamic_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006597,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat4x2_dynamic_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006598,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat4x2_dynamic_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006599,
        "dEQP-GLES3.functional.shaders.indexing.matrix_sub",
        "script.mat4x2_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006600,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat4x2_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006601,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat4x2_static_loop_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006602,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat4x2_static_loop_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006603,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscr",
        "ipt.mat4x2_static_loop_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006604,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscri",
        "pt.mat4x2_static_loop_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006605,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscr",
        "ipt.mat4x2_static_loop_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006606,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscri",
        "pt.mat4x2_static_loop_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006607,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat4x2_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006608,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat4x2_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006609,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat4x2_dynamic_loop_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006610,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat4x2_dynamic_loop_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006611,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscr",
        "ipt.mat4x2_dynamic_loop_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006612,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscri",
        "pt.mat4x2_dynamic_loop_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006613,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscri",
        "pt.mat4x2_dynamic_loop_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006614,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscrip",
        "t.mat4x2_dynamic_loop_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006615,
        "dEQP-GLES3.functional.shaders.indexing.matrix_s",
        "ubscript.mat4x3_static_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006616,
        "dEQP-GLES3.functional.shaders.indexing.matrix_su",
        "bscript.mat4x3_static_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006617,
        "dEQP-GLES3.functional.shaders.indexing.matrix_s",
        "ubscript.mat4x3_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006618,
        "dEQP-GLES3.functional.shaders.indexing.matrix_su",
        "bscript.mat4x3_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006619,
        "dEQP-GLES3.functional.shaders.indexing.matrix_sub",
        "script.mat4x3_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006620,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat4x3_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006621,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat4x3_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006622,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat4x3_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006623,
        "dEQP-GLES3.functional.shaders.indexing.matrix_s",
        "ubscript.mat4x3_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006624,
        "dEQP-GLES3.functional.shaders.indexing.matrix_su",
        "bscript.mat4x3_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006625,
        "dEQP-GLES3.functional.shaders.indexing.matrix_su",
        "bscript.mat4x3_dynamic_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006626,
        "dEQP-GLES3.functional.shaders.indexing.matrix_sub",
        "script.mat4x3_dynamic_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006627,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat4x3_dynamic_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006628,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat4x3_dynamic_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006629,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat4x3_dynamic_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006630,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat4x3_dynamic_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006631,
        "dEQP-GLES3.functional.shaders.indexing.matrix_sub",
        "script.mat4x3_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006632,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat4x3_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006633,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat4x3_static_loop_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006634,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat4x3_static_loop_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006635,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscr",
        "ipt.mat4x3_static_loop_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006636,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscri",
        "pt.mat4x3_static_loop_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006637,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscr",
        "ipt.mat4x3_static_loop_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006638,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscri",
        "pt.mat4x3_static_loop_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006639,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat4x3_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006640,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat4x3_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006641,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat4x3_dynamic_loop_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006642,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat4x3_dynamic_loop_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006643,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscr",
        "ipt.mat4x3_dynamic_loop_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006644,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscri",
        "pt.mat4x3_dynamic_loop_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006645,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscri",
        "pt.mat4x3_dynamic_loop_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006646,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscrip",
        "t.mat4x3_dynamic_loop_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006647,
        "dEQP-GLES3.functional.shaders.indexing.matrix_",
        "subscript.mat4_static_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006648,
        "dEQP-GLES3.functional.shaders.indexing.matrix_s",
        "ubscript.mat4_static_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006649,
        "dEQP-GLES3.functional.shaders.indexing.matrix_",
        "subscript.mat4_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006650,
        "dEQP-GLES3.functional.shaders.indexing.matrix_s",
        "ubscript.mat4_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006651,
        "dEQP-GLES3.functional.shaders.indexing.matrix_su",
        "bscript.mat4_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006652,
        "dEQP-GLES3.functional.shaders.indexing.matrix_sub",
        "script.mat4_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006653,
        "dEQP-GLES3.functional.shaders.indexing.matrix_sub",
        "script.mat4_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006654,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat4_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006655,
        "dEQP-GLES3.functional.shaders.indexing.matrix_",
        "subscript.mat4_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006656,
        "dEQP-GLES3.functional.shaders.indexing.matrix_s",
        "ubscript.mat4_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006657,
        "dEQP-GLES3.functional.shaders.indexing.matrix_s",
        "ubscript.mat4_dynamic_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006658,
        "dEQP-GLES3.functional.shaders.indexing.matrix_su",
        "bscript.mat4_dynamic_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006659,
        "dEQP-GLES3.functional.shaders.indexing.matrix_sub",
        "script.mat4_dynamic_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006660,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat4_dynamic_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006661,
        "dEQP-GLES3.functional.shaders.indexing.matrix_sub",
        "script.mat4_dynamic_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006662,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat4_dynamic_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006663,
        "dEQP-GLES3.functional.shaders.indexing.matrix_su",
        "bscript.mat4_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006664,
        "dEQP-GLES3.functional.shaders.indexing.matrix_sub",
        "script.mat4_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006665,
        "dEQP-GLES3.functional.shaders.indexing.matrix_sub",
        "script.mat4_static_loop_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006666,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat4_static_loop_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006667,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat4_static_loop_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006668,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscr",
        "ipt.mat4_static_loop_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006669,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat4_static_loop_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006670,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscr",
        "ipt.mat4_static_loop_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006671,
        "dEQP-GLES3.functional.shaders.indexing.matrix_sub",
        "script.mat4_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006672,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat4_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006673,
        "dEQP-GLES3.functional.shaders.indexing.matrix_sub",
        "script.mat4_dynamic_loop_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006674,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subs",
        "cript.mat4_dynamic_loop_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006675,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subsc",
        "ript.mat4_dynamic_loop_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006676,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscr",
        "ipt.mat4_dynamic_loop_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006677,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscr",
        "ipt.mat4_dynamic_loop_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006678,
        "dEQP-GLES3.functional.shaders.indexing.matrix_subscri",
        "pt.mat4_dynamic_loop_write_dynamic_loop_read_fragment");
