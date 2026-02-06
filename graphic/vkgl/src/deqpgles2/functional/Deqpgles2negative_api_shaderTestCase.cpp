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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20014TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013662,
        "dEQP-GLES2.functional.negat",
        "ive_api.shader.create_shader");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013663,
        "dEQP-GLES2.functional.negat",
        "ive_api.shader.shader_source");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013664,
        "dEQP-GLES2.functional.negati",
        "ve_api.shader.compile_shader");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013665,
        "dEQP-GLES2.functional.negat",
        "ive_api.shader.delete_shader");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013666,
        "dEQP-GLES2.functional.negat",
        "ive_api.shader.shader_binary");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013667,
        "dEQP-GLES2.functional.negat",
        "ive_api.shader.attach_shader");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013668,
        "dEQP-GLES2.functional.negat",
        "ive_api.shader.detach_shader");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013669,
        "dEQP-GLES2.functional.negat",
        "ive_api.shader.link_program");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013670,
        "dEQP-GLES2.functional.nega",
        "tive_api.shader.use_program");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013671,
        "dEQP-GLES2.functional.negati",
        "ve_api.shader.delete_program");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013672,
        "dEQP-GLES2.functional.negativ",
        "e_api.shader.get_active_attrib");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013673,
        "dEQP-GLES2.functional.negative",
        "_api.shader.get_attrib_location");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013674,
        "dEQP-GLES2.functional.negative_",
        "api.shader.get_uniform_location");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013675,
        "dEQP-GLES2.functional.negative_",
        "api.shader.bind_attrib_location");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013676,
        "dEQP-GLES2.functional.negative",
        "_api.shader.get_active_uniform");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013677,
        "dEQP-GLES2.functional.negativ",
        "e_api.shader.validate_program");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013678,
        "dEQP-GLES2.functional.negative_a",
        "pi.shader.release_shader_compiler");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013679,
        "dEQP-GLES2.functional.negative_ap",
        "i.shader.uniformf_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013680,
        "dEQP-GLES2.functional.negative_api",
        ".shader.uniformf_incompatible_type");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013681,
        "dEQP-GLES2.functional.negative_ap",
        "i.shader.uniformf_invalid_location");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013682,
        "dEQP-GLES2.functional.negative_ap",
        "i.shader.uniformfv_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013683,
        "dEQP-GLES2.functional.negative_api",
        ".shader.uniformfv_incompatible_type");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013684,
        "dEQP-GLES2.functional.negative_api",
        ".shader.uniformfv_invalid_location");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013685,
        "dEQP-GLES2.functional.negative_a",
        "pi.shader.uniformfv_invalid_count");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013686,
        "dEQP-GLES2.functional.negative_ap",
        "i.shader.uniformi_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013687,
        "dEQP-GLES2.functional.negative_api",
        ".shader.uniformi_incompatible_type");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013688,
        "dEQP-GLES2.functional.negative_ap",
        "i.shader.uniformi_invalid_location");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013689,
        "dEQP-GLES2.functional.negative_ap",
        "i.shader.uniformiv_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013690,
        "dEQP-GLES2.functional.negative_api",
        ".shader.uniformiv_incompatible_type");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013691,
        "dEQP-GLES2.functional.negative_api",
        ".shader.uniformiv_invalid_location");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013692,
        "dEQP-GLES2.functional.negative_a",
        "pi.shader.uniformiv_invalid_count");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013693,
        "dEQP-GLES2.functional.negative_api.sh",
        "ader.uniform_matrixfv_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013694,
        "dEQP-GLES2.functional.negative_api.sha",
        "der.uniform_matrixfv_incompatible_type");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013695,
        "dEQP-GLES2.functional.negative_api.sh",
        "ader.uniform_matrixfv_invalid_location");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013696,
        "dEQP-GLES2.functional.negative_api.s",
        "hader.uniform_matrixfv_invalid_count");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013697,
        "dEQP-GLES2.functional.negative_api.sha",
        "der.uniform_matrixfv_invalid_transpose");
