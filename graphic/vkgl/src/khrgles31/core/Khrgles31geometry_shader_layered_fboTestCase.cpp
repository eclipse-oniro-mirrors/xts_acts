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
#include "../ActsKhrgles310003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002535,
        "KHR-GLES31.core.geometry_sh",
        "ader.layered_fbo.layered_fbo");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002536,
        "KHR-GLES31.core.geometry_shader.l",
        "ayered_fbo.layered_fbo_attachments");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002537,
        "KHR-GLES31.core.geometry_shader.la",
        "yered_fbo.fb_texture_invalid_target");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002538,
        "KHR-GLES31.core.geometry_shader.layere",
        "d_fbo.fb_texture_no_fbo_bound_to_target");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002539,
        "KHR-GLES31.core.geometry_shader.laye",
        "red_fbo.fb_texture_invalid_attachment");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002540,
        "KHR-GLES31.core.geometry_shader.la",
        "yered_fbo.fb_texture_invalid_value");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002541,
        "KHR-GLES31.core.geometry_shader.layer",
        "ed_fbo.fb_texture_invalid_level_number");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002542,
        "KHR-GLES31.core.geometry_shader.layered_fbo.",
        "fb_texture_argument_refers_to_buffer_texture");
