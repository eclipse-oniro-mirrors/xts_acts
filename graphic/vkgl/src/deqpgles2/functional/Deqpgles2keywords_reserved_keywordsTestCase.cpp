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
#include "../ActsDeqpgles20003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002305,
        "dEQP-GLES2.functional.shaders.key",
        "words.reserved_keywords.asm_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002306,
        "dEQP-GLES2.functional.shaders.keyw",
        "ords.reserved_keywords.asm_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002307,
        "dEQP-GLES2.functional.shaders.keyw",
        "ords.reserved_keywords.class_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002308,
        "dEQP-GLES2.functional.shaders.keywo",
        "rds.reserved_keywords.class_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002309,
        "dEQP-GLES2.functional.shaders.keywo",
        "rds.reserved_keywords.typedef_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002310,
        "dEQP-GLES2.functional.shaders.keywor",
        "ds.reserved_keywords.typedef_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002311,
        "dEQP-GLES2.functional.shaders.keywor",
        "ds.reserved_keywords.template_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002312,
        "dEQP-GLES2.functional.shaders.keyword",
        "s.reserved_keywords.template_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002313,
        "dEQP-GLES2.functional.shaders.keyw",
        "ords.reserved_keywords.this_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002314,
        "dEQP-GLES2.functional.shaders.keywo",
        "rds.reserved_keywords.this_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002315,
        "dEQP-GLES2.functional.shaders.keyw",
        "ords.reserved_keywords.goto_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002316,
        "dEQP-GLES2.functional.shaders.keywo",
        "rds.reserved_keywords.goto_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002317,
        "dEQP-GLES2.functional.shaders.keywo",
        "rds.reserved_keywords.switch_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002318,
        "dEQP-GLES2.functional.shaders.keywor",
        "ds.reserved_keywords.switch_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002319,
        "dEQP-GLES2.functional.shaders.keywo",
        "rds.reserved_keywords.default_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002320,
        "dEQP-GLES2.functional.shaders.keywor",
        "ds.reserved_keywords.default_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002321,
        "dEQP-GLES2.functional.shaders.keywo",
        "rds.reserved_keywords.inline_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002322,
        "dEQP-GLES2.functional.shaders.keywor",
        "ds.reserved_keywords.inline_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002323,
        "dEQP-GLES2.functional.shaders.keywor",
        "ds.reserved_keywords.volatile_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002324,
        "dEQP-GLES2.functional.shaders.keyword",
        "s.reserved_keywords.volatile_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002325,
        "dEQP-GLES2.functional.shaders.keywo",
        "rds.reserved_keywords.static_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002326,
        "dEQP-GLES2.functional.shaders.keywor",
        "ds.reserved_keywords.static_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002327,
        "dEQP-GLES2.functional.shaders.keywo",
        "rds.reserved_keywords.extern_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002328,
        "dEQP-GLES2.functional.shaders.keywor",
        "ds.reserved_keywords.extern_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002329,
        "dEQP-GLES2.functional.shaders.keywor",
        "ds.reserved_keywords.interface_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002330,
        "dEQP-GLES2.functional.shaders.keyword",
        "s.reserved_keywords.interface_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002331,
        "dEQP-GLES2.functional.shaders.keyw",
        "ords.reserved_keywords.flat_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002332,
        "dEQP-GLES2.functional.shaders.keywo",
        "rds.reserved_keywords.flat_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002333,
        "dEQP-GLES2.functional.shaders.keyw",
        "ords.reserved_keywords.short_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002334,
        "dEQP-GLES2.functional.shaders.keywo",
        "rds.reserved_keywords.short_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002335,
        "dEQP-GLES2.functional.shaders.keywor",
        "ds.reserved_keywords.unsigned_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002336,
        "dEQP-GLES2.functional.shaders.keyword",
        "s.reserved_keywords.unsigned_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002337,
        "dEQP-GLES2.functional.shaders.keywo",
        "rds.reserved_keywords.superp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002338,
        "dEQP-GLES2.functional.shaders.keywor",
        "ds.reserved_keywords.superp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002339,
        "dEQP-GLES2.functional.shaders.keywor",
        "ds.reserved_keywords.namespace_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002340,
        "dEQP-GLES2.functional.shaders.keyword",
        "s.reserved_keywords.namespace_fragment");
