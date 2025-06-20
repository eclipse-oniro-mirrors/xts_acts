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
#include "../Khrgles31BaseFunc.h"
#include "../ActsKhrgles310002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001726,
        "KHR-GLES31.core.blend_equati",
        "on_advanced.preprocessor.none");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001727,
        "KHR-GLES31.core.blend_equation",
        "_advanced.preprocessor.require");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001728,
        "KHR-GLES31.core.blend_equatio",
        "n_advanced.preprocessor.enable");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001729,
        "KHR-GLES31.core.blend_equati",
        "on_advanced.preprocessor.warn");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001730,
        "KHR-GLES31.core.blend_equation",
        "_advanced.preprocessor.disable");
