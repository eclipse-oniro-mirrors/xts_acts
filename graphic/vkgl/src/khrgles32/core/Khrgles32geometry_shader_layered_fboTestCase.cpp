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
#include "../Khrgles32BaseFunc.h"
#include "../ActsKhrgles320001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000157,
        "KHR-GLES32.core.geometry_sh",
        "ader.layered_fbo.layered_fbo");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000158,
        "KHR-GLES32.core.geometry_shader.l",
        "ayered_fbo.layered_fbo_attachments");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000159,
        "KHR-GLES32.core.geometry_shader.la",
        "yered_fbo.fb_texture_invalid_target");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000160,
        "KHR-GLES32.core.geometry_shader.layere",
        "d_fbo.fb_texture_no_fbo_bound_to_target");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000161,
        "KHR-GLES32.core.geometry_shader.laye",
        "red_fbo.fb_texture_invalid_attachment");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000162,
        "KHR-GLES32.core.geometry_shader.la",
        "yered_fbo.fb_texture_invalid_value");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000163,
        "KHR-GLES32.core.geometry_shader.layer",
        "ed_fbo.fb_texture_invalid_level_number");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000164,
        "KHR-GLES32.core.geometry_shader.layered_fbo.",
        "fb_texture_argument_refers_to_buffer_texture");
