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
#include "../ActsDeqpgles30031TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030842,
        "dEQP-GLES3.functional.fbo.",
        "api.valid_tex2d_attachments");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030843,
        "dEQP-GLES3.functional.fbo.a",
        "pi.valid_texcube_attachments");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030844,
        "dEQP-GLES3.functional.fbo",
        ".api.valid_rbo_attachments");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030845,
        "dEQP-GLES3.functional.fbo",
        ".api.attach_to_default_fbo");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030846,
        "dEQP-GLES3.functional.fbo.a",
        "pi.invalid_tex2d_attachments");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030847,
        "dEQP-GLES3.functional.fbo.ap",
        "i.invalid_texcube_attachments");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030848,
        "dEQP-GLES3.functional.fbo.",
        "api.invalid_rbo_attachments");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030849,
        "dEQP-GLES3.functional",
        ".fbo.api.attach_names");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030850,
        "dEQP-GLES3.functional.",
        "fbo.api.texture_levels");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030851,
        "dEQP-GLES3.functional.fbo.api",
        ".attachment_query_default_fbo");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030852,
        "dEQP-GLES3.functional.fbo.ap",
        "i.attachment_query_empty_fbo");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030853,
        "dEQP-GLES3.functional.fbo.",
        "api.attachment_query_tex2d");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030854,
        "dEQP-GLES3.functional.fbo.a",
        "pi.attachment_query_texcube");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030855,
        "dEQP-GLES3.functional.fbo",
        ".api.attachment_query_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030856,
        "dEQP-GLES3.functional.fbo.api.de",
        "lete_tex_2d_attached_to_bound_fbo");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030857,
        "dEQP-GLES3.functional.fbo.api.del",
        "ete_tex_cube_attached_to_bound_fbo");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030858,
        "dEQP-GLES3.functional.fbo.api.d",
        "elete_rbo_attached_to_bound_fbo");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030859,
        "dEQP-GLES3.functional.fbo.api.dele",
        "te_tex_2d_attached_to_not_bound_fbo");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030860,
        "dEQP-GLES3.functional.fbo.api.delet",
        "e_tex_cube_attached_to_not_bound_fbo");

static SHRINK_HWTEST_F(ActsDeqpgles30031TestSuite, TestCase_030861,
        "dEQP-GLES3.functional.fbo.api.del",
        "ete_rbo_attached_to_not_bound_fbo");
