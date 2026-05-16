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
#include "../ActsGles3MainUncover0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000181,
        "dEQP-GLES3.functional.shaders.keywords",
        ".allowed_keywords.image1DShadow_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000182,
        "dEQP-GLES3.functional.shaders.keywords.",
        "allowed_keywords.image1DShadow_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000183,
        "dEQP-GLES3.functional.shaders.keywords",
        ".allowed_keywords.image2DShadow_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000184,
        "dEQP-GLES3.functional.shaders.keywords.",
        "allowed_keywords.image2DShadow_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000185,
        "dEQP-GLES3.functional.shaders.keywords.a",
        "llowed_keywords.image1DArrayShadow_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000186,
        "dEQP-GLES3.functional.shaders.keywords.al",
        "lowed_keywords.image1DArrayShadow_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000187,
        "dEQP-GLES3.functional.shaders.keywords.a",
        "llowed_keywords.image2DArrayShadow_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000188,
        "dEQP-GLES3.functional.shaders.keywords.al",
        "lowed_keywords.image2DArrayShadow_fragment");
