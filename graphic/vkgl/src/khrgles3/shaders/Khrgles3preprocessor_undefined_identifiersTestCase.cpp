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
#include "../Khrgles3BaseFunc.h"
#include "../ActsKhrgles30002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001078,
        "KHR-GLES3.shaders.preprocessor.undefined_ide",
        "ntifiers.valid_undefined_identifier_1_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001079,
        "KHR-GLES3.shaders.preprocessor.undefined_iden",
        "tifiers.valid_undefined_identifier_1_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001080,
        "KHR-GLES3.shaders.preprocessor.undefined_ide",
        "ntifiers.valid_undefined_identifier_2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001081,
        "KHR-GLES3.shaders.preprocessor.undefined_iden",
        "tifiers.valid_undefined_identifier_2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001082,
        "KHR-GLES3.shaders.preprocessor.undefined_",
        "identifiers.undefined_identifier_1_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001083,
        "KHR-GLES3.shaders.preprocessor.undefined_i",
        "dentifiers.undefined_identifier_1_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001084,
        "KHR-GLES3.shaders.preprocessor.undefined_",
        "identifiers.undefined_identifier_2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001085,
        "KHR-GLES3.shaders.preprocessor.undefined_i",
        "dentifiers.undefined_identifier_2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001086,
        "KHR-GLES3.shaders.preprocessor.undefined_",
        "identifiers.undefined_identifier_3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001087,
        "KHR-GLES3.shaders.preprocessor.undefined_i",
        "dentifiers.undefined_identifier_3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001088,
        "KHR-GLES3.shaders.preprocessor.undefined_",
        "identifiers.undefined_identifier_4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001089,
        "KHR-GLES3.shaders.preprocessor.undefined_i",
        "dentifiers.undefined_identifier_4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001090,
        "KHR-GLES3.shaders.preprocessor.undefined_",
        "identifiers.undefined_identifier_5_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001091,
        "KHR-GLES3.shaders.preprocessor.undefined_i",
        "dentifiers.undefined_identifier_5_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001092,
        "KHR-GLES3.shaders.preprocessor.undefined_",
        "identifiers.undefined_identifier_6_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001093,
        "KHR-GLES3.shaders.preprocessor.undefined_i",
        "dentifiers.undefined_identifier_6_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001094,
        "KHR-GLES3.shaders.preprocessor.undefined_",
        "identifiers.undefined_identifier_7_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001095,
        "KHR-GLES3.shaders.preprocessor.undefined_i",
        "dentifiers.undefined_identifier_7_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001096,
        "KHR-GLES3.shaders.preprocessor.undefined_",
        "identifiers.undefined_identifier_8_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001097,
        "KHR-GLES3.shaders.preprocessor.undefined_i",
        "dentifiers.undefined_identifier_8_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001098,
        "KHR-GLES3.shaders.preprocessor.undefined_",
        "identifiers.undefined_identifier_9_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001099,
        "KHR-GLES3.shaders.preprocessor.undefined_i",
        "dentifiers.undefined_identifier_9_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001100,
        "KHR-GLES3.shaders.preprocessor.undefined_",
        "identifiers.undefined_identifier_10_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001101,
        "KHR-GLES3.shaders.preprocessor.undefined_i",
        "dentifiers.undefined_identifier_10_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001102,
        "KHR-GLES3.shaders.preprocessor.undefined_",
        "identifiers.undefined_identifier_11_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001103,
        "KHR-GLES3.shaders.preprocessor.undefined_i",
        "dentifiers.undefined_identifier_11_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001104,
        "KHR-GLES3.shaders.preprocessor.undefined_",
        "identifiers.undefined_identifier_12_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001105,
        "KHR-GLES3.shaders.preprocessor.undefined_i",
        "dentifiers.undefined_identifier_12_fragment");
