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
#include "../ActsDeqpgles310017TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016494,
        "dEQP-GLES31.functional.sample_shading.min",
        "_sample_shading.default_framebuffer_color");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016495,
        "dEQP-GLES31.functional.sample_shading.min_",
        "sample_shading.default_framebuffer_discard");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016496,
        "dEQP-GLES31.functional.sample_shading.min_samp",
        "le_shading.multisample_texture_samples_2_color");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016497,
        "dEQP-GLES31.functional.sample_shading.min_sampl",
        "e_shading.multisample_texture_samples_2_discard");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016498,
        "dEQP-GLES31.functional.sample_shading.min_samp",
        "le_shading.multisample_texture_samples_4_color");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016499,
        "dEQP-GLES31.functional.sample_shading.min_sampl",
        "e_shading.multisample_texture_samples_4_discard");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016500,
        "dEQP-GLES31.functional.sample_shading.min_samp",
        "le_shading.multisample_texture_samples_8_color");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016501,
        "dEQP-GLES31.functional.sample_shading.min_sampl",
        "e_shading.multisample_texture_samples_8_discard");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016502,
        "dEQP-GLES31.functional.sample_shading.min_samp",
        "le_shading.multisample_texture_samples_16_color");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016503,
        "dEQP-GLES31.functional.sample_shading.min_sampl",
        "e_shading.multisample_texture_samples_16_discard");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016504,
        "dEQP-GLES31.functional.sample_shading.min_sample",
        "_shading.multisample_renderbuffer_samples_2_color");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016505,
        "dEQP-GLES31.functional.sample_shading.min_sample_",
        "shading.multisample_renderbuffer_samples_2_discard");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016506,
        "dEQP-GLES31.functional.sample_shading.min_sample",
        "_shading.multisample_renderbuffer_samples_4_color");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016507,
        "dEQP-GLES31.functional.sample_shading.min_sample_",
        "shading.multisample_renderbuffer_samples_4_discard");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016508,
        "dEQP-GLES31.functional.sample_shading.min_sample",
        "_shading.multisample_renderbuffer_samples_8_color");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016509,
        "dEQP-GLES31.functional.sample_shading.min_sample_",
        "shading.multisample_renderbuffer_samples_8_discard");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016510,
        "dEQP-GLES31.functional.sample_shading.min_sample_",
        "shading.multisample_renderbuffer_samples_16_color");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016511,
        "dEQP-GLES31.functional.sample_shading.min_sample_s",
        "hading.multisample_renderbuffer_samples_16_discard");
