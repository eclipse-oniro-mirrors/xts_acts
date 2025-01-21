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
#include "../ActsDeqpgles30032TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031413,
        "dEQP-GLES3.functional.fbo.comp",
        "leteness.samples.rbo0_none_none");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031414,
        "dEQP-GLES3.functional.fbo.comp",
        "leteness.samples.rbo1_none_none");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031415,
        "dEQP-GLES3.functional.fbo.comp",
        "leteness.samples.rbo2_none_none");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031416,
        "dEQP-GLES3.functional.fbo.comp",
        "leteness.samples.rbo0_tex_none");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031417,
        "dEQP-GLES3.functional.fbo.comp",
        "leteness.samples.rbo1_tex_none");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031418,
        "dEQP-GLES3.functional.fbo.comp",
        "leteness.samples.rbo2_tex_none");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031419,
        "dEQP-GLES3.functional.fbo.comp",
        "leteness.samples.rbo2_rbo1_none");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031420,
        "dEQP-GLES3.functional.fbo.comp",
        "leteness.samples.rbo2_rbo2_none");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031421,
        "dEQP-GLES3.functional.fbo.comp",
        "leteness.samples.rbo0_rbo0_tex");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031422,
        "dEQP-GLES3.functional.fbo.comp",
        "leteness.samples.rbo1_rbo2_rbo0");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031423,
        "dEQP-GLES3.functional.fbo.comp",
        "leteness.samples.rbo2_rbo2_rbo0");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031424,
        "dEQP-GLES3.functional.fbo.comp",
        "leteness.samples.rbo1_rbo1_rbo1");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031425,
        "dEQP-GLES3.functional.fbo.comp",
        "leteness.samples.rbo1_rbo2_rbo4");
