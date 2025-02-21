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
#include "../ActsDeqpgles310012TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011954,
        "dEQP-GLES31.functional.image_load_store.early",
        "_fragment_tests.no_early_fragment_tests_depth");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011955,
        "dEQP-GLES31.functional.image_load_store.early_",
        "fragment_tests.no_early_fragment_tests_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011956,
        "dEQP-GLES31.functional.image_load_store.ear",
        "ly_fragment_tests.early_fragment_tests_depth");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011957,
        "dEQP-GLES31.functional.image_load_store.earl",
        "y_fragment_tests.early_fragment_tests_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011958,
        "dEQP-GLES31.functional.image_load_store.early_f",
        "ragment_tests.no_early_fragment_tests_depth_fbo");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011959,
        "dEQP-GLES31.functional.image_load_store.early_fr",
        "agment_tests.no_early_fragment_tests_stencil_fbo");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011960,
        "dEQP-GLES31.functional.image_load_store.early",
        "_fragment_tests.early_fragment_tests_depth_fbo");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011961,
        "dEQP-GLES31.functional.image_load_store.early_",
        "fragment_tests.early_fragment_tests_stencil_fbo");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011962,
        "dEQP-GLES31.functional.image_load_store.early_fragment",
        "_tests.no_early_fragment_tests_depth_fbo_with_no_depth");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011963,
        "dEQP-GLES31.functional.image_load_store.early_fragment_t",
        "ests.no_early_fragment_tests_stencil_fbo_with_no_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011964,
        "dEQP-GLES31.functional.image_load_store.early_fragme",
        "nt_tests.early_fragment_tests_depth_fbo_with_no_depth");

static SHRINK_HWTEST_F(ActsDeqpgles310012TestSuite, TestCase_011965,
        "dEQP-GLES31.functional.image_load_store.early_fragment",
        "_tests.early_fragment_tests_stencil_fbo_with_no_stencil");
